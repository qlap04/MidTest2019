package org.com.service.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.com.config.JPAConfig;
import org.com.entity.Share;
import org.com.service.IShareService;

import java.util.List;

public class ShareServiceImpl implements IShareService {

    @Override
    public void save(Share share) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(share);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<Share> findAllWithUser() {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT s FROM Share s JOIN FETCH s.user u";
        TypedQuery<Share> query = em.createQuery(jpql, Share.class);
        return query.getResultList();
    }

    @Override
    public List<Share> findAllWithVideoId(long videoId) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT s FROM Share s WHERE s.videoId = :videoId";
        TypedQuery<Share> query = em.createQuery(jpql, Share.class);
        query.setParameter("videoId", videoId);
        return query.getResultList();
    }
}
