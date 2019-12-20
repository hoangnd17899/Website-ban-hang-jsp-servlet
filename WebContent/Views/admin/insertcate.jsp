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
            <h4 class="page-header"><i class="fa fa fa-bars"></i> Pages</h4>
            <div style="padding:5px; color:red;font-style:italic;">
		       ${errorMessage}
		    </div>
          </div>
        </div>
        
        <!-- page start-->
        <form method="post" action="InsertCategory">
		  <div class="form-group row">
		    <label for="inputPassword" class="col-sm-2 col-form-label">Tên danh mục</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="" name="CategoryName">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="inputPassword" class="col-sm-2 col-form-label">AdminID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="" name="AdminID">
		    </div>
		  </div>
		  <button type="submit" class="btn btn-primary" value="Upload" >Thêm danh mục</button>
		</form>
        	
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