<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/frontend/css/header.css">
</head>
<body>
	<div class="top">
		<img src="Views/frontend/image/1200px-Apple_logo_black.svg.png" width="30" height="30" alt="">
	</div>
	<nav class="navtop navbar navbar-expand-sm bg-light justify-content-center">
			<ul class="navbar-nav">
				<li class="logo">
					GROUP-17
				</li>
				<li class="nav-item">
					<a class="nav-link" href="IndexForward">Trang chủ</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="ShopForward?category=all">Sản phẩm</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="CartForward">Giỏ hàng</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="CheckoutForward">Thanh toán</a>
				</li>
				
				<c:choose>
				    <c:when test="${sessionScope.user != null}">
				        <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle text-info" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          ${sessionScope.user.displayName}
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					          <a class="dropdown-item" href="#">Thông tin tài khoản</a>
					          <div class="dropdown-divider"></div>
					          <a class="dropdown-item" href="LogoutForward">Đăng xuất</a>
					        </div>
					     </li>
					     <li class="cart">	    					
							<a style="color: black;" href="CartForward"><i class="fas fa-shopping-cart">(${sessionScope.cart.count})</i></a>
						</li>
				    </c:when>    
				    <c:otherwise>
				        <li class="nav-item">
							<a class="nav-link" href="LoginForward">Đăng nhập</a>
						</li>
						<li class="cart">	    					
							<a style="color: black;" href="CartForward"><i class="fas fa-shopping-cart">(0)</i></a>
						</li>
				    </c:otherwise>
				</c:choose>
									
			</ul>
	</nav>
</body>
</html>