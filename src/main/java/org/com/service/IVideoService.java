package org.com.service;

import org.com.entity.Video;

import java.util.List;

public interface IVideoService {
    void insert(Video video);

    void update(Video video);

    void delete(String videoId) throws Exception;

    Video findById(String videoId);

    List<Video> findAll();

    List<Video> findAll(int page, int pageSize);

    List<Video> findByTitle(String title);

    List<Video> searchPaginated(String title, int page, int pageSize);

    int countByTitle(String title);

    int count();

    List<Video> findByCategoryId(int categoryId, int page, int pageSize);

    int countByCategoryId(int categoryId);

    void insertBookAuthorRelation(Long bookId, Long authorId);

    void deleteAuthorsByBookId(Long bookId);
}
