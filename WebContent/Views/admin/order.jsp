<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/favicon.png">
<title>ADMIN PAGE</title>
<!-- Bootstrap CSS -->
  <link href="Views/admin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="Views/admin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="Views/admin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="Views/admin/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="Views/admin/css/style.css" rel="stylesheet">
  <link href="Views/admin/css/style-responsive.css" rel="stylesheet" />
</head>
<body>

	<!-- container section start -->
  <section id="container" class="">
    <!--header start-->
	<jsp:include page="header.jsp"></jsp:include>
    <!--header end-->

    <!--sidebar start-->
	<jsp:include page="sidebar.jsp"></jsp:include>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa fa-bars"></i> Pages</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
              <li><i class="fa fa-bars"></i>Pages</li>
              <li><i class="fa fa-square-o"></i>Pages</li>
            </ol>
          </div>
        </div>
        
        <!-- page start-->
        	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Tên người nhận</th>
			      <th scope="col">Điện thoại</th>
			      <th scope="col">Email</th>
			      <th scope="col">Địa chỉ</th>
			      <th scope="col">Quốc gia</th>
			      <th scope="col">Thành phố</th>
			      <th scope="col">Mã Zip</th>
			      <th scope="col">ID thành viên</th>
			      <th scope="col">Tổng tiền</th>
			      <th scope="col">Phương thức thanh toán</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach items="${allproduct }" var="pro">
					<tr>
				      <th scope="row">${pro.orderID }</th>
				      <td>${pro.fullName }</td>
				      <td>${pro.phone }</td>
				      <td>${pro.email }</td>
				      <td>${pro.address }</td>
				      <td>${pro.country }</td>
				      <td>${pro.city }</td>
				      <td>${pro.zipCode }</td>
				      <td>${pro.customerID }</td>
				      <td>${pro.total }</td>
				      <td>${pro.paymentMethod }</td>
				    </tr>
				</c:forEach>
			  </tbody>
			</table>
        <!-- page end-->
        
      </section>
    </section>
    <!--main content end-->
    <div class="text-right">
      
    </div>
  </section>
  <!-- container section end -->
  <!-- javascripts -->
  <script src="Views/admin/js/jquery.js"></script>
  <script src="Views/admin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="Views/admin/js/jquery.scrollTo.min.js"></script>
  <script src="Views/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!--custome script for all page-->
  <script src="Views/admin/js/scripts.js"></script>

</body>
</html>