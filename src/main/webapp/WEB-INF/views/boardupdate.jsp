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

<style>
#h2 {
	position: absolute;
	left: 1450px;
	top: 80px;
	color: red;
}

@font-face {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

body {
	padding-top: 40px;
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
	padding: 18px 5px;
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
	padding: 18px 5px;
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
	border: 1px #d9534f solid;
}

}
.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;
	text-align: center;
	vertical-align: center;
	border: 1px #d9534f solid;
}

}
.tg .tg-yw4l {
	vertical-align: center;
	border: 1px #d9534f solid;
}

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
	border: 1px #d9534f solid;
}

#bannercheck {
	margin-top: 50px;
	margin-left: 880px;
	vertical-align: center;
}

input[type="button" i], input[type="submit" i], input[type="reset" i],
	input[type="file" i]::-webkit-file-upload-button, button {
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
	border-radius: 6px;
}

input, textarea, keygen, select, button {
    text-rendering: auto;
    color: #d9534f;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em 0em 0em 0em;
    font: 13.3333px Arial;
}

.input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    user-select: text;
    cursor: auto;
    padding: 5px;
    border-width: 2px;
    border-style: solid;
    border-color: rgba(0,0,0,.075);
    border-image: initial;
}
</style>

<title>Board Update</title>

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
									<h1>Customer Board</h1>
									<p>문의사항을 남겨주세요.</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>



						<form name="update" id="update" method="get"
							action="/customerboard/update">
							<table class="tg" width="800px" height="200px">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tr>
									<th  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" class="tg-031e" scope="row">Bno</th>
									<td  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" id="bno" name="bno">${boardVo.bno}</td>
									<th  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" class="tg-031e" scope="row">Id</th>
									<td  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;">${boardVo.id}</td>
								</tr>

								<tr>
									<th  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" class="tg-031e" scope="row">Title</th>
									<td  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;"><input class="change" type="text" id="title" style="border-color:rgba(0,0,0,.075); width:250px;" value="${boardVo.title}"></td>
									<th  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" class="tg-031e" scope="row">Writedate</th>
									<td  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;">${boardVo.writedate}</td>
								</tr>

								<tr>
									<td  style="padding-left: 15px; border-top: 1px #d9534f solid;  border-bottom: 1px #d9534f solid;" colspan="4"><textarea style="border-color:rgba(0,0,0,.075);" align="center" value="${boardVo.content}" rows="20" cols="100"
												title="content" id="content" class="change name="change"></textarea></td>
								</tr>


							</table>
							<br /> <br /> <br /> <br />
							
							
							<div id="bannercheck"
							>



							<button type="button" style="background-color: #d9534f; border: solid 1px #d9534f; color: #ffffff;"
											class="btn btn-danger"
								onClick="location.href='update?bno=${boardVo.bno}&title=${boardVo.title}&content=${boardVo.content}'">저장하기</button>

							<button style="background-color: #d9534f; border: solid 1px #d9534f; color: #ffffff;"
											class="btn btn-danger" type="button" onClick="location.href='listall'">목록</button></div>

							
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
