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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<link href="font-awsome/css/font-awesome.cin.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Footer-with-button-logo.css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/navbar/css/bootstrap.css" rel="stylesheet" />
<link href="/resources/navbar/css/ct-navbar.css" rel="stylesheet" />
<script src="/resources/navbar/js/jquery-1.10.2.js"></script>
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>


<style type="text/css">
#h2 {
	position: absolute;
	left: 1450px;
	top: 80px;
	color: red;
}

.card {
	margin-top: 140px;
	padding: 30px;
	background-color: rgba(214, 224, 226, 0.2);
	-webkit-border-top-left-radius: 5px;
	-moz-border-top-left-radius: 5px;
	border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-top-right-radius: 5px;
	border-top-right-radius: 5px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.card.hovercard {
	position: relative;
	padding-top: 0;
	overflow: hidden;
	text-align: rigt;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 1);
}

.card.hovercard .card-background {
	height: 230px;
	width: 480px;
}

.card-background img {
	-webkit-filter: blur(25px);
	-moz-filter: blur(25px);
	-o-filter: blur(25px);
	-ms-filter: blur(25px);
	filter: blur(25px);
	margin-left: -100px;
	margin-top: -200px;
	min-width: 200%;
}

.card.hovercard .useravatar {
	position: absolute;
	top: 15px;
	left: 0;
	right: 0;
}

.card.hovercard .useravatar img {
	width: 100px;
	height: 100px;
	max-width: 100px;
	max-height: 100px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .card-info {
	position: absolute;
	bottom: 14px;
	left: 0;
	right: 0;
}

.card.hovercard .card-info .card-title {
	padding: 0 5px;
	font-size: 10px;
	line-height: 1;
	color: #262626;
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.card.hovercard .card-info {
	overflow: hidden;
	font-size: 12px;
	line-height: 20px;
	color: #737373;
	text-overflow: ellipsis;
}

.card.hovercard .bottom {
	padding: 0 20px;
	margin-bottom: 17px;
}

.btn-pref .btn {
	-webkit-border-radius: 0 !important;
}

.userinfo {
	font-size: 12px;
	right: 150;
}
</style>
<!-- SELLERMYPAGE에 필요한 CSS 끝 -->
<title>Buyer My Account</title>

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

	function btn_delete() {
		if (confirm("탈퇴 하시겠습니까?") == true) { //확인
			location.replace('/user/deleteuser');

		} else { //취소
			return;
		}
	}
</script>
</head>
<body>
	<%@ include file="secondstyle.jinc"%>
	<%@ include file="header.jinc"%>
	<div>
		<div style="margin-left: 400px; margin-right: 400px; margin-top: 8px;">
			<div>
				<div>
					<div class="col-md-12">

						<div class="card hovercard">
							<div class="card-background">
								<img class="card-bkimg" alt=""
									src="/resources/image/8367cb771db775d39f09b8a5b547242a.jpg">
								<!-- http://lorempixel.com/850/280/people/9/ -->
							</div>
							<div class="useravatar"
								style="margin-top: 10px; text-align: center;">

								<c:choose>
								<c:when test="${empty user.imgname}">
										<img src="/resources/userimg/null.jpg" alt="" />
									</c:when>
									<c:when test="${not empty user.imgname}">
										<img src="data:image/jpeg;base64,${user.imgname}" alt="" />
									</c:when>

								</c:choose>
								<br /> <br /> <br />
							</div>
							<div class="card-info"
								style="margin-top: 50px; margin: auto; text-align: center;">
								<span class="card-title"><h5>${user.id}</h5></span>
								<div class="userinfo">


									<div class="userinfo"
										style="margin-top: 10px; margin: auto; text-align: center;">
										
										<c:choose>
											<c:when test="${followercounter==0}">
												<li>follower 0</li>
											</c:when>
											<c:when test="${followercounter>0}">
												<li><a href="/user/follower?id=${user.id}">follower
														${followercounter}</a></li>
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${followingcounter==0}">
												<li>following 0</li>
											</c:when>
											<c:when test="${followingcounter>0}">
												<li><a href="/user/followinguser?id=${user.id}">following
														${followingcounter}</a></li>
											</c:when>
										</c:choose>


										<br />
										<c:choose>
											<c:when test="${ALREADY==0}">

												<a href="/user/following?id=${user.id}">following</a>
											</c:when>
											<c:when test="${ALREADY==1}">
												<a href="/user/unfollowed?id=${user.id}">unfollow</a>
											</c:when>
											<c:when test="${ALREADY==2}">
												<!-- <h5>modify</h5> -->
											</c:when>
										</c:choose>
									</div>
								</div>

							</div>
						</div>


						<br /> <br />
						<hr />
						<br />



						<c:choose>

							<c:when test="${empty USERITEM}">
								<h5 style="text-align:center;">아직 사진이 없습니다!</h5>
							</c:when>
							<c:when test="${not empty USERITEM}">

								<c:forEach items="${USERITEM}" var="itemvo">
									<div class="col-lg-3 text-center">

										<div class="thumbnail">
											<a href="/item/readposting?clothcode=${itemvo.clothcode}"><img
												src="/resources/itemimg/${itemvo.imgname} " alt="No Image"></a>

											<div class="caption">
											<a href="#">
												<h3>${newitem.name}</h3></a>
												<a href="#"><p style="color:#d9534f;"></p></a>
												<div class="caption1">
												<p>
													<a href="#" id="like"class="btn btn-danger" role="button">♡</a>
												</p>
												</div>
											</div>

										</div>
									</div>
								</c:forEach>

							</c:when>
						</c:choose>



						<br /> <br />
						<hr />
						<br />
						<!-- <button onclick="btn_delete();" id="bye">탈퇴</button> -->

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

<%@ include file="footer.jinc"%>
</html>