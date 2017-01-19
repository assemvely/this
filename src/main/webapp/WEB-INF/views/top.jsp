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
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/navbar/css/bootstrap.css" rel="stylesheet" />
<!-- <link href="/resources/navbar/css/pe-icon-7-stroke.css" rel="stylesheet" /> -->
<link href="/resources/navbar/css/ct-navbar.css" rel="stylesheet" />
<script src="/resources/navbar/js/jquery-1.10.2.js"></script>
<script src="/resources/navbar/js/bootstrap.js"></script>
<script src="/resources/navbar/js/ct-navbar.js"></script>

<title>ASSEMVELY TOP</title>

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
	<script>
	function onChangeSelect() {

		var selected = $("#selectlittlecategory").val();

		if (selected != "0") {
			var selectedUppercase = selected.toUpperCase();

			document.getElementById("Form2").submit();
			form.Form2.submit();
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

						<!--   OUTER시작      -->
						<div class="col-md-12">
							<div class="jumbotron"
								style="margin-top: 45px; text-align: center;">
								<div class="container" style="margin: auto; text-align: center;">
									<h1>Top</h1>
									<p>Knit Shirt Tshirt</p>
									<a class="btnbtn-primary btn-large" href="#">버튼을 하려면 하고 말라면
										말쟝!</a>
								</div>
							</div>

							<!-- <hr style="border-top:1px solid #d9534f;"> -->


							<!-- 정렬하는 부분 시작 !-->
							<form name="Form2" id="Form2" action="/item/top" method="GET">
								<h5 id="important"><b>CATEGORY</b></h5>
								<div class="dropdown">
									<select id="selectlittlecategory" name="top"
										onchange="onChangeSelect()">
										<option name="top" value="0">Category</option>
										<option name="top" value="knit"
											<%if ("KNIT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
											SELECTED="SELECTED" <%}%>>Knit</option>
										<option name="top" value="shirt"
											<%if ("SHIRT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
											SELECTED="SELECTED" <%}%>>Shirt</option>
										<option name="top" value="tshirt"
											<%if ("TSHIRT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
											SELECTED="SELECTED" <%}%>>Tshirt</option>
									</select>
								</div>
								<!-- 정렬하는 부분 끝 !-->
								<hr style="border-top: 1px solid #d9534f;">
								<br />


								<!-- 뿌리기 시작!! -->


								<div class="row">

									<c:forEach items="${SELECTCATEGORY}" var="topvo">
										<div class="col-lg-3 text-center">


											<div class="thumbnail">
												<a href="/item/readposting?clothcode=${topvo.clothcode}">
													<img src="data:image/jpeg;base64,${topvo.imgname} "
													alt="No Image">
												</a>
												<div class="caption">
													<a href="/user/mypage?id=${topvo.id}">
														<h3 id="itemid">${topvo.id}</h3>
													</a> <a href="/item/readposting?clothcode=${topvo.clothcode}">
														<p style="color: #999999;">${topvo.name}</p>
													</a>
													<p style="color: #d9534f;">${topvo.price}원</p>
													<div class="caption1">
														<p>
															<a href="/item/like?clothcode='${newitem.clothcode}'"
																class="btn btn-danger" id="like" role="button">♡</a>
														</p>
													</div>
												</div>

											</div>
										</div>
									</c:forEach>

								</div>
							</form>
						</div>

						<!--   OUTER끝    -->
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