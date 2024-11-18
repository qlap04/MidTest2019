<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../../commons/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>All News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <h1>All News</h1>
    <div class="row">
        <c:forEach var="video" items="${videoList}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="${video.thumbnail}" class="card-img-top" alt="Thumbnail">
                    <div class="card-body">
                        <h5 class="card-title">${video.title}</h5>
                        <p class="card-text">${video.shortDescription}</p>
                        <a href="newsDetail?id=${video.id}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
