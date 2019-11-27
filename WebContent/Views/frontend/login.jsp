<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/login.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
  </head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="category_name">LOGIN</div>

	<div id="logreg-forms">
            <form class="form-signin" action="LoginForward" method="post">
                <p style="text-align:center"> @A-GARDEN  </p>
                <input type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="autofocus" name="username">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" name="password">
                <c:if test="${message != null}">
					<a class="text-danger">Tài khoản không tồn tại !</a>
			    </c:if>
                <button class="btn btn-dark btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                
                <a href="#" id="forgot_pswd">Quên mật khẩu?</a>
                <hr>
                <!-- <p>Don't have an account!</p>  -->
                <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng ký tài khoản</button>
            </form>
    
                <form action="/reset/password/" class="form-reset">
                    <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" autofocus="">
                    <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                    <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Quay lại</a>
                </form>
                
                <form action="RegisterController" method="post" class="form-signup">
                    <p style="text-align:center">@A-GARDEN</p>
    
                    <input type="text" id="user-name" class="form-control" placeholder="User Name" required="" autofocus="autofocus" name="username">
                    <input type="text" id="user-email" class="form-control" placeholder="Display Name" required autofocus="" name="displayname">
                    <input type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="" name="password">
    
                    <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                    <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Quay lại</a>
                </form>
                <br>
        </div>

	<%@include file="footer.jsp" %>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="Views/frontend/js/login.js"></script>
</body>
</html>