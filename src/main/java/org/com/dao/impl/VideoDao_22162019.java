package org.com.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.com.abstraction.AbstractDAO;
import org.com.config.JPAConfig;
import org.com.dao.IVideoDao_22162019;
import org.com.entity.Video;

import java.util.List;

public class VideoDao_22162019 extends AbstractDAO<Video, Long> implements IVideoDao_22162019 {

    public VideoDao_22162019(Class<Video> entityClass) {
        super(entityClass);
    }

    @Override
    public List<Video> findByTitle(String title) {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT v FROM Video v WHERE v.title LIKE :title";
        TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
        query.setParameter("title", "%" + title + "%");
        return query.getResultList();
    }

    @Override
    public List<Video> findAll(int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @Override
    public List<Video> searchPaginated(String title, int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT v FROM Video v WHERE v.title LIKE :title";
        TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
        query.setParameter("title", "%" + title + "%");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @Override
    public int count() {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(v) FROM Video v";
        Query query = enma.createQuery(jpql);
        return ((Long) query.getSingleResult()).intValue();
    }

    @Override
    public void insert(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        var trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        }
    }

    @Override
    public void update(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        var trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        }
    }

//    @Override
//    public Video findById(String id) {
//        EntityManager enma = JPAConfig.getEntityManager();
//        return enma.find(Video.class, Long.parseLong(id));
//    }

    @Override
    public Long getLatestBookId() {
        return 1L;
    }

    @Override
    public void insertBookAuthorRelation(Long bookId, Long authorId) {

    }

    @Override
    public void deleteAuthorsByBookId(Long bookId) {

    }

    @Override
    public List<Video> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
        return query.getResultList();
    }

//    @Override
//    public Long getLatestVideoId() {
//        EntityManager enma = JPAConfig.getEntityManager();
//        String jpql = "SELECT MAX(v.id) FROM Video v";
//        Query query = enma.createQuery(jpql);
//        return (Long) query.getSingleResult();
//    }

    @Override
    public List<Video> findByCategoryId(int categoryId, int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT v FROM Video v WHERE v.id = :categoryId";
        TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
        query.setParameter("categoryId", categoryId);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @Override
    public int countByCategoryId(int categoryId) {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(v) FROM Video v WHERE v.id = :categoryId";
        Query query = enma.createQuery(jpql);
        query.setParameter("categoryId", categoryId);
        return ((Long) query.getSingleResult()).intValue();
    }
}
