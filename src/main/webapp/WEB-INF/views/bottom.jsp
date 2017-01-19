<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta name="author" content="">
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
<!-- navbar바 에 관련된것 깔기.. 너무 힘들... 시작  -->
<link href="/resources/navbar/css/bootstrap.css" rel="stylesheet" />
<!-- <link href="/resources/navbar/css/pe-icon-7-stroke.css" rel="stylesheet" /> -->
<link href="/resources/navbar/css/ct-navbar.css" rel="stylesheet" />
<script src="/resources/navbar/js/jquery-1.10.2.js"></script>
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>
<!-- navbar바 에 관련된것 깔기.. 너무 힘들... 끝  -->

<title>ASSEMVELY SKIRT</title>

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
</script>
<script>
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
			style="margin-left: 400px; margin-right: 400px; margin-top: 100px;">
			<div>
				<div>
					<div class="col-md-12">

						<!--   OUTER시작      -->
						<div class="col-md-12">
							<div class="jumbotron"
								style="margin-top: 45px; text-align: center;">
								<div class="container" style="margin: auto; text-align: center;">
									<h1>Bottom</h1>
									<p>Pants Shorts</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>

							<!-- <hr style="border-top:1px solid #d9534f;"> -->


							<!-- 정렬하는 부분 시작 !-->
							<form name="Form3" id="Form3" action="/item/bottom" method="GET">
								<h5 id="important">
									<b>CATEGORY</b>
								</h5>
								<div class="dropdown">
						<select id="selectlittlecategory" name="bottom"
						onchange="onChangeSelect()">
						<option name="bottom" value="0">Category</option>
						<option name="bottom" value="pants"
							<%if ("PANTS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
							SELECTED="SELECTED" <%}%>>Pants</option>
						<option name="top" value="shorts"
							<%if ("SHORTS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
							SELECTED="SELECTED" <%}%>>Shorts</option>
					</select>
								</div>
								<!-- 정렬하는 부분 끝 !-->
								<hr style="border-top: 1px solid #d9534f;">
								<br />


								<!-- 뿌리기 시작!! -->


								<div class="row">

									<c:forEach items="${SELECTCATEGORY}" var="bottomvo">
										<div class="col-lg-3 text-center">


											<div class="thumbnail">
												<a href="/item/readposting?clothcode=${bottomvo.clothcode}">
													<img src="data:image/jpeg;base64,${bottomvo.imgname} "
													alt="No Image">
												</a>
												<div class="caption">
													<a href="/user/mypage?id=${bottomvo.id}">
														<h3 id="itemid">${bottomvo.id}</h3>
													</a> <a href="/item/readposting?clothcode=${bottomvo.clothcode}">
														<p style="color: #999999;">${bottomvo.name}</p>
													</a>
													<p style="color: #d9534f;">${bottomvo.price}원</p>
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
							</form>
						</div>

						<!--   OUTER끝    -->
						<br /> <br />

						<!-- <hr style="border-top:1px solid #d9534f;">					 -->

						<br /> <br /> <br />
						<!-- <hr style="border-top:1px solid #d9534f;"> -->
						<br /> <br /> <br /> <br />
						<!-- <hr style="border-top:1px solid #d9534f;"> -->
						<br /> <a href="#" class="jcm-top"><img
							src="/resources/glyphicons/glyphicons-214-arrow-upupup.png"
							style="margin-bottom: 24px; width: 25px;"></a>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
<br />
<br />



<!-- footer시작 -->


<footer id="myFooter">
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<h2 class="logo">
				<a href="#"><img src="/resources/image/assemVely1.png"> </a>
			</h2>
		</div>
		<div class="col-sm-2">
			<h5>
				<b>SHOP INFO</b>
			</h5>
			<ul>
				<li><a href="/all/main">Home</a></li>
				<li><a href="/user/joinPage">Sign up</a></li>
				<li><a href="/customerboard/listall">FAQ</a></li>
			</ul>
		</div>
		<div class="col-sm-2">
			<h5>
				<b>ABOUT US</b>
			</h5>
			<ul>
				<li>
					<h6>상호명: (주)어셈블리</h6>
				</li>
				<li>
					<h6>사업자 등록번호</h6>
				</li>
				<li>
					<h6>090-27-410118</h6>
				</li>
		</div>
		</ul>
		<div class="col-sm-2">
			<h5>
				<b>CS CENTER</b>
			</h5>
			<ul>
				<li><h6>1680-1861</h6></li>
				<li><h6>월-금 11AM ~ 6PM</h6></li>
				<li><h6>DAY OFF 토 / 일/ 공휴일</h6></li>
			</ul>
		</div>
		<div class="col-sm-3">
			<div class="social-networks">
				<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
					href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
					href="#" class="google"><i class="fa fa-google-plus"></i></a>
			</div>
			<button type="button" class="btn btn-default">
				<a href="/customerboard/listall">Contact us</a>
			</button>
		</div>
	</div>
</div>
<div class="footer-copyright">
	<p>© 2017 Copyright Text</p>
</div>
</footer>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery drop-down제이쿼리 추가 -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript drop-down제이쿼리 추가 -->
<script src="js/bootstrap.min.js"></script>

<!-- footer끝 -->


</html>