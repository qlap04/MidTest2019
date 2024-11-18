package org.com.service.impl;

import org.com.dao.IVideoDao_22162019;
import org.com.dao.impl.VideoDao_22162019;
import org.com.entity.Video;
import org.com.service.IVideoService;

import java.util.List;

public class VideoServiceImpl implements IVideoService {
    private final IVideoDao_22162019 videoDao = new VideoDao_22162019(Video.class);

    @Override
    public void insert(Video video) {
        videoDao.insert(video);
    }

    @Override
    public void update(Video video) {
        videoDao.update(video);
    }

    @Override
    public void delete(String bookId) throws Exception {
        videoDao.delete(Long.parseLong(bookId));
    }

    @Override
    public Video findById(String bookId) {
        return videoDao.findById(Long.parseLong(bookId));
    }

    @Override
    public List<Video> findAll() {
        return videoDao.findAll();
    }

    @Override
    public List<Video> findAll(int page, int pageSize) {
        return videoDao.findAll(page, pageSize);
    }

    @Override
    public List<Video> findByTitle(String title) {
        return videoDao.findByTitle(title);
    }

    @Override
    public List<Video> searchPaginated(String title, int page, int pageSize) {
        return videoDao.searchPaginated(title, page, pageSize);
    }

    @Override
    public int countByTitle(String title) {
        return 0;
    }

    @Override
    public int count() {
        return videoDao.count();
    }

    @Override
    public List<Video> findByCategoryId(int categoryId, int page, int pageSize) {
        return videoDao.findByCategoryId(categoryId, page, pageSize);
    }

    @Override
    public int countByCategoryId(int categoryId) {
        return videoDao.countByCategoryId(categoryId);

    }

    @Override
    public void insertBookAuthorRelation(Long bookId, Long authorId) {
        videoDao.insertBookAuthorRelation(bookId, authorId);
    }

    @Override
    public void deleteAuthorsByBookId(Long bookId) {
        videoDao.deleteAuthorsByBookId(bookId);
    }
}