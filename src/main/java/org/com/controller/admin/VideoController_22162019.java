package org.com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.com.entity.Category;
import org.com.entity.Share;
import org.com.entity.Video;
import org.com.service.ICategoryService;
import org.com.service.IShareService;
import org.com.service.IVideoService;
import org.com.service.impl.CategoryServiceImpl;
import org.com.service.impl.ShareServiceImpl;
import org.com.service.impl.VideoServiceImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@MultipartConfig
@WebServlet(
        urlPatterns = {
                "/admin/video",
                "/admin/video/add",
                "/admin/video/edit",
                "/admin/video/delete",
                "/admin/video/details"
        }
)
public class VideoController_22162019 extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
    private final IVideoService videoService = new VideoServiceImpl();
    private final ICategoryService categoryService = new CategoryServiceImpl();
    private final IShareService shareService = new ShareServiceImpl();
    System.Logger logger = System.getLogger(VideoController_22162019.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/video/add" -> showAddForm(req, resp);
            case "/admin/video/edit" -> showEditForm(req, resp);
            case "/admin/video/delete" -> deleteVideo(req, resp);
            case "/admin/video/details" -> showVideoDetails(req, resp);
            default -> listVideos(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/video/add" -> addVideo(req, resp);
            case "/admin/video/edit" -> updateVideo(req, resp);
            default -> listVideos(req, resp);
        }
    }

    private void listVideos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.log(System.Logger.Level.INFO, "List videos");
        String title = req.getParameter("title");
        String categoryIdParam = req.getParameter("categoryId");
        Integer categoryId =
                categoryIdParam != null && !categoryIdParam.isEmpty() ? Integer.parseInt(categoryIdParam) : null;
        int page = Optional.ofNullable(req.getParameter("page")).map(Integer::parseInt).orElse(1);
        int pageSize = Optional.ofNullable(req.getParameter("size")).map(Integer::parseInt).orElse(6);
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);

        List<Video> videoList;
        int totalItems;
        if (title != null && !title.isEmpty()) {
            videoList = videoService.searchPaginated(title, page, pageSize);
            totalItems = videoService.countByTitle(title);
            req.setAttribute("title", title);
        } else if (categoryId != null) {
            videoList = videoService.findByCategoryId(categoryId, page, pageSize);
            totalItems = videoService.countByCategoryId(categoryId);
            req.setAttribute("categoryId", categoryId);
        } else {
            videoList = videoService.findAll(page, pageSize);
            totalItems = videoService.count();
        }

        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        req.setAttribute("videoList", videoList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("totalVideo", totalItems);
        req.setAttribute("pageSize", pageSize);

        req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Video existingVideo = videoService.findById(id);
        List<Category> categories = categoryService.findAll();
        List<Category> videoCategories = categoryService.findCategoriesByVideoId(existingVideo.getId());

        req.setAttribute("video", existingVideo);
        req.setAttribute("categories", categories);
        req.setAttribute("videoCategories", videoCategories);

        req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
    }

    private void showVideoDetails(
            HttpServletRequest req, HttpServletResponse resp
    ) throws ServletException, IOException {
        String id = req.getParameter("id");
        Video video = videoService.findById(id);

        if (video == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found");
            return;
        }
        List<Category> videoCategories = categoryService.findCategoriesByVideoId(video.getId());

        req.setAttribute("categories", videoCategories.get(0));
        List<Share> shares = shareService.findAllWithVideoId(video.getId());
        video.setShares(shares);
        req.setAttribute("sizeShare", shares.size());
        req.setAttribute("video", video);
        req.getRequestDispatcher("/views/admin/video-details.jsp").forward(req, resp);
    }

    private void addVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        int views = Integer.parseInt(req.getParameter("views"));
        boolean isActive = Boolean.parseBoolean(req.getParameter("isActive"));
        Part posterPart = req.getPart("poster");
        String categoryId = req.getParameter("categoryId");

//        String[] categoryIds = req.getParameterValues("categoryIds[]");
//        List<Category> categories = new ArrayList<>();
//        if (categoryIds != null) {
//            for (String categoryIdStr : categoryIds) {
//                Long categoryId = Long.parseLong(categoryIdStr);
//                Category category = categoryService.findById(categoryId);
//                if (category != null) {
//                    categories.add(category);
//                }
//            }
//        }

        String poster = uploadPoster(req, posterPart);

        Video video = Video.builder()
                .title(title)
                .description(description)
                .views(views)
                .isActive(isActive)
                .poster(poster)
                .category(categoryService.findById(Long.parseLong(categoryId))) // Assuming one category per video
                .favorites(new ArrayList<>())
                .shares(new ArrayList<>())
                .build();

        videoService.insert(video);

        resp.sendRedirect(req.getContextPath() + "/admin/video");
    }

    private void updateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        int views = Integer.parseInt(req.getParameter("views"));
        boolean isActive = Boolean.parseBoolean(req.getParameter("isActive"));
        Part posterPart = req.getPart("poster");

        Long categoryId = Long.parseLong(req.getParameter("categoryId"));

//        String[] categoryIds = req.getParameterValues("categoryIds");
//        List<Category> selectedCategories = new ArrayList<>();
//        if (categoryIds != null) {
//            for (String categoryIdStr : categoryIds) {
//                Long categoryId = Long.parseLong(categoryIdStr);
//                Category category = categoryService.findById(categoryId);
//                if (category != null) {
//                    selectedCategories.add(category);
//                }
//            }
//        }

        String poster = uploadPoster(req, posterPart);

        Video video = videoService.findById(id);
        video.setTitle(title);
        video.setDescription(description);
        video.setViews(views);
        video.setActive(isActive);
        if (poster != null) {
            video.setPoster(poster);
        }
        video.setCategory(categoryService.findById(categoryId));  // Assuming one category per video

        videoService.update(video);

        resp.sendRedirect(req.getContextPath() + "/admin/video");
    }

    private void deleteVideo(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        try {
            videoService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/video");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String uploadPoster(HttpServletRequest req, Part posterPart) throws IOException {
        String uploadPath = req.getServletContext().getRealPath("/" + UPLOAD_DIR);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists() && !uploadDir.mkdir()) {
            throw new IOException("Failed to create upload directory.");
        }

        if (posterPart != null && posterPart.getSize() > 0) {
            String fileName = Paths.get(posterPart.getSubmittedFileName()).getFileName().toString();
            String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
            String posterName = System.currentTimeMillis() + "." + ext;
            File fileToSave = new File(uploadPath, posterName);
            posterPart.write(fileToSave.getAbsolutePath());
            return posterName;
        }
        return null;
    }
}
