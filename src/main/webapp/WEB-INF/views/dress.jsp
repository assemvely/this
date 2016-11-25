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
<title>Dress</title>
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

		var selected = $("#selectlittlecategory").val();

		if (selected != "0") {
			var selectedUppercase = selected.toUpperCase();

			document.getElementById("Form5").submit();
			form.Form5.submit();

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
					<h1>Dress</h1>
					<p>Dress</p>
					<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면 말쟝!</a>
				</div>
			</div>

			<br />
			<hr />
			<br />

			<div style="text-align: center;">
				<h3>
					<img src="/resources/glyphicons/glyphicons-383-dress.png"
						aria-hidden="true"> Dress <img
						src="/resources/glyphicons/glyphicons-383-dress.png"
						aria-hidden="true">
				</h3>

				<br />

			</div>

			<!-- 아우터 이모티콘 부분 끝. -->
			
			<!-- 정렬하는 부분 시작 !-->
			<form name="Form5" id="Form5" action="/item/dress" method="GET">
				<div class="dropdown">
					<select id="selectlittlecategory" name="dress" onchange="onChangeSelect()">
						<option name="dress" value="0">Category</option>
						<option name="dress" value="dress"
						<% if("DRESS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) { %>
							SELECTED="SELECTED"
						<% } %>
						>Dress</option>
					</select>
				</div>

				<!-- 정렬하는 부분 끝 !-->

			<br />
			<hr />
			<br />


			<!-- 뿌리기 시작!! -->


			<div class="row">

				<c:forEach items="${SELECTCATEGORY}" var="dressvo">
					<div class="col-lg-3 text-center">


						<div class="thumbnail">
				<a href="/item/readposting?clothcode=${dressvo.clothcode}">	<img src="/resources/itemimg/${dressvo.imgname} "
												alt="No Image"> </a>
											<div class="caption">
												<h3>${dressvo.id}</h3>
												<p>${dressvo.name}</p>
												<p>${dressvo.price}원</p>
												<p>
													<a href="#" class="btn btn-primary" role="button">좋아요</a> <a
														href="#" class="btn btn-default" role="button">싫어요</a>
												</p>
												
												 
											</div>

										</div>
									</div>
								</c:forEach>

							</div>