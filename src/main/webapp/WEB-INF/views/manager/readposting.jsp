<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<title>Read Board Posting</title>

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
	border-color: #d9534f;
	color: #333;
	background-color: #fff;
	border-top-width: 1px;
	border-bottom-width: 1px;
	vertical-align: center;
}

.tg th {
	font-family: Arial, sans-serif;
	width:100px;
	font-size: 14px;
	font-weight: normal;
	padding: 15px 15px;
	border-style: solid;
	border-width: 0px;
	overflow: hidden;
	word-break: normal;
	border-color: #d9534f;
	color: #ffffff;
	background-color: #d9534f;
	border-top-width: 1px;
	border-bottom-width: 1px;
	vertical-align: center;
	text-align: center;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;
	text-align: center;
	vertical-align: left;
	padding:15px 10px;
	maring-left:15px;
}

.tg .tg-yw4l {
	vertical-align: center;
	padding:15px 10px;
	padding-left:15px;
	text-align:left;
}

#thisistitle {
	color: #black;
	vertical-align: center;
}

.tg-yw4l, .tg-031e {
	width: 200px;
	heignt: 100px;
	text-align: center;
	vertical-align: center;
}

#bannercheck {
	margin-top: 50px;
	margin-left: 800px;
	vertical-align: center;
}

table {
	align: center;
}

#divdiv{
width:800px;
margin-top:15px;
margin-bottom:15px;
align:center;

}

input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: #ffffff;
    background-color: #d9534f;
    box-sizing: border-box;
    padding: 13px 13px;
    border-width: 0px;
    border-style: solid;
    border-color: #d9534f;
    border-radius:6px;
}
</style>


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
									<h1>Banner Posting List</h1>
									<p>배너 및 포스팅 목록</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>
							<br>
						<br><br>



							<c:choose>
								<c:when test="${not empty(READ)}">
									<table class="tg" width="800px" height="100px" >
										<tr>
											<th align="center" class="tg-031e">타이틀</th>
											<td class="tg-yw4l">${READ.title}</td>
											
										</tr>
										<tr>
											<th align="center" class="tg-031e">이미지</th>
											<td class="tg-yw4l"><img
												src="/resources/managerimg/${READ.managerimg}"
												style="max-width: 700px; height: auto;" alt="이미지가 없습니다"></td>
										</tr>
										<tr>
											<th align="center" class="tg-031e">내용</th>
											<td class="tg-yw4l">${READ.posting}</td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
									<span class="failed">파일업로드 실패</span>
								</c:otherwise>
							</c:choose>


							<c:choose>
								<c:when test="${not empty(MANAGER) }">
								<br><br><br>
									<!-- <table class="tg" width="800px" height="50px" align="center">
									<tr>
									<td class="tg-yw4l">	 -->
									<div id="bannercheck">
									<a href="/manager/banner?chk=${READ.managerbno}"><input
											type="button" value="메인화면가기" class="btn btn-danger" style="color:#fffff; background-color:#d9534f;" /></a>
										<a href="/manager/deleteposting?managerbno=${READ.managerbno}"><input
											type="button" id="save" value="삭제" class="btn btn-danger" /></a>
										<a href="/manager/updateposting?managerbno=${READ.managerbno}"><input
											type="button" id="save" value="수정" class="btn btn-danger" /></a>
											</div>
											<!-- </td>
											</tr>
											</table> -->
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
						<br><br><br><br>
						<div style="margin-bottom:50px;"></div>
						<a href="#" class="jcm-top"><img
							src="/resources/glyphicons/glyphicons-214-arrow-upupup.png"
							style="margin-bottom: 24px; width: 25px;"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
</body>
<%@ include file="footer.jinc"%>
</html>