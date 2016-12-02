<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
#h2 {
    position: absolute;
    left: 1450px;
    top: 80px;
    color: red;
}
@font-face {
   font-family: 'Nanum Gothic Coding', monospace;
   padding-top: 70px;
}

#main_footer {
   /* footer 중앙 정렬 */
   width: 960px;
   margin: 0 auto;
   margin-bottom: 10px;
   /* footer 글씨 정렬 */
   text-align: center;
}

body {
   padding-top: 40px;
   
}
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
.nav-counter {
 position:absolute;
 top: 5px;
 right: 5px;
 min-width: 8px;
 height: 20px;
 line-height: 20px;
 margin-top: -12px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
}
</style>

<head>
<title>Item Posting</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<!-- <link rel="stylesheet" href="owl.carousel/owl.theme.default.min.css"> -->
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<!-- <script src="/resources/owl.carousel/owl.carousel.js"></script> -->
<script type="text/javascript" src="/resources/Editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
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
			elPlaceHolder :"smarteditor",
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/resources/Editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar :true,
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
						+ '<input type="text" name="a"  id="color'+ counter+ '" placeholder="(색상)" style="font-size:8pt;">'
						+ '<label>Textbox #' + counter + ' : </label>'+ '<input type="text" name="a"  id="amount'+ counter+ '"  placeholder="(수량)" style="font-size:8pt;">');

		newTextBoxDiv.appendTo("#TextBoxesGroup");

		counter++;
	}
</script>
</head>
<body>

	<%@ include file="css.jinc"%>
	<br/>
	<br/>
 
		  <div style="margin-left:400px; margin-right:400px;">
					<div class="col-md-12">
						<div class="jumbotron"
							style="margin-top: 140px; text-align: center;">
							<div class="container" style="margin: auto; text-align: center;">
								<h1>Item Posting Page</h1>
								<p>Coat Jacket Cardigan</p>
								<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
									말쟝!</a>
							</div>
						</div>

						<br />
						<hr />
						<br />

						<div style="text-align: center;">
							<h3>
								<span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>
								Posting <span class="glyphicon glyphicon-duplicate"
									aria-hidden="true"></span>
							</h3>
							<hr />
							<br /></div>
					
   
 
						</div>

							 <div class="row" style="margin-left:200px; margin-right:180px;">
							 <div class="col-md-12"  >
					
						
 	<form id="frm" action="/item/upload" method="post" enctype="multipart/form-data" >
							
								<div class="form-group">

									<label><img
										src="/resources/glyphicons/glyphicons-792-user-vr.png"
										aria-hidden="true">Brand name</label>
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
						
					
						<textarea  rows="10" cols="30" name="smarteditor" id="smarteditor" style="width:690px; height:312px;"></textarea>
					
					<input type="button" id="save" value="submit" />
					
			 </form>
			 </div>
						</div>
					</div>
					 
</body>

</html>