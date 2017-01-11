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
<script src="/resources/navbar/js/jquery-1.10.2.js"></script>
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>
<script type="text/javascript"
	src="/resources/Editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

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
	height: 50px;
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
	border-image: initial;
}

#bannercheck {
	margin-top: 30px;
	margin-left: 910px;
	vertical-align: center;
}
</style>


<title>Banner Posting</title>

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smarteditor",
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/resources/Editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["smarteditor"].exec("PASTE_HTML", [ "포스팅" ]);
			},
			fCreator : "createSEditor2"
		});

		$("#save").click(function() {
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		})

	});
	
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
	<div style="margin-left: 400px; margin-right: 400px; margin-top: 50px;">
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<form id="frm" action="/manager/insert" method="post"
			enctype="multipart/form-data">

			<table class="tg" width="1000px" height="100px">


				<tr>
					<th
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f; width: 200px;"
						class="tg-031e">제목</th>
					<td
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f;"
						class="tg-yw4l"><input
						style="margin-left: 10px; padding-left: 10px; border-color: rgba(0, 0, 0, .075); width: 500px;"
						type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<th
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f; width: 200px;"
						class="tg-031e">내용</th>
					<td
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f; align: center;"
						class="tg-yw4l"><textarea rows="10" cols="30"
							id="smarteditor" name="smarteditor"
							style="width: 766px; height: 412px;"> 
				</textarea></td>


				</tr>

				<tr>
					<th
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f; width: 200px;"
						class="tg-031e">베너이미지 설정</th>
					<td
						style="border-bottom: 1px solid #d9534f; border-top: 1px solid #d9534f;"
						class="tg-yw4l"><input style="margin-left:10px;" type="file" name="imageFile"></td>
				</tr>

				<tr>
					<td
						style="border-bottom: 1px solid #ffffff; border-top: 1px solid #d9534f; text-align:right; padding-right:20px;"
						class="tg-yw4l" colspan="2"><input
						style="align-items: flex-start; text-align: center; cursor: default; color: #ffffff; background-color: #d9534f; box-sizing: border-box; padding: 13px 13px; border-width: 0px; border-style: solid; border-color: #d9534f; border-image: initial;"
						type="button" id="save" value="저장" /><input
						style="margin-left:10px;align-items: flex-start; text-align: center; cursor: default; color: #ffffff; background-color: #d9534f; box-sizing: border-box; padding: 13px 13px; border-width: 0px; border-style: solid; border-color: #d9534f; border-image: initial;"
						type="button" value="취소" /></td>


				</tr>
			</table>


		</form>
	</div>
	<a href="#" class="jcm-top"><img
							src="/resources/glyphicons/glyphicons-214-arrow-upupup.png"
							style="margin-bottom: 24px; width: 25px;"></a>

</body>
<br/><br/>
<br/>

<%@ include file="footer.jinc"%>

</html>