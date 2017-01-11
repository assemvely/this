<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<style>
#h2 {
	position: absolute;
	left: 1450px;
	top: 80px;
	color: red;
}

body {
	padding-top: 40px;
}
</style>

<title>Temper User Info</title>

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
						<div class="col-md-12">
							<div class="jumbotron"
								style="margin-top: 45px; text-align: center;">
								<div class="container" style="margin: auto; text-align: center;">
									<h1>Temper User Info</h1>
									<p>임시 사용자 정보</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>

							<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
	margin: 0px auto;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 0px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
	border-top-width: 1px;
	border-bottom-width: 1px;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 0px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
	border-top-width: 1px;
	border-bottom-width: 1px;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;
	text-align: center;
}

.tg .tg-yw4l {
	vertical-align: top
}

#thisistitle {
	color: #black;
}

.tg-yw4l, .tg-031e {
	width: 200px;
	heignt: 100px;
	text-align: center;
}
</style>



							<table class="tg" width="800px" height="100px"
								margin-right="auto">
								<tr>
								<th class="tg-031e">ID</th>
								<th class="tg-031e">EMAIL</th>
								<th class="tg-031e">프로필사진</th>
								<th class="tg-031e">사업자서류</th>
								<th class="tg-031e">승인여부</th>
								</tr>
								
								<tr>
								<td class="tg-yw4l" style="margin-top:10px;">${tempuser.id}</td>
								<td class="tg-yw4l">${tempuser.email}</td>
								<td class="tg-yw4l"><img src="/resources/userimg/${tempuser.imgname}"
								style="max-width: 100px; height: 100;"
									alt="이미지가 없습니다."></td>
								<td class="tg-yw4l"><img src="/resources/userimg/${tempuser.filename}"
								style="max-width: 100px; height: auto;" alt="이미지가 없습니다"
									></td>
								<td class="tg-yw4l"><button
									onclick="location.href='/user/deletetempuser?id=${tempuser.id}'">삭제</button>
								<button
									onclick="location.href='/user/approve?id=${tempuser.id}'">승인</button></td>
								</tr>
							</table>
							<br /> <br /> <br /> <br />
						</div>
						<a href="#" class="jcm-top"><img
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