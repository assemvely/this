<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ page session="false"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ include file="firststyle.jinc"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="">
<meta name="author" content="assemvely">
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/npm.js"></script>
<!-- Bootstrap Core CSS 깔기 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<!-- css admin깔기 -->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<link href="font-awsome/css/font-awesome.cin.css" rel="stylesheet"
	type="text/css">
<!-- footer 스타일시트 3개 -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Footer-with-button-logo.css">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/navbar/css/bootstrap.css" rel="stylesheet" />
<link href="/resources/navbar/css/ct-navbar.css" rel="stylesheet" />
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>


<title>ASSEMVELY</title>
<style>

@font-face {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
}
.owl-controls{
vertical-align:center;
margin-left:1000px;
}
.owl-prev {
margin-top:10px;
width:50px;
height:20px;
font-weight: bold;
color:#999999;
vertical-align:center;
font-size: 14px;
font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
}

.owl-next {
vertical-align:center;
width:50px;
height:20px;
font-weight: bold;
color:#999999;
font-size: 14px;
font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
	
}
</style>

<script type="text/javascript">
	/* 맨위로 올라가는 화살표  */
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.jcm-top').fadeIn();
			} else {
				$('.jcm-top').fadeOut();
			}
		});
		$('.jcm-top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});

	function onChangeSelect() {

		var selected = $("#selectlittlecategory").val();

		if (selected != "0") {
			var selectedUppercase = selected.toUpperCase();

			document.getElementById("Form3").submit();
			form.Form3.submit();
		}
	}
	$(document).ready(function() {
	})
</script>
</head>
<body>
	<%@ include file="secondstyle.jinc"%>
	<%@ include file="header.jinc"%>
	<div>
		<div
			style="margin-left: 400px; margin-right: 400px; margin-top: 50px;">
			<div>
				<div>
					<!-- 이벤트 창 만들기 시작 -->
					<div class="col-md-12">

						<br /> <br />


						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel" style="margin-top: 48px;">

							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
								<li data-target="#carousel-example-generic" data-slide-to="3"></li>
							</ol>

							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<div class="item">
										<a style="color:#d9534f;" href="#"><img src="/resources/userimg/dress2.jpg"
											alt="no images"></a>

									</div>


								</div>
								<c:forEach items="${BANNER}" var="banner">
									<div class="item">
										<a href="/manager/readposting?managerbno=${banner.managerbno}"><img
											src="/resources/managerimg/${banner.managerimg}"
											alt="no images"></a>
									</div>

								</c:forEach>

							</div>

							<!-- Controls 화살표 표시 창 -->
							<a class="left carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="prev"> <span
									class="glyphicon glyphicon-triangle-left" aria-hidden="true"
									style="padding-top:120px;"></span> <span align="center"
									class="sr-only">Previous</span>
								</a> <a class="right carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="next"> <span
									class="glyphicon glyphicon-triangle-right" aria-hidden="true"
									style="margin-top: 120px;"></span> <span align="center"
									class="sr-only">Next</span>
								</a>
							<!-- 끝 Controls 화살표 표시 창 끝-->
						</div>

						<!-- 끝 Wrapper for slides 끝 -->

						<br /> <br />
						<hr style="border-top: 1px solid #d9534f;">
						<br />

						<!-- owl-carousel 쓰기 -->
						<script>
							$(document).ready(function() {

								$(".owl-carousel").owlCarousel({
									loop : true,
									margin : 10,
									nav : true,
									responsive : {
										0 : {
											items : 1
										},
										600 : {
											items : 3
										},
										1000 : {
											items : 5
										}
									}
								});

							})
						</script>

						<h5 id="important">
							<b>BRAND</b>
						</h5>
						<br>
						<div class="row" style="margin-left:10px; margin-right:10px;">
							<div class="owl-carousel">
								<c:forEach items="${BRANDGALLERY}" var="brandgallery">
									<div class="item">
										<a  style="color:#d9534f;" href="/user/mypage?id=${brandgallery.id}"><img
											src="/resources/image/${brabdgallery.imgname }"
											alt="No Image"></a> 
											<h5><a id="itemid"
											href="/user/mypage?id=${brandgallery.id}">${brandgallery.id}</a></h5>
									</div>
								</c:forEach>
							</div>
						</div> 

						<!-- 끝끝 owl-caraousel끝끝 -->
						<!-- 네모 4개 띄우기 코디 폼  -->
						<br /> <br />
						<hr style="border-top: 1px solid #d9534f;">
						<br /> <br />

						<h5 id="important">
							<b>BEST CODI</b>
						</h5>
						<br>

						<!-- 베스트 코디 시작 -->
						<div class="row">
							<div class="col-lg-3 text-center">
								<div class="panel panel-default">
									<div class="panel-body">.col-lg-3</div>
									<img class="img-thumbnail" src="http://placehold.it/400x400"
										alt="no image">
								</div>
							</div>
							<div class="col-lg-3 text-center">
								<div class="panel panel-default">
									<div class="panel-body">.col-lg-3</div>
									<img class="img-thumbnail" src="http://placehold.it/400x400"
										alt="no image">
								</div>
							</div>
						</div>
						<!-- 베스트 코디 끝 -->
					
						<br /> <br />
						<hr style="border-top: 1px solid #d9534f;">
						<br />

						<!-- 뉴아이템 시작 -->

						<h5 id="important">
							<b>NEW ITEM</b>
						</h5>
						<br>

						<div class="row">

							<c:forEach items="${NEWITEM}" var="newitem">
								<div class="col-lg-3 text-center">


									<div class="thumbnail">
										<a href="/item/readposting?clothcode=${newitem.clothcode}">
											<img src="/resources/itemimg/${newitem.imgname} "
											alt="No Image">
										</a>
										<div class="caption">
											<a href="/user/mypage?id=${newitem.id}">
												<h3 id="itemid">${newitem.id}</h3>
											</a> <a href="/item/readposting?clothcode=${newitem.clothcode}">
												<p style="color: #999999;">${newitem.name}</p>
											</a>
											<p style="color: #d9534f;">${newitem.price}원</p>
											<div class="caption1">
												<p>
													<a href="/item/like?clothcode='${newitem.clothcode}'"
														class="btn btn-danger" id="like" role="button">♡</a>
												</p>
											</div>
										</div>

									</div>
								</div>
							</c:forEach>

						</div>

						<!-- 뉴 아이템 끝 -->

						<a href="#" class="jcm-top"><img
							src="/resources/glyphicons/glyphicons-214-arrow-upupup.png"
							style="margin-bottom: 24px; width: 25px;"></a>



					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- newitem뿌리기 끝-->


</body>
<br />
<br />

<%@ include file="footer.jinc"%>

</html>