<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="Views/frontend/css/home.css">
	<link rel="stylesheet" href="Views/frontend/css/header.css">
	<link rel="stylesheet" href="Views/frontend/css/bottom.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
  </head>
<body>
  <%@include file="header.jsp" %>
  <div class="category_name">HOME</div>
  
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="Views/frontend/image/slice1.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-dark" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="Views/frontend/image/slide3.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-dark" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="Views/frontend/image/slide4.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1 class="text-dark">Example headline.</h1>
                <p class="text-dark">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-dark" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>

    <div style="margin: 50px 80px;">
        <div class="separator">SẢN PHẨM BÁN CHẠY</div>
    </div>

    <div style="margin: 50px 80px;">
        <ul class="toptrend" style="display: flex;">
            <li>
                <img src="Views/frontend/image/trend1.jpg" alt="">
                <div>iPhone 5S</div>
            </li>
            <li>
                <img src="Views/frontend/image/trend2.jpg" alt="">
                <div>Macbook Pro 2017</div>
            </li>
            <li>
                <img src="Views/frontend/image/trend3.jfif" alt="">
                <div>iPad Pro 2018</div>
            </li>
            <li>
                <img src="Views/frontend/image/trend4.jfif" alt="">
                <div>Airpods</div>
            </li>
        </ul>
        <ul class="toptrend" style="display: flex;">
                <li>
                    <img src="Views/frontend/image/trend1.jpg" alt="">
                    <div>iPhone 5S</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend2.jpg" alt="">
                    <div>Macbook Pro 2017</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend3.jfif" alt="">
                    <div>iPad Pro 2018</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend4.jfif" alt="">
                    <div>Airpods</div>
                </li>
            </ul>
    </div>

    <div style="margin: 50px 80px;">
            <div class="separator">SẢN PHẨM ĐANG GIẢM GIÁ</div>
        </div>
    
        <div style="margin: 50px 80px;">
            <ul class="toptrend" style="display: flex;">
                <li>
                    <img src="Views/frontend/image/trend1.jpg" alt="">
                    <div>iPhone 5S</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend2.jpg" alt="">
                    <div>Macbook Pro 2017</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend3.jfif" alt="">
                    <div>iPad Pro 2018</div>
                </li>
                <li>
                    <img src="Views/frontend/image/trend4.jfif" alt="">
                    <div>Airpods</div>
                </li>
            </ul>
        </div>

    <div style="margin: 50px 80px;">
        <div class="separator">PHẢN HỒI VỀ A-GARDEN</div>
    </div>

    <div class="row featurette">
            <div class="col-md-7">
              <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
              <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
              <p>- Kobe Bryant -</p>  
            </div>
            <div class="col-md-5">
              <img class="featurette-image img-fluid mx-auto" src="Views/frontend/image/kobe.jpg" alt="Generic placeholder image">
            </div>
    </div>

    <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
            <p>- Lionel Messi -</p>
        </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="Views/frontend/image/messi.jpg" alt="Generic placeholder image">
          </div>
    </div>

    <div class="row featurette">
            <div class="col-md-7">
                    <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                    <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
              <p>- Cristiano Ronaldo -</p>  
            </div>
            <div class="col-md-5">
              <img class="featurette-image img-fluid mx-auto" src="Views/frontend/image/ronaldo.jpg" alt="Generic placeholder image">
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