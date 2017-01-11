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
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', '맑은 고딕', Dotum,
		'Apple SD Gothic Neo', Sans-serif;
}

body {
	padding-top: 40px;
}
</style>
</head>
<title>Item Posting</title>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		$("#save").click(function() {

			alert("save!");

			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		})

		counter = 1;

		$("#addButton").click(function() {
			a();

		});

		//alert("?");

		$("#removeButton").click(function() {
			if (counter == 1) {
				alert("No more textbox to remove");
				return false;
			}

			counter--;

			$("#TextBoxDiv" + counter).remove();

		});

		a();

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

	function a() {
		if (counter > 10) {
			alert("최대10개까지 가능");
			return false;
		}

		var newTextBoxDiv = $(document.createElement('div')).attr("id",
				'TextBoxDiv' + counter);

		newTextBoxDiv.after().html(
				'<label>Textbox #' + counter + ' : </label>'
						+ '<input type="text" name="a"  id="color' + counter
						+ '" placeholder="(색상)" style="font-size:8pt;">'
						+ '<label>Textbox #' + counter + ' : </label>'
						+ '<input type="text" name="a"  id="amount' + counter
						+ '"  placeholder="(수량)" style="font-size:8pt;">');

		newTextBoxDiv.appendTo("#TextBoxesGroup");

		counter++;
	}

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
			style="margin-left: 400px; margin-right: 400px; margin-top: 8px;">
			<div>
				<div>
					<div class="col-md-12">
						<div class="col-md-12">
	<div>
		<div class="col-md-12">
			<div class="jumbotron" style="margin-top: 140px; text-align: center;">
				<div class="container" style="margin: auto; text-align: center;">
					<h1>Item Posting Page</h1>
					<p>Item Posting Page</p>
					<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면 말쟝!</a>
				</div>
			</div>

			<br />
			<hr style="border-top:1px solid #d9534f;">	
			<br />
		</div>

		<div class="row" style="margin-left: 200px; margin-right: 180px;">
			<div class="col-md-12">


				<form id="frm" action="/item/upload" method="post"
					enctype="multipart/form-data">

					<div class="form-group">

						<h3>Brand name</h3>
						<h3>${userVO.id}</h3>
					</div>

					<div class="form-group">
						<label><img
							src="/resources/glyphicons/glyphicons-383-dress.png"
							aria-hidden="true">Item name</label> <input type="text"
							class="form-control" placeholder="상품명을 적어 주세요." name="name">
					</div>

					<div class="form-group">
						<label>Item price</label> <input type="number"
							class="form-control" placeholder="상품 가격을 적어 주세요." name="price">

					</div>

					<div class="form-group">
						<label>Category</label> <select class="form-control"
							name="categorycode">

							<option>COAT</option>
							<option>JACKET</option>
							<option>CARDIGAN</option>
							<option>KNIT</option>
							<option>SHIRT</option>
							<option>TSHIRT</option>
							<option>PANTS</option>
							<option>SHORTS</option>
							<option>SKIRT</option>
							<option>DRESS</option>
							<option>BAG</option>
							<option>JEWELRY</option>
							<option>SHOES</option>
						</select>
					</div>


					<div class="form-group">
						<label>Item color</label> <select class="form-control"
							name="colorcode">

							<option>R</option>
							<option>G</option>
							<option>B</option>
							<option>Y</option>
							<option>W</option>
							<option>BL</option>
							<option>GR</option>
							<option>BE</option>

						</select>
					</div>

					<div class="form-group">
						<label>Temperature</label> <select class="form-control"
							name="tempcode">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
					</div>



					<div id="detail">
						<label>Detailed color&amount</label>
						<div id='TextBoxesGroup'>
							<div id="TextBoxDiv1"></div>

						</div>
					</div>
					<input type='button' value='+' id='addButton'> <input
						type='button' value='-' id='removeButton'>




					<div class="form-group">
						<label>File input</label> <input type="file" name="imgfile">

					</div>


					<textarea rows="10" cols="30" name="smarteditor" id="smarteditor"
						style="width: 690px; height: 312px;"></textarea>

					<input type="button" id="save" value="submit" />

				</form>
			</div>
		</div>
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