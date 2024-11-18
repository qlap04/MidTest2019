<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Video</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- Thêm Font Awesome (nếu cần) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          rel="stylesheet"
          integrity="sha512-pcB45cXkEghYIc18GL9CwEcHh3tH2xq74uWmvuhhuVF/ZUxC8BCvRy0mj5bMB5eMbiVrN4g+a1G4PlsafXQKAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Thêm CSS Tùy Chỉnh -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card-custom {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .card-custom .card-header {
            background-color: #343a40;
            color: #ffffff;
            border-bottom: none;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-custom .card-header h2 {
            margin: 0;
            font-size: 1.75rem;
        }

        .card-custom .btn-back {
            background-color: #6c757d;
            color: #ffffff;
            transition: background-color 0.3s ease;
        }

        .card-custom .btn-back:hover {
            background-color: #5a6268;
            color: #ffffff;
        }

        .btn-primary-custom {
            background-color: #28a745;
            border-color: #28a745;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-primary-custom:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-secondary-custom {
            background-color: #6c757d;
            border-color: #6c757d;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-secondary-custom:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control-file-custom {
            padding: .375rem .75rem;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .form-control-file-custom:hover {
            border-color: #28a745;
        }

        /* Responsive Adjustments */
        @media (max-width: 767.98px) {
            .card-custom .card-header {
                text-align: center;
            }

            .card-custom .btn-back {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="card card-custom">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h2>Add Video</h2>
            <a href="${pageContext.request.contextPath}/admin/video" class="btn btn-back"><i
                    class="fa fa-arrow-left"></i> Back to Video List</a>
        </div>
        <div class="card-body">
            <form role="form" action="${pageContext.request.contextPath}/admin/video/add" method="post"
                  enctype="multipart/form-data">
                <!-- Title Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Title:</label>
                    <input class="form-control" placeholder="Enter title" name="title" required/>
                </div>

                <!-- Views Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Views:</label>
                    <input type="number" class="form-control" placeholder="Enter views" name="views" required/>
                </div>

                <!-- Description Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Description:</label>
                    <textarea class="form-control" placeholder="Enter description" name="description" rows="3"
                              required></textarea>
                </div>

                <!-- Active Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Active:</label>
                    <select class="form-control" name="isActive" required>
                        <option value="true">Yes</option>
                        <option value="false">No</option>
                    </select>
                </div>

                <%--            <!-- Authors Field -->--%>
                <%--            <div class="form-group mb-3">--%>
                <%--                <label class="form-label">Authors:</label>--%>
                <%--                <select class="form-control" name="authorIds[]" multiple required>--%>
                <%--                    <c:forEach items="${authors}" var="author">--%>
                <%--                        <option value="${author.id}">${author.authorName}</option>--%>
                <%--                    </c:forEach>--%>
                <%--                </select>--%>
                <%--                <small class="form-text text-muted">Hold Ctrl (Windows) or Command (Mac) to select multiple--%>
                <%--                    authors.</small>--%>
                <%--            </div>--%>

                <!-- Category ID Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Category ID:</label>
                    <select class="form-control" name="categoryId" required>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.id}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cover Image Link Field -->
                <div class="form-group mb-3">
                    <label class="form-label">Import Cover Image using Link:</label>
                    <input type="text" class="form-control" name="coverImageLink" placeholder="Enter image URL"/>
                </div>

                <!-- Poster File Field -->
                <div class="form-group mb-4">
                    <label class="form-label">Poster:</label>
                    <input type="file" class="form-control-file form-control-file-custom" name="poster"
                           accept="image/*"/>
                </div>

                <!-- Submit and Reset Buttons -->
                <div class="d-flex justify-content-end">
                    <button type="reset" class="btn btn-secondary-custom me-2">Reset</button>
                    <button type="submit" class="btn btn-primary-custom">Add Video</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Thêm jQuery và Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
