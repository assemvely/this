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

@font-face {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum, 'Apple SD Gothic Neo', Sans-serif;
}

body {
	padding-top: 40px;
}

a:-webkit-any-link {
    color: #fffff;
    cursor: auto;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
	margin: 0px auto;
	vertical-align: center;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 15px 5px;
	border-style: solid;
	border-width: 0px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
	border-top-width: 1px;
	border-bottom-width: 1px;
	vertical-align: center;
	border-bottom:#d9534f;
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
	color: #ffffff;
	background-color: #d9534f;
	border-top-width: 1px;
	border-bottom-width: 1px;
	text-align: center;
	vertical-align: center;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;;
	vertical-align: center;
	border-bottom:#d9534f;
}

.tg .tg-yw4l {
	vertical-align: center;
	align:left;
	padding-left:15px;
	border-bottom:#d9534f;
}
    #jusosearch{
     align-items: flex-start;
    text-align: center;
    cursor: default;
    color: #ffffff;
    background-color: #d9534f;
    box-sizing: border-box;
    padding: 10px 16px;
    font-size: 14px;
    border-width: 2px;
    border-color: #d43f3a;
    border-style: none;
    border-radius: 6px;
    }
</style>
<title>Search Page</title>

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
			style="margin-left: 400px; margin-right: 400px; margin-top: 200px;">
			<div>
				<div>
					<div class="col-md-12">
						<div class="col-md-12">
		
		
		<h4 style="font-weight:bold; margin-left:120px; color:#d9534f;">검색된 사용자 정보</h4>
		<br />
		<table class="tg" width="800px" height="200px" style="text-align:center; border:solid 1px #d9345f;">
			<tr>
				<th class="tg-58iv" width=400px;>USER IMAGE</th>
				<th class="tg-58iv" width=400px;>USER ID</th>
			</tr>
			<tr>
				<c:forEach items="${searchuserlist}" var="userVo">
					<td class="tg-yw4l" style="align:center;"><a style="color:black;"
						href="/user/mypage?id=${userVo.id}"> <img width=50px; height=50px;
							src="/resources/userimg/${userVo.imgname} " alt="이미지가 없습니다"
							class="img-circle"></a></td>
					<td class="tg-yw4l" style="align:center;"><a style="color:black;"
						href="/user/mypage?id=${userVo.id}">${userVo.id}</a></td>
				</c:forEach>
			</tr>
		</table>
		<br /><br /> 
		<hr style="border-top:1px solid #d9534f;"><br />
		<h4 style="font-weight:bold; margin-left:120px; color:#d9534f;">검색된 아이템 정보</h4>
		<!--  -->
		
		<div class="row" style="margin-top:65px;">

				<c:forEach items="${searchitemlist}" var="itemVo">
					<div class="col-lg-3 text-center">


						<div class="thumbnail">
				<a href="/item/readposting?clothcode=${itemVo.clothcode}">
				<img src="/resources/itemimg/${itemVo.imgname} "
												alt="No Image"> </a>
											<div class="caption">
											<a href="/user/mypage?id=${itemVo.id}">
												<h3 id="itemid">${itemVo.id}</h3></a>
												
												<a href="/item/readposting?clothcode=${itemVo.clothcode}">
												<p style="color:#999999;">${itemVo.name}</p></a>
												
												<p style="color:#d9345f;">${itemVo.price}원</p>
													<div class="caption1">
														<p>
															<a href="/item/like?clothcode='${shopping.clothcode}'"
																class="btn btn-danger" id="like" role="button">♡</a>
														</p>
													</div>
												
												 
											</div>

										</div>
									</div>
								</c:forEach>

							</div>
		
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