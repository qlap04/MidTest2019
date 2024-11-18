<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Video Detail</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- Font Awesome CSS -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <style>
        /* Thay đổi màu nền của trang */
        body {
            background-color: #e8f5e9;
            color: #333333; /* Màu chữ toàn trang */
        }

        /* Kiểu dáng của container */
        .container {
            background-color: #f1f8e9;
            padding: 20px;
            border: 1px solid #c8e6c9;
            border-radius: 8px;
        }

        /* Kiểu dáng cho hộp chia sẻ */
        .share22162006-box {
            margin-top: 20px;
            padding: 10px;
            background-color: #ffffff;
            border: 1px solid #c8e6c9;
            border-radius: 5px;
        }

        /* Lớp CSS tùy chỉnh để thay đổi màu chữ */
        .text-custom-primary {
            color: #2E86C1; /* Màu xanh dương tùy chỉnh */
        }

        .text-custom-success {
            color: #28A745; /* Màu xanh lá cây tùy chỉnh */
        }

        .text-custom-danger {
            color: #DC3545; /* Màu đỏ tùy chỉnh */
        }

        .text-custom-warning {
            color: #FFC107; /* Màu vàng tùy chỉnh */
        }

        /* Thay đổi màu chữ cho tất cả thẻ <strong> */
        strong {
            color: #FF5722; /* Màu cam tùy chỉnh cho thẻ <strong> */
        }

        /* Kiểu dáng cho hình ảnh poster */
        .poster-img {
            width: 100px;
            height: 100px;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 5px;
        }

        /* Kiểu dáng cho phần thông tin video */
        .video-info p {
            margin: 5px 0;
        }

        /* Kiểu dáng cho mô tả video */
        .video-description {
            margin-top: 20px;
        }

        /* Kiểu dáng cho phần bình luận */
        .comments-section {
            margin-top: 30px;
        }

        /* Kiểu dáng cho form thêm bình luận */
        .add-comment-form {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container my-4">
    <h2 class="text-custom-primary">Chi Tiết Video</h2>

    <!-- Phần thông tin video -->
    <div style="border: 1px solid black; padding: 20px; max-width: 600px; margin: auto; background-color: #ffffff; border-radius: 8px;">
        <div style="display: flex; margin-bottom: 20px;">
            <!-- Hình ảnh Poster -->
            <div style="flex: 1; text-align: center;">
                <img
                        src="${pageContext.request.contextPath}/uploads/${video.poster}"
                        alt="${video.title} Poster"
                        class="poster-img"
                />
            </div>

            <!-- Thông tin Video -->
            <div style="flex: 2; padding-left: 20px;" class="video-info">
                <p><strong>Tiêu đề:</strong> ${video.title}</p>
                <p><strong>Mã video:</strong> ${video.id}</p>
                <p><strong>Tên danh mục:</strong> ${categories.categoryName}</p>
                <p><strong>Lượt xem:</strong> ${video.views}</p>
                <p><strong>Lượt chia sẻ:</strong> ${sizeShare}</p>
                <p><strong>Like:</strong> 10</p>
            </div>
        </div>

        <!-- Mô tả Video -->
        <div class="video-description">
            <p><strong>Mô tả:</strong></p>
            <p>${video.description}</p>
        </div>
    </div>

    <!-- Phần bình luận (Đang ẩn) -->
    <%--
    <h5 class="text-custom-success">Bình Luận</h5>
    <div class="share22162006-box">
        <c:forEach items="${video.comments}" var="comment">
            <div class="border-bottom py-2">
                <p><strong>${comment.userName}:</strong> ${comment.reviewText}</p>
            </div>
        </c:forEach>
    </div>
    --%>

    <!-- Form thêm bình luận (Đang ẩn) -->
    <%--
    <div class="add-comment-form">
        <h5 class="text-custom-success">Thêm Bình Luận</h5>
        <form action="${pageContext.request.contextPath}/comment/add" method="post">
            <input type="hidden" name="videoId" value="${video.id}"/>
            <div class="form-group">
                <label for="reviewText">Bình luận của bạn:</label>
                <textarea class="form-control" id="reviewText" name="reviewText" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary mt-2">Gửi</button>
        </form>
    </div>
    --%>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
