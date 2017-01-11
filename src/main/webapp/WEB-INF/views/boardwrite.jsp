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

<style>
@font-face {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

.caption {
	margin-left: 15px;
	text-align: left;
}

.caption1 {
	margin-right: 15px;
	text-align: right;
}
</style>

<style type="text/css">
.label, .title {
	text-transform: capitalize;
}

a {
	color: #black;
}

#qtip-overlay.blurs, .btn_flat, .notitle .ui-dialog-buttonpane button,
	.qtip-close, a, button {
	cursor: pointer;
}

img {
	border: 0;
}

img[Attributes Style] {
	width: 150px;
}

#header #header_wrapper .login {
	position: absolute;
	width: 84px;
	height: 29px;
	right: 15px;
	bottom: 17px;
}

.btn_flat {
	font-size: 12px;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	color: #d9534f;
	border: 1px solid #d9534f;
	border-radius: 3px;
	text-align: center;
	cursor: pointer;
	outline: none;
	transition: .2s;
	display: table;
}

.btn_flat, .formpanel_dialog, .menu_custom.ui-menu, .pagination ul li a
	{
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

.btn_flat, .th {
	text-align: center;
}

.btn_flat span {
	display: table-cell;
	vertical-align: middle;
}

#header #header_wrapper a.search_btn {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAACXBIW…LPBU/Cl4Cz8KXgMdxbyPwrwDFcgbdXHMUY7p/u8Rq6DwBNsKOS7bhwaQAAAABJRU5ErkJggg==)
		50% 50% no-repeat;
	width: 420px;
	height: 35px;
	right: 218px;
	bottom: 10px;
	position: absolute;
	display: none;
}

.navbar-form .form-control1 {
	display: inline-block;
	width: 400px;
	vertical-align: middle;
	letter-spacing: 1px;
	padding-left: 10px;
}

.form-control1 {
	font-size: 12px;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	color: #d9534f;
	border: 1px solid #d9534f;
	border-radius: 3px;
	text-align: left;
	cursor: pointer;
	width: 420px;
	margin-left: 170px;
	height: 35px;
	outline: none;
	transition: .2s;
	display: table;
	letter-spacing: 1px;
	padding-left: 10px;
}

.btn-default1 {
	margin-top: 0px;
	border: 1px solid #d9534f;
	background: #d9534f;
	color: #ffffff;
	height: 35px;
	text-align: left;
	border-radius: 3px;
}

.btn-default1:hover, .form button:active, .form button:focus {
	background: #ffffff; /* #d9534f; */
	color: #d9534f;
	border: 1px solid #d9534f;
}

input[type="hidden" i], input[type="image" i], input[type="file" i] {
	-webkit-appearance: initial;
	background-color: initial;
	padding: initial;
	border: initial;
}

input[type="hidden" i] {
	display: none;
}

#qtip-overlay.blurs, .btn_flat, .notitle .ui-dialog-buttonpane button,
	.qtip-close, a, button {
	cursor: pointer;
}

#header #header_wrapper .search_wrapper {
	position: absolute;
	top: 25px;
	left: 390px;
	margin-bottom: 10px;
	min-height: 30px;
}

#header #header_wrapper .search {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	font-size: 14px;
	letter-spacing: 1px;
	padding-bottom: 10px;
	padding-top: 10px;
	padding-left: 15px;
	width: 480px;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAACXBIW…LPBU/Cl4Cz8KXgMdxbyPwrwDFcgbdXHMUY7p/u8Rq6DwBNsKOS7bhwaQAAAABJRU5ErkJggg==)
		5px 50% no-repeat;
	background-size: 24px 24px;
	border: 0;
	border: 2px solid #000;
	outline: 0;
	transition: width 150ms cubic-bezier(.165, .84, .44, 1), opacity 150ms
		cubic-bezier(.165, .84, .44, 1);
}

input:not ([type] ), input[type="email" i], input[type="number" i],
	input[type="password" i], input[type="tel" i], input[type="url" i],
	input[type="text" i] {
	padding: 1px 0px;
}

/* input {
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	user-select: text;
	cursor: auto;
	padding: 1px;
	border-width: 2px;
	border-style: inset;
	border-color: rgba(0,0,0,.075);
	border-image: initial;
} */

input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    user-select: text;
    cursor: auto;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: rgba(0,0,0,.075);
    border-image: initial;
}

input, textarea, keygen, select, button {
	text-rendering: auto;
	color: initial;
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

input, textarea, keygen, select, button, meter, progress {
	-webkit-writing-mode: horizontal-tb;
}

form {
	display: block;
	margin-top: 0em;
}

div {
	display: block;
}

#header #header_wrapper {
	max-width: 1300px;
	margin: 0 auto;
	position: relative;
	height: 80px;
}

#header #header_wrapper .hamburger {
	display: none;
	width: 30px;
	height: 32px;
	position: absolute;
	bottom: 13px;
	left: 10px;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALYAAADSCAYAAADnlTpIAAAAAXNSR…hsYRKJLUwisYVJJLYwicQWJpHYwiQSW5hEYguTSGxhEOf+AZCka+KD8uTOAAAAAElFTkSuQmCC)
		no-repeat;
	background-size: 100%;
}

.btn {
	cursor: pointer;
	text-transform: capitalize;
}

#header #header_wrapper .search_submit {
	display: none;
}

input[type="button" i], input[type="submit" i], input[type="reset" i],
	input[type="file" i]::-webkit-file-upload-button, button {
	padding: 1px 6px;
}

input[type="button" i], input[type="submit" i], input[type="reset" i],
	input[type="file" i]::-webkit-file-upload-button, button {
	align-items: flex-start;
	text-align: center;
	cursor: default;
	color: buttontext;
	background-color: buttonface;
	box-sizing: border-box;
	padding: 2px 6px 3px;
	border-width: 2px;
	border-style: outset;
	border-color: buttonface;
	border-image: initial;
}

input[type="button" i], input[type="submit" i], input[type="reset" i] {
	-webkit-appearance: push-button;
	user-select: none;
	white-space: pre;
}

.navbar-default {
	background-color: #ffffff;
	border-color: #e7e7e7;
}

#header_of_header_wrapper {
	border-bottom: 1px solid #d9534f;
	height: 24px;
	width: 100%;
}

#header {
	border-bottom: 1px solid #d9534f;
	box-shadow: 0 6px 7px -8px rgba(0, 0, 0, .2);
	width: 100%;
	z-index: 2;
	top: 0;
	background-color: #fff;
	margin-bottom: 10px;
	clear: both;
}

#header_of_header_wrapper #header_of_header {
	max-width: 1300px;
	margin: 0 auto;
}

#header_of_header_wrapper #header_of_header div.btn_wrapper_left {
	float: left;
}

#header_of_header_wrapper #header_of_header div.btn_wrapper_left a {
	padding-left: 7px;
	margin-left: 0;
}

#header_of_header_wrapper #header_of_header a {
	color: #d9534f;
	float: left;
	font-size: 8pt;
	padding: 5px 0px 0px 0px;
	margin-left: 15px;
	text-decoration: none;
}

.navbar-default .navbar-nav>li>a {
	color: #d9534f;
}

#target {
	color: #d9534f;
	/* font-size: 8pt; */
	/* font-family: 'Spoqa Han Sans','Spoqa Han Sans JP','맑은 고딕',Dotum,'Apple SD Gothic Neo',Sans-serif; */
	font-family: 'FontAwesome';
	src: url('../fonts/fontawesome-webfont.eot?v=4.7.0');
	src: url('../fonts/fontawesome-webfont.eot?#iefix&v=4.7.0')
		format('embedded-opentype'),
		url('../fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'),
		url('../fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'),
		url('../fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'),
		url('../fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular')
		format('svg');
	font-weight: normal;
	font-style: normal font-size: 14px;
}

#qtip-overlay.blurs, .btn_flat, .notitle .ui-dialog-buttonpane button,
	.qtip-close, a, button {
	cursor: pointer;
}

a:-webkit-any-link {
	color: #black;
	cursor: auto;
}

#header_of_header_wrapper #header_of_header div.stat_wrapper {
	float: left;
	margin: 5px 0 5px 5px;
	padding: 0 8px;
	font-size: 8pt;
	border-left: 1px solid #ccc;
}

#header_of_header_wrapper #header_of_header div.stat_wrapper .stat {
	color: #d9534f;
	font-weight: 700;
}

#header_of_header_wrapper #header_of_header div.btn_wrapper_right1 {
	float: right;
	height: 25px;
	padding: 0 8px;
	font-size: 8pt;
}

#header_of_header_wrapper #header_of_header .order_history {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAACXBIW…G4V7iblOwgaXKrMYu9hhHYOzdkcc/A7ovD2aux1k/+GgAXfSsuOD/PsAAAAABJRU5ErkJggg==)
		0 50% no-repeat;
	padding-left: 18px;
}

#header_of_header_wrapper #header_of_header .order_history1 {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAACXBIW…G4V7iblOwgaXKrMYu9hhHYOzdkcc/A7ovD2aux1k/+GgAXfSsuOD/PsAAAAABJRU5ErkJggg==)
		0 50% no-repeat;
	padding-left: 18px;
}

#header_of_header_wrapper #header_of_header a {
	color: #d9534f;
	float: left;
	font-size: 8pt;
	margin-left: 15px;
	text-decoration: none;
}

.btn {
	cursor: pointer;
	text-transform: capitalize;
}

#main_menu_container {
	display: none;
}

#main_menu_container {
	position: relative;
}

#main_menu_container #main_menu {
	width: 1300px;
	margin: 0 auto;
}

#main_menu_container .main_menu {
	float: left;
}

#main_menu_container .main_menu:first-child a {
	padding-left: 10px;
}

#main_menu_container .main_menu a {
	display: block;
	color: #d9534f;
	text-decoration: none;
	font-size: 13px;
	padding: 20px 27px;
	font-family: gotham-medium;
}

#qtip-overlay.blurs, .btn_flat, .notitle .ui-dialog-buttonpane button,
	.qtip-close, a, button {
	cursor: pointer;
}

#itemid {
	font-weight: bold;
	font-family: 'gotham-medium';
	font-size: 18px;
	color: #d9534f;
	text-decoration: none;
}

#header #header_wrapper .search {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
	font-size: 14px;
	letter-spacing: 1px;
	padding-bottom: 10px;
	padding-top: 10px;
	padding-left: 35px;
	width: 480px;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAACXBIW…LPBU/Cl4Cz8KXgMdxbyPwrwDFcgbdXHMUY7p/u8Rq6DwBNsKOS7bhwaQAAAABJRU5ErkJggg==)
		5px 50% no-repeat;
	background-size: 24px 24px;
	border: 0;
	border-radius: 3px;
	border: 1.5px solid #d9534f;
	outline: 0;
	transition: width 150ms cubic-bezier(.165, .84, .44, 1), opacity 150ms
		cubic-bezier(.165, .84, .44, 1);
}

#important {
	color: #999999;
}

#thisistitle {
	color: #black;
	vertical-align: center;
}

#bannercheck {
	margin-top: 50px;
	margin-left: 800px;
	vertical-align: center;
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

input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: #ffffff;
    background-color: #d9534f;
    box-sizing: border-box;
    padding: 2px 6px 3px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}

</style>


<title>BOARD WRITE</title>

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
			style="margin-left: 400px; margin-right: 400px; margin-top: 100px;">
			<div>
				<div>
					<div class="col-md-12">

						<!--   게시판시작      -->
						<div class="col-md-12">
							<div class="jumbotron"
								style="margin-top: 45px; text-align: center;">
								<div class="container" style="margin: auto; text-align: center;">
									<h1>Board Write</h1>
									<p>문의사항을 남겨주세요.</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>
							
							<form action="/customerboard/write" name="write" id="write"
								method="post">

								<table class="tg" width="800px" height="200px">

									<tr>
										<th style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;" class="tg-031e">Id</th>
										<td style="border-bottom:1px solid #d9534f; border-top:1px solid #d9534f;"><input style="border-color:rgba(0,0,0,.075); width:500px;" type="text" id="id" name="id"></input>
										</td>
									</tr>


									<tr>
										<th style="border-bottom:1px solid #d9534f;" class="tg-031e">Title</th>
										<td style="border-bottom:1px solid #d9534f;"><input style="border-color:rgba(0,0,0,.075); width:500px; align:center;" type="text" id="title" name="title"></input></td>
									</tr>

									<tr>
										<td style="border-bottom:1px solid #d9534f; align:center;" colspan="2"><textarea align="center" rows="20" cols="100"
												title="content" id="content" name="content"></textarea></td>
									</tr>
								</table>


								<br /> <br /> <br /> <br /> 
								<div id="bannercheck">
								<input style="background-color: #d9534f; border: solid 1px #d9534f; padding:6px 5px; color: #ffffff;" class="btn btn-danger" type="submit" name="작성하기" value="업로드" id="write"> 
								<button style="background-color: #d9534f; border: solid 1px #d9534f; border-radius:6px; color: #ffffff;"
											class="btn btn-danger" type="button" onClick="location.href='listall'" id="list">목록으로 가기</button></div>

							</form>

						</div>

						<br /> <br />
						<br /> <br /> <br />
						<br /> <br /> <br /> <br />
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