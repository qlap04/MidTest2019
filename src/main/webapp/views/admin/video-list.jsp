<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Video List</title>
    <link
            href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <link
            href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <style>
        /* Custom Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table thead th {
            background-color: #343a40;
            color: #ffffff;
            border-color: #454d55;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table img {
            max-height: 100px;
            width: auto;
            border-radius: 4px;
            transition: transform 0.2s ease-in-out;
        }

        .table img:hover {
            transform: scale(1.05);
        }

        .btn-group a.btn {
            margin: 0 2px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-group a.btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-group a.btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-group a.btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }

        .btn-group a.btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .btn-group a.btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-group a.btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .pagination .page-link {
            color: #007bff;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .pagination .page-item:hover .page-link {
            background-color: #e9ecef;
            color: #007bff;
        }

        .search-form input[type="text"] {
            margin-right: 10px;
            width: 250px;
        }

        .search-form button {
            min-width: 90px;
        }

        @media (max-width: 767.98px) {
            .container {
                padding: 20px;
            }

            .d-flex.justify-content-between.align-items-center.mb-4 {
                flex-direction: column;
                align-items: flex-start;
            }

            .d-flex.justify-content-between.align-items-center.mb-4 .btn {
                margin-top: 10px;
            }

            .table-responsive {
                overflow-x: auto;
            }

            .pagination {
                justify-content: center;
            }

            .btn-group {
                flex-direction: column;
            }

            .btn-group a.btn {
                width: 100%;
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
        <!-- Title -->
        <h2 class="text-primary fw-bold">Video List</h2>

        <!-- Search and Filter Section -->
        <div class="d-flex flex-wrap justify-content-end">
            <!-- Search Form -->
            <form
                    action="${pageContext.request.contextPath}/admin/video"
                    method="get"
                    class="search-form d-flex align-items-center me-3 mb-2"
            >
                <input
                        type="text"
                        name="title"
                        placeholder="Search by title"
                        class="form-control me-2"
                        value="${param.title}"
                />
                <button type="submit" class="btn btn-info text-white me-2">Search</button>
            </form>

            <!-- Add Video Button -->
            <a
                    href="${pageContext.request.contextPath}/admin/video/add"
                    class="btn btn-primary me-3 mb-2"
            >
                <i class="fa fa-plus"></i> Add Video
            </a>

            <!-- Filter by Category Form -->
            <form
                    action="${pageContext.request.contextPath}/admin/video"
                    method="get"
                    class="d-flex align-items-center mb-2"
            >
                <select name="categoryId" class="form-select me-2">
                    <option value="">Select Category</option>
                    <c:forEach items="${categories}" var="category">
                        <option
                                value="${category.id}"
                            ${param.categoryId == category.id ? 'selected' : ''}
                        >${category.categoryName}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-info text-white">Filter</button>
            </form>
        </div>
    </div>

    <div class="table-responsive" style="margin-top: 12px">
        <table class="table table-bordered table-hover table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Poster</th>
                <th>Views</th>
                <th>Description</th>
                <th>Active</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${videoList}" var="video">
                <tr>
                    <td>${video.id}</td>
                    <td>${video.title}</td>
                    <td>
                        <img
                                src="${pageContext.request.contextPath}/uploads/${video.poster}"
                                alt="${video.title} Poster"
                                class="img-fluid"
                        />
                    </td>
                    <td>${video.views}</td>
                    <td>${video.description}</td>
                    <td>${video.active ? 'Yes' : 'No'}</td>
                    <td>${video.category.categoryName}</td>
                    <td class="btn-group">
                        <a
                                href="${pageContext.request.contextPath}/admin/video/details?id=${video.id}"
                                class="btn btn-sm btn-primary"
                        >
                            <i class="fa fa-eye"></i> View
                        </a>
                        <a
                                href="${pageContext.request.contextPath}/admin/video/edit?id=${video.id}"
                                class="btn btn-sm btn-warning"
                        >
                            <i class="fa fa-edit"></i> Edit
                        </a>
                        <a
                                href="${pageContext.request.contextPath}/admin/video/delete?id=${video.id}"
                                class="btn btn-sm btn-danger"
                                onclick="return confirm('Are you sure you want to delete this video?');"
                        >
                            <i class="fa fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Pagination Controls -->
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a
                                class="page-link"
                                href="${pageContext.request.contextPath}/admin/video?page=${currentPage - 1}&size=${pageSize}&title=${param.title}&categoryId=${param.categoryId}"
                                aria-label="Previous"
                        >&laquo;</a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a
                                class="page-link"
                                href="${pageContext.request.contextPath}/admin/video?page=${i}&size=${pageSize}&title=${param.title}&categoryId=${param.categoryId}"
                        >${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a
                                class="page-link"
                                href="${pageContext.request.contextPath}/admin/video?page=${currentPage + 1}&size=${pageSize}&title=${param.title}&categoryId=${param.categoryId}"
                                aria-label="Next"
                        >&raquo;</a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <!-- Show Total Videos -->
        <div class="mt-2 mt-md-0">
            <h5 class="text-primary">Total Videos: ${totalVideo}</h5>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
