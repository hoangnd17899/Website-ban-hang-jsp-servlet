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

	<aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="ProductsForward">
                          <i class="icon_house_alt"></i>
                          <span>Trang chủ</span>
                      </a>
          </li>
          <li class="sub-menu">
            <a href="ProductsForward" class="">
                          <i class="icon_document_alt"></i>
                          <span>Danh sách sản phẩm</span>
                       
                      </a>
          </li>
          <li class="sub-menu">
            <a href="InsertForward" class="">
                          <i class="icon_desktop"></i>
                          <span>Thêm sản phẩm</span>
                          
                      </a>
          </li>
          <li class="sub-menu">
            <a href="CategoryForward" class="">
                          <i class="icon_document_alt"></i>
                          <span>Danh sách danh mục</span>
                       
                      </a>
          </li>
          <li class="sub-menu">
            <a href="InsertCategory" class="">
                          <i class="icon_desktop"></i>
                          <span>Thêm danh mục</span>
                          
                      </a>
          </li>
          <li class="sub-menu">
            <a href="OrderForward" class="">
                          <i class="icon_document_alt"></i>
                          <span>Hóa đơn</span>
                       
                      </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->

</body>
</html>