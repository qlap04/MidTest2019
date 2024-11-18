package org.com.dao;

import org.com.abstraction.GenericDAO;
import org.com.entity.Video;

import java.util.List;

public interface IVideoDao_22162019 extends GenericDAO<Video, Long> {
    List<Video> findByTitle(String title);

    List<Video> findAll(int page, int pagesize);

    List<Video> searchPaginated(String title, int page, int pageSize);

    int count();

    void insert(Video video);

//    void update(Video video);

//    void delete(String videoId) throws Exception;

//    Video findById(String videoId);

//    List<Video> findAll();

    Long getLatestBookId();

    void insertBookAuthorRelation(Long bookId, Long authorId);

    void deleteAuthorsByBookId(Long bookId);

    List<Video> findByCategoryId(int categoryId, int page, int pageSize);

    int countByCategoryId(int categoryId);
}
