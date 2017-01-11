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


<title>ASSEMVELY CUSTOMER BOARD</title>

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

						<!--   게시판시작      -->
						<div class="col-md-12">
							<div class="jumbotron"
								style="margin-top: 45px; text-align: center;">
								<div class="container" style="margin: auto; text-align: center;">
									<h1>Customer Board</h1>
									<p>문의사항을 남겨주세요.</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>

							<!-- <hr style="border-top:1px solid #d9534f;"> -->
							<form action="/customerboard/boarddelete" name="form" id="form"
								method="post">
								<style type="text/css">
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
	vertical-align: center;
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
	border-color: #d9534f;
	color: #ffffff;
	background-color:#d9534f;
	border-top-width: 1px;
	border-bottom-width: 1px;
	vertical-align: center;
	text-align: center;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;
	text-align: center;
	vertical-align: center;
}

.tg .tg-yw4l {
	vertical-align: center;
	
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
	margin-top: 30px;
	margin-left: 910px;
	vertical-align: center;
}
</style>

								<table class="tg" width="800px" height="100px"
									margin-right="auto">
									<tr>
										<!-- <th class="tg-031e">Check</th> -->
										<th class="tg-031e">Bno</th>
										<th class="tg-031e">Title</th>
										<th class="tg-031e">Id</th>
										<th class="tg-031e">Writedate</th>
									</tr>

									<c:forEach items="${LISTALL}" var="listall">
										<tr>
											<%-- <td class="tg-yw4l"><input type="checkbox" name='bno'
												id="bno" ${listall.bno}></td> --%>
											<td style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;" class="tg-yw4l">${listall.bno}</td>
											<td style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;" class="tg-yw4l"><a style="color: black;"
												id="thisistitle"
												href="/customerboard/boardreadone?bno=${listall.bno}">${listall.title}</a></td>
											<td style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;" class="tg-yw4l">${listall.id}</td>
											<td style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;" class="tg-yw4l">${listall.writedate}</td>
										</tr>
									</c:forEach>
								</table>
								<br /> <br /> <br /> <br />


								<div id="bannercheck">
									<button style="background-color:#d9534f; border: solid 1px #d9534f; 
									color:#ffffff;" class="btn btn-danger" type="button" onClick="location.href='boardwrite'">글쓰기</button>
								</div>



							</form>






						</div>

						<!--   게시판끝    -->
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