<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
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
</style>

<head>
<title>Outer</title>
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

<script>
	function onChangeSelect() {
		//alert("!");

		//YG// CASE : NOT WORKING -- 제이쿼리 선택자 안에서 #은 ID, .은 CLASS, 없으면 태그이름(ex.TABLE, TR, DIV, ...)
		//var selected = $("selectlittlecategory").val();
		//alert("selected : " + selected);

		//YG// CASE : WORKING
		var selected = $("#selectlittlecategory").val();
		//alert("selected : " + selected);

		if (selected != "0") {
			var selectedUppercase = selected.toUpperCase();

			document.getElementById("Form1").submit();
			form.Form1.submit();

		}

	}

	$(document).ready(function() {

	})
</script>

</head>
<body>
 
	 <%@ include file="css.jinc" %>

		<div class="col-md-12">
			<div class="jumbotron" style="margin-top: 140px; text-align: center;">
				<div class="container" style="margin: auto; text-align: center;">
					<h1>Outer</h1>
					<p>Coat Jacket Cardigan</p>


					<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면 말쟝!</a>
				</div>
			</div>

			<br />
			<hr />
			<br />

			<div style="text-align: center;">
				<h3>
					<img src="/resources/glyphicons/glyphicons-384-bathrobe.png"
						aria-hidden="true"> Outer <img
						src="/resources/glyphicons/glyphicons-384-bathrobe.png"
						aria-hidden="true">

				</h3>

				<br />

			</div>

			<!-- 아우터 이모티콘 부분 끝. -->

			<!-- 정렬하는 부분 시작 !-->
			<form name="Form1" id="Form1" action="/item/outer" method="GET">
				<div class="dropdown">
					<!-- //YG// GOOGLE : "select 초기값" -> <option>태그 안에 SELECTED속성을 "SELECTED"로 설정하면, 화면이 새로고침 되었을 때 해당 란이 선택된 상태로 페이지가 시작이 됩니다.
					<select id="selectlittlecategory" name="outer" onchange="onChangeSelect()"> 
						<option name="outer" value="0">Category</option>
						<option name="outer" value="coat">Coat</option>
						<option name="outer" value="jacket">Jacket</option>
						<option name="outer" value="cardigan">Cardigan</option>
					</select>
					-->
					<!-- YG 曰, 컨트롤러에서 model.addAttbitue()으로 담아준 애는 jsp에서 request.getAttribute()을 사용하여 받아낼 수 있어요. 이해 되셨으면 이 문장을 지웁니다. -->
					<select id="selectlittlecategory" name="outer"
						onchange="onChangeSelect()">
						<option name="outer" value="0">Category</option>
						<option name="outer" value="coat"
							<%if ("COAT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
							SELECTED="SELECTED" <%}%>>Coat</option>
						<option name="outer" value="jacket"
							<%if ("JACKET".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
							SELECTED="SELECTED" <%}%>>Jacket</option>
						<option name="outer" value="cardigan"
							<%if ("CARDIGAN".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
							SELECTED="SELECTED" <%}%>>Cardigan</option>
					</select>

				</div>

				<!-- 정렬하는 부분 끝 !-->

			</form>
			<br />
			<hr />
			<br />



			<!-- 뿌리기 시작!! -->


			<div class="row">

				<c:forEach items="${SELECTCATEGORY}" var="outervo">
					<div class="col-lg-3 text-center">


						<div class="thumbnail">
						<a href="/item/readposting?clothcode=${outervo.clothcode}">	<img src="/resources/itemimg/${outervo.imgname} " alt="No Image"></a>
							<div class="caption">
								<h3>${outervo.id}</h3>
								<p>${outervo.name}</p>
								<p>${outervo.price}원</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">좋아요</a> <a
										href="#" class="btn btn-default" role="button">싫어요</a>
								</p>
							</div>

						</div>
					</div>
				</c:forEach>

			</div>