package org.com.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.com.config.JPAConfig;
import org.com.dao.IUserDao_22162019;
import org.com.entity.User;

public class UserDao_22162019 implements IUserDao_22162019 {

    @Override
    public User findByUsername(String username) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT u FROM User u WHERE u.username = :username";
        try {
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (Exception e) {
            // Handle case where no result is found
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistUsername(String username) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.username = :username";
        try {
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("username", username);
            return query.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.email = :email";
        try {
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("email", email);
            return query.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(User user) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user); // JPA persist method automatically inserts the entity
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean changePassword(String username, String newEncodedPassword) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "UPDATE User u SET u.password = :newPassword WHERE u.username = :username";
        try {
            em.getTransaction().begin();
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("newPassword", newEncodedPassword);
            query.setParameter("username", username);
            int updatedCount = query.executeUpdate();
            em.getTransaction().commit();
            return updatedCount > 0;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistPhone(String phone) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.phone = :phone";
        try {
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("phone", phone);
            return query.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }
}
