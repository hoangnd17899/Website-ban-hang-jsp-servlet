<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="BEAN.Product"%>    
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>CHECKOUT</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/checkout.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="category_name">CHECKOUT</div>
	
	

    <div class="col-md-8 order-md-1 billingform">
    	<form action="CheckoutForward" method="post">
          <h4 class="mb-3">Thông tin thanh toán</h4>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">Họ và tên</label>
                <input type="text" class="form-control" id="fullname" name="fullName" value="" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Số điện thoại</label>
                <input type="text" class="form-control" id="phone" name="phone" value="" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email <span class="text-muted"></span></label>
              <input type="email" class="form-control" id="email" name="email" required>
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Địa chỉ</label>
              <input type="text" class="form-control" id="address" name="address" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">Quốc gia</label>
                <input type="text" class="form-control" id="country" name="country" required>
                <div class="invalid-feedback">
                  Please select a valid country.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Thành phố</label>
                <input type="text" class="form-control" id="city" name="city" required>
                <div class="invalid-feedback">
                  Please provide a valid state.
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="zip">Zip Code</label>
                <input type="text" class="form-control" id="zipcode" placeholder="" name="zipCode" required>
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>
            
            <hr class="mb-4">

            <h4 class="mb-3">Phương thức thanh toán</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input value="credit" id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credit">Thẻ ngân hàng</label>
              </div>
              <div class="custom-control custom-radio">
                <input value="momo" id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debit">Momo</label>
              </div>
              <div class="custom-control custom-radio">
                <input value="paypal" id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="paypal">Paypal</label>
              </div>
            </div>
            
            <h4 class="mb-3">Tổng đơn hàng</h4>
            <% 
            	int total = (int) request.getAttribute("total");
				DecimalFormat formatter = new DecimalFormat("###,###,###");
			%>
            <h3 class="mb-3" style="color: #ffa100"><%=formatter.format(total) %> đ</h3>
            <input type="hidden" value="<%=total %>" name="total">
            <hr class="mb-4">
            <button class="btn btn-dark btn-lg btn-block" id="checkout" type="submit">Thanh toán</button>
		</form>
    </div>
    
	<%@include file="footer.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="Views/frontend/js/login.js"></script>
</body>
</html>