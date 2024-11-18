package org.com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.com.entity.Share;
import org.com.entity.User;
import org.com.entity.Video;
import org.com.service.IShareService;
import org.com.service.IVideoService;
import org.com.service.impl.ShareServiceImpl;
import org.com.service.impl.VideoServiceImpl;

import java.io.IOException;

@WebServlet(
        urlPatterns = {
                "/share",
                "/share/add",
                "/share/edit",
                "/share/insert",
                "/share/delete"
        }
)
public class ShareController_22162019 extends HttpServlet {
    private final IShareService commentService = new ShareServiceImpl();
    private final IVideoService bookService = new VideoServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emails = req.getParameter("emails");
        String share1 = req.getParameter("share");
        String bookId = req.getParameter("bookId");
        User user = (User) req.getSession().getAttribute("account");

        Video video = bookService.findById(bookId);

        Share share = Share.builder()
                .emails(emails)
                .videoId(Long.parseLong(bookId))
                .user(user)
                .build();

        commentService.save(share);

        resp.sendRedirect(req.getContextPath() + "/admin/book/details?id=" + bookId);
    }
}