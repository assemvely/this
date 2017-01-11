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
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
	margin: 0px auto;
	vertical-align:center;
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
	vertical-align:center;
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
	vertical-align:center;
}

.tg .tg-yw4l {
	vertical-align: left;
	padding-left:15px;
}
#bannercheck {
	margin-top: 30px;
	margin-left: 910px;
	vertical-align: center;
}

#checkcheck{
align:right;
margin-right:100px;
}
</style>

<title>Cart</title>

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
			style="margin-left: 350px; margin-right: 350px; margin-top: 200px;">
			<div>
				<div>
					<div class="col-md-12">
						<div class="col-md-12">

	<form action="/item/buy" name="form" id="form" method="post">

		<table class="tg" width="800px" height="200px" style="align:center;">
			<tr>
				<th class="tg-031e">Check</th>
				<th class="tg-031e">Image</th>

				<th class="tg-031e">Name</th>
				<th class="tg-031e">Price</th>

				<th class="tg-031e">Delivery Charge</th>
				<th class="tg-031e">Mileage</th>
				<th class="tg-031e">Color</th>
				<th class="tg-031e">Amount</th>
			</tr>

			<c:forEach items="${cart}" var="itemVo">
				<tr>
					<td class="tg-yw4l"><input style="font-size: 20px; border: 1px solid #d9534f; width: 10px; height: 10px;" type="checkbox" name='chk' id="chk"
						value="${itemVo.cartbno}"></td>
					<td class="tg-yw4l"><a
						href="/item/readposting?clothcode=${itemVo.clothcode}"> <img 
						style="width:50px; height:auto;"
							src="/resources/itemimg/${itemVo.imgname}" alt="이미지가 없습니다"></a></td>

					<td class="tg-yw4l">${itemVo.name}</td>
					<td class="tg-yw4l">${itemVo.price}</td>

					<td class="tg-yw4l">2500</td>
					<td class="tg-yw4l">${itemVo.price*0.1}</td>
					<td class="tg-yw4l">${itemVo.color}</td>
					<td class="tg-yw4l">${itemVo.amount}</td>
				</tr>
			</c:forEach>
		</table>
<br>
<br>
		<button id="bannercheck" style="margin-right:150px;" type="submit" class="btn btn-danger">체크된 항목 구매</button>

	</form>
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