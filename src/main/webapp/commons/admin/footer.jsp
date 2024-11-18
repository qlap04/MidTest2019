<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Footer Enhancement</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- Thêm Font Awesome (nếu chưa thêm) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-pcB45cXkEghYIc18GL9CwEcHh3tH2xq74uWmvuhhuVF/ZUxC8BCvRy0mj5bMB5eMbiVrN4g+a1G4PlsafXQKAg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Thêm CSS Tùy Chỉnh -->
    <style>
        /* CSS cho Footer */
        .footer {
            background-color: #212529; /* Màu nền tối */
            color: #ffffff; /* Màu chữ trắng */
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ */
            padding: 40px 0;
        }

        .footer a {
            color: #ffffff; /* Màu liên kết trắng */
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #ffc107; /* Màu vàng khi hover */
            text-decoration: none;
        }

        .footer .fa {
            font-size: 1.5rem; /* Kích thước icon */
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .footer .fa:hover {
            transform: scale(1.2); /* Phóng to icon khi hover */
            color: #ffc107; /* Màu vàng khi hover */
        }

        .footer p strong {
            color: #ffc107; /* Màu sắc nổi bật cho nhãn */
        }

        /* Responsive Adjustments */
        @media (max-width: 767.98px) {
            .footer .container {
                flex-direction: column;
                text-align: center;
            }

            .footer .container > div {
                margin-bottom: 1.5rem;
            }

            .footer .social-icons {
                justify-content: center;
            }
        }

        /* Additional Styling for Clarity */
        .footer .student-info p {
            margin-bottom: 0.5rem;
            font-size: 1.5rem;
        }

        .footer .social-icons a {
            margin: 0 10px;
            color: #ffffff;
        }

        .footer .social-icons a:hover {
            color: #ffc107;
        }

        .footer .payment-icons img {
            max-width: 60px;
            margin: 0 10px;
            transition: transform 0.3s ease;
        }

        .footer .payment-icons img:hover {
            transform: scale(1.1);
        }

        .footer small {
            display: block;
            margin-top: 15px;
            color: #adb5bd;
        }
    </style>
</head>
<body>
<!-- BEGIN FOOTER -->
<footer class="footer">
    <div class="container d-flex justify-content-between align-items-center flex-wrap">
        <!-- Student Information -->
        <div class="student-info text-center">
            <p><strong>Full Name:</strong> Phan Quốc Lập</p>
            <p><strong>Student ID:</strong> 22162019</p>
            <p><strong>Subject Code:</strong> 12</p>
        </div>

        <!-- Social Media Links -->
        <div class="social-icons text-center mb-3">
            <a href="#" class="text-light"><i class="fa fa-facebook"></i></a>
            <a href="#" class="text-light"><i class="fa fa-twitter"></i></a>
            <a href="#" class="text-light"><i class="fa fa-linkedin"></i></a>
            <a href="#" class="text-light"><i class="fa fa-instagram"></i></a>
        </div>

        <!-- Payment Icons -->
        <div class="payment-icons text-center mb-3">
            <img src="${URL}assets/frontend/layout/img/payments/western-union.jpg"
                 alt="We accept Western Union" title="We accept Western Union">
            <img src="${URL}assets/frontend/layout/img/payments/american-express.jpg"
                 alt="We accept American Express" title="We accept American Express">
            <img src="${URL}assets/frontend/layout/img/payments/MasterCard.jpg" alt="We accept MasterCard"
                 title="We accept MasterCard">
            <img src="${URL}assets/frontend/layout/img/payments/PayPal.jpg" alt="We accept PayPal"
                 title="We accept PayPal">
            <img src="${URL}assets/frontend/layout/img/payments/visa.jpg" alt="We accept Visa"
                 title="We accept Visa">
        </div>

        <!-- Copyright -->
        <div class="text-center w-100">
            <small>&copy; 2024 <a href="#" class="text-light">Web Programming Assignment</a></small>
        </div>
    </div>
</footer>
<!-- END FOOTER -->

<!-- Thêm jQuery và Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
