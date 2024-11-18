package org.com.service;

import org.com.entity.Share;

import java.util.List;

public interface IShareService {
    void save(Share share);

    List<Share> findAllWithUser();

    List<Share> findAllWithVideoId(long bookId);
}