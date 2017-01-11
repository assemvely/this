<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>


</style>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS 깔기 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">

<!-- css admin깔기 -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="owl.carousel/owl.theme.default.min.css"> -->
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>
<!-- <script src="/resources/owl.carousel/owl.carousel.js"></script> -->
<title>Board Read One</title>
</head>
<body
	style="margin-left: 400px; margin-right: 400px; align: center; margin-top: 200px;">

	<%@ include file="css.jinc"%>
	<br />
	<br />
	<h3>Board Read One</h3>
	<br />
	<hr />
	<br />
	<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
	margin: 0px auto;
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
	color: #333;
	background-color: #f0f0f0;
	border-top-width: 1px;
	border-bottom-width: 1px;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;
	text-align: center
}

.tg .tg-yw4l {
	vertical-align: top
}
</style>
	<form method="get" action="/customerboard/listall">
		<table class="tg" width="800px" height="200px">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tr>
				<th class="tg-031e" scope="row">Bno</th>
				<td>${bno}</td>
				<th class="tg-031e" scope="row">Id</th>
				<td>${boardVo.id}</td>
			</tr>

			<tr>
				<th class="tg-031e" scope="row">Title</th>
				<td>${boardVo.title}</td>
				<th class="tg-031e" scope="row">Writedate</th>
				<td>${boardVo.writedate}</td>
			</tr>

			<tr>
				<td colspan="4">${boardVo.content}</td>
			</tr>



			<br />
			<br />
			<br />
			<br />
			<table>
				<tr>
					<td><button type="button"
							onClick="location.href='delete?bno=${bno}'">삭제하기</button></td>
					<td><button type="button"
							onClick="location.href='boardupdate?bno=${bno}'">수정하기</button></td>
					<td><button type="button" onClick="location.href='listall'">목록</button></td>
				</tr>
			</table>
		</table>

	</form>



</body>
</html>
