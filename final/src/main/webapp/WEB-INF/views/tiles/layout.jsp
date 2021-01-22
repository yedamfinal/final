<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Martine</title>
<link rel="icon" href="resources/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="resources/css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="resources/fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="resources/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">
<!-- jquery plugins here-->
<script src="resources/js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="resources/js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>
<!-- magnific js -->
<script src="resources/js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="resources/js/owl.carousel.min.js"></script>
<!-- masonry js -->
<script src="resources/js/masonry.pkgd.js"></script>
<!-- masonry js -->
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/gijgo.min.js"></script>
<!-- contact js -->
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/jquery.validate.min.js"></script>
<script src="resources/js/mail-script.js"></script>
<script src="resources/js/contact.js"></script>
<!-- custom js -->
<script src="resources/js/custom.js"></script>
<style>
article{
	min-height: 500px;
}
</style>
</head>

<body>
	<header class="main_menu">
		<tiles:insertAttribute name="header" />
	</header>
	<article>
		<tiles:insertAttribute name="content"/>
	</article>
	<footer class="footer-area">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>