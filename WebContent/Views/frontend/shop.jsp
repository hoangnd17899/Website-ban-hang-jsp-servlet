<%@page import="BEAN.Product"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>SHOP</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/shop.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
  </head>
<body>
	<%@include file="header.jsp" %>
	<div class="category_name">SHOP</div>

	<div>
		<div class="list-group category">
			<a class="list-group-item list-group-item-action" style="background-color: black;color: white;">Danh mục</a>
			<a href="ShopForward?category=all" class="list-group-item list-group-item-action" id="all">Tất cả sản phẩm</a>
			<a href="ShopForward?category=iPhone" class="list-group-item list-group-item-action" id="iPhone">iPhone</a>
			<a href="ShopForward?category=iPad" class="list-group-item list-group-item-action" id="iPad">iPad</a>
			<a href="ShopForward?category=Macbook" class="list-group-item list-group-item-action" id="Macbook">Macbook</a>
			<a href="ShopForward?category=iMac" class="list-group-item list-group-item-action" id="iMac">iMac</a>
			<a href="ShopForward?category=Watch" class="list-group-item list-group-item-action" id="Watch">Watch</a>
		</div>
	
		<div class="productlist">
				<c:forEach items="${listaccount }" var="pro">
					<% Product product = (Product) pageContext.getAttribute("pro");
						double price=(double)product.getPrice();
						DecimalFormat formatter = new DecimalFormat("###,###,###");%>
					<div class="card" style="width: 288px;">
						<img src="Contents/Image/Product/${pro.image }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">${pro.productName }</h5>
							<p class="card-title" style="text-align: center;color: blue"><%=formatter.format(price) %> đ</p>
							<a href="AddToCartController?id=${pro.productID }" class="btn btn-primary btnAdd">Add to Cart</a>
							<a href="SingleForward?id=${pro.productID }" class="btn btn-primary btnView">Views Detail</a>
						</div>
					</div>
				</c:forEach>
				
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:choose>
					    <c:when test="${listcount%12==0}">
					    	<c:choose>
						    	<c:when test="${currentpage > 1}">
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage-1}">Previous</a></li>
							    </c:when>    
							    <c:otherwise>
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage}">Previous</a></li>
							    </c:otherwise>
						    </c:choose>
					        <c:forEach var = "i" begin = "1" end = "${listcount/12}">
						        <li class="page-item"><a page="${i}" class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${i}">${i }</a></li>
						    </c:forEach>
						    <c:choose>
							    <c:when test="${currentpage < (listcount/12)}">
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage+1}">Next</a></li>
							    </c:when>    
							    <c:otherwise>
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage}">Next</a></li>
							    </c:otherwise>
						    </c:choose>
					    </c:when>    
					    <c:otherwise>
					    	<c:choose>
						    	<c:when test="${currentpage > 1}">
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage-1}">Previous</a></li>
							    </c:when>    
							    <c:otherwise>
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage}">Previous</a></li>
							    </c:otherwise>
						    </c:choose>
					        <c:forEach var = "i" begin = "1" end = "${listcount/12 + 1 }">
						        <li class="page-item"><a page="${i}" class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${i}">${i }</a></li>
						    </c:forEach>
						    <c:choose>
							    <c:when test="${currentpage < (listcount/12)}">
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage+1}">Next</a></li>
							    </c:when>    
							    <c:otherwise>
							        <li class="page-item"><a class="page-link" style="color: black!important" href="ShopForward?category=${cate }&page=${currentpage}">Next</a></li>
							    </c:otherwise>
						    </c:choose>
					    </c:otherwise>
					</c:choose>
				</ul>
			</nav>	
		</div>
	</div>

	<%@include file="footer.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="Views/frontend/js/shop.js"></script>
</body>
</html>