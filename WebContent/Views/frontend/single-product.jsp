<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<title>SINGLE-PRODUCT</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/single-product.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
  </head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="category_name">SINGLE - PRODUCT</div>
	
	<div class="card single-product">
        <div class="row">
            <aside class="col-sm-5 border-right">
    <article class="gallery-wrap"> 
    <div class="img-big-wrap">
      <div><img src="Contents/Image/Product/${pro.image }"></div>
    </div> <!-- slider-product.// -->
    </article> <!-- gallery-wrap .end// -->
            </aside>
            <aside class="col-sm-7">
    <article class="card-body p-5">
        <h3 class="title mb-3">${pro.productName }</h3>
    
    <p class="price-detail-wrap"> 
        <span class="price h3 text-warning"> 
            <span class="currency">VND $</span><span class="num">${pro.price }</span>
        </span> 
    </p> <!-- price-detail-wrap .// -->
    <dl class="item-property">
      <dt>Mô tả</dt>
      <dd><p>${pro.description } </p></dd>
    </dl>
    <dl class="param param-feature">
      <dt>Kích thước màn hình</dt>
      <dd>${pro.screenSize }</dd>
    </dl>  <!-- item-property-hor .// -->
    <dl class="param param-feature">
      <dt>Khối lượng</dt>
      <dd>${pro.weight }</dd>
    </dl>  <!-- item-property-hor .// -->
    <dl class="param param-feature">
      <dt>Xuất xứ</dt>
      <dd>${pro.origin }</dd>
    </dl>  <!-- item-property-hor .// -->
    
    <hr>
        <div class="row">
            <div class="col-sm-5">
                <dl class="param param-inline">
                  <dt>Số lượng: </dt>
                  <div class="input-group">
			          <span class="input-group-btn">
			              <button type="button" class="btn btn-dark btn-number"  data-type="minus" data-field="quant[2]">
			                <i class="fas fa-minus"></i>
			              </button>
			          </span>
			          <input type="text" name="quant[2]" class="form-control input-number" value="10" min="1" max="100">
			          <span class="input-group-btn">
			              <button type="button" class="btn btn-dark btn-number" data-type="plus" data-field="quant[2]">
			                  <i class="fas fa-plus"></i>
			              </button>
			          </span>
			      </div>
                </dl>  <!-- item-property .// -->
            </div> <!-- col.// -->
            <div class="col-sm-7">
                <dl class="param param-inline">
                      <dt>Màu sắc: </dt>
                      <dd>
                          <label class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                          <span class="form-check-label">Xám</span>
                        </label>
                        <label class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                          <span class="form-check-label">Đen</span>
                        </label>
                        <label class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                          <span class="form-check-label">Hồng</span>
                        </label>
                      </dd>
                </dl>  <!-- item-property .// -->
            </div> <!-- col.// -->
        </div> <!-- row.// -->
        <hr>
        <a href="#" class="btn btn-lg btn-light text-uppercase"> MUA NGAY </a>
        <a href="CartForward" class="btn btn-lg btn-dark text-uppercase"> <i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ </a>
    </article> <!-- card-body.// -->
            </aside> <!-- col.// -->
        </div> <!-- row.// -->
    </div> <!-- card.// -->
    </div>

	<%@include file="footer.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="Views/frontend/js/single-product.js"></script>
</body>
</html>