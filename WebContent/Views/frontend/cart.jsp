<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="BEAN.Product"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>CART</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/cart.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="category_name">CART</div>

	<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Tình trạng</th>
                            <th scope="col" class="text-center">Số lượng</th>
                            <th scope="col" class="text-right">Thành tiền</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% 	
                    		int total=0; 
                    		DecimalFormat formatter = new DecimalFormat("###,###,###");
                    	%>
                    	<c:forEach items="${productsInCart }" var="pro">
                    		<%  
                    			Product product = (Product) pageContext.getAttribute("pro");
                    			total+=product.getPrice();
								double price=(double)product.getPrice();
							%>
							<tr>
	                            <td><img style="height: 60px; width: 60px" src="Contents/Image/Product/${pro.image }" /> </td>
	                            <td>${pro.productName }</td>
	                            <td>In stock</td>
	                            <td><input class="form-control" type="text" value="1" disabled="disabled"/></td>
	                            <td class="text-right"><%=formatter.format(price) %> đ</td>
	                            <td class="text-right"><button class="btn btn-sm btn-danger"><a style="color: white!important;" href="RemoveProductController?id=${pro.productID }"><i class="fa fa-trash"></i></a> </button> </td>
	                        </tr>
						</c:forEach>
              
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Tổng mặt hàng</td>
                            <td class="text-right"><%=formatter.format(total) %> đ</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Phí vận chuyển</td>
                            <td class="text-right">0 đ</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Tổng</strong></td>
                            <td class="text-right"><strong><%=formatter.format(total) %> đ</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
        	<div class="row text-danger" style="padding-left: 16px;font-size: 26px;"><%= request.getAttribute("message")!=null?request.getAttribute("message"):"" %></div>
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <a style="text-decoration: none;" href="ShopForward?category=all"><button class="btn btn-block btn-light">Tiếp tục mua sắm</button></a>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <a style="text-decoration: none;" href="CheckoutForward"><button class="btn btn-lg btn-block btn-dark text-light">Thanh toán</button></a>
                </div>
            </div>
        </div>
		</div>
	</div>

	<%@include file="footer.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>