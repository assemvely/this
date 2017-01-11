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

#btn {
	margin-bottom: 25px;
	margin-top: 25px;
	margin-left: 900px;
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
	padding: 15px 5px;
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
	border-color: #ccc;
	color: #ffffff;
	background-color: #d9534f;
	border-top-width: 1px;
	border-bottom-width: 1px;
	text-align: center;
	vertical-align: center;
}

.tg .tg-58iv {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif !important;;
	ss vertical-align: center;
}

.tg .tg-yw4l {
	vertical-align: center;
	align: left;
	padding-left: 15px;
}

#jusosearch {
	align-items: flex-start;
	text-align: center;
	cursor: default;
	color: #ffffff;
	background-color: #d9534f;
	box-sizing: border-box;
	padding: 10px 16px;
	font-size: 14px;
	border-width: 2px;
	border-color: #d43f3a;
	border-style: none;
	border-radius: 6px;
}

input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: buttonface;
    box-sizing: border-box;
    padding: 16px 16px;
    border-width: 2px;
    border-style: solid;
    border-color: #d9534f;}
</style>
<title>Buy Page</title>
</head>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#btn").on(
						"click",
						function() {

							var name = $("#name").val();
							var address = $("#address").val();
							var howtopay = $("#howtopay").val();

							$.ajax({

								contentType : 'application.json',
								type : 'post',
								url : '/item/ordertaker',
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "POST"

								},

								dataType : 'text',
								data : JSON.stringify({
									name : name,
									address : address,
									howtopay : howtopay
								}),

								success : function(data) {
									var jsonData = JSON.parse(data);
									str = "<li>받으시는 분:" + jsonData.name
											+ "</li>" + "<li>주소:"
											+ jsonData.address + "</li>"
											+ "<li>총 상품금액:" + jsonData.price
											+ "</li>" + "<li>총 배송비:"
											+ jsonData.deliverycharge + "</li>"
											+ "<li>총 적립금:" + jsonData.mileage
											+ "</li>" + "<li>결제수단:"
											+ jsonData.howtopay + "</li>";

									$("#ordertakerinfo").append(str);

									$("#myModal").modal('toggle');
								}

							});

						});

			});
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/item/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.address.value = roadFullAddr;

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
<body>
	<%@ include file="secondstyle.jinc"%>
	<%@ include file="header.jinc"%>
	<div>
		<div
			style="margin-left: 400px; margin-right: 400px; margin-top: 200px;">
			<div>
				<div>
					<div class="col-md-12">
						<div class="col-md-12">
							<form name="form" id="form" method="post"
								action="/item/ordertaker">

								<table class="tg" width="800px" height="200px">
									<tr>
										<th class="tg-031e"><font color="#ffffff">Image</font></th>
										<th class="tg-031e"><font color="#ffffff">Name</font></th>
										<th class="tg-031e"><font color="#ffffff">Brand</font></th>
										<th class="tg-031e"><font color="#ffffff">Price</th>
										<th class="tg-031e"><font color="#ffffff">Color</th>
										<th class="tg-031e"><font color="#ffffff">Amount</th>
										<th class="tg-031e"><font color="#ffffff">Delivery
												Charge</th>
										<th class="tg-031e"><font color="#ffffff">Mileage</th>
									</tr>

									<c:forEach items="${shoppinglist}" var="itemVo">
										<tr>
											<td class="tg-yw4l"><a
												href="/item/readposting?clothcode=${itemVo.clothcode}">
													<img width="50px;" height="auto;"
													src="/resources/itemimg/${itemVo.imgname} " alt="No Image">
											</a></td>
											<td class="tg-yw4l">${itemVo.id}</td>
											<td class="tg-yw4l">${itemVo.name}</td>
											<td class="tg-yw4l">${itemVo.price}</td>
											<td class="tg-yw4l">${itemVo.color}</td>
											<td class="tg-yw4l">${itemVo.amount}</td>
											<td class="tg-yw4l">2500</td>
											<td class="tg-yw4l">${itemVo.price*0.1}</td>
										</tr>

									</c:forEach>
								</table>

								<div id="list"></div>
								<div id="callBackDiv">
									<table class="tg" width="800px" height="200px">
										<tr>

											<td class="tg-yw4l">도로명주소</td>
											<td class="tg-yw4l"><input type="text"
												style="width: 500px; padding-left: 15px;" id="address"
												name="address" /> <input id="jusosearch"
												style="margin-left: 15px;" type="button"
												onClick="goPopup();" value="주소검색" /></td>
										</tr>
										<tr>
											<td class="tg-yw4l">받으시는 분</td>
											<td class="tg-yw4l"><input type="text"
												style="width: 500px;" id="name" name="name" /></td>
										</tr>
										<tr>
											<td class="tg-yw4l">이메일</td>
											<td class="tg-yw4l">${login.email}</td>
										</tr>
										<tr>
											<td class="tg-yw4l">전화번호</td>
											<td class="tg-yw4l"><input type="text"
												style="width: 500px;" id="ph" name="ph" /></td>
										</tr>
										<tr>
											<td class="tg-yw4l">총 상품금액</td>
											<td class="tg-yw4l">${ordertakerprice}</td>
										</tr>
										<tr>
											<td class="tg-yw4l">총 배송비</td>
											<td class="tg-yw4l">${ordertakerdeliverycharge}</td>
										</tr>
										<tr>
											<td class="tg-yw4l">총 적립금</td>
											<td class="tg-yw4l">${ordertakermileage}</td>
										</tr>
										<tr>
											<td class="tg-yw4l">결제수단</td>
											<td class="tg-yw4l"><input style="font-size: 20px; border: 1px solid #d9534f; width: 10px; height: 10px;" TYPE='radio' id='howtopay'
												name='howtopay' value='적립금' checked /> <label for='적립금'>적립금</label>
												<input style="font-size: 20px; border: 1px solid #d9534f; width: 10px; height: 10px;" TYPE='radio' id='howtopay' name='howtopay' value='카드' />
												<label for='카드'>카드</label> <input style="font-size: 20px; border: 1px solid #d9534f; width: 10px; height: 10px;" TYPE='radio' id='howtopay'
												name='howtopay' value='무통장입금' /> <label for='무통장입금'>무통장입금</label></td>
										</tr>
									</table>

								</div>

							</form>
							<button id="btn" class="btn btn-danger btn-lg">구매</button>
							<div class="container">

								<!-- 모달 팝업 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">x</span><span class="sr-only">Shopping</span>
												</button>
												<h4 style="color:#d9534f;" class="modal-title" id="myModalLabel">구매 정보 확인</h4>
											</div>
											<div class="modal-body">


												<h5 id="ordertakerinfo"></h5>


											</div>
											<div class="modal-footer">
												<form action="/all/main" method="post">
													<input style="background-color:#d9534f; border:1px solid #d9534f; padding:16px 16px; color:#ffffff" type="submit" value="Done" name="submit"
														class="btn btn-danger" />

												</form>

											</div>
										</div>
									</div>
								</div>



							</div>


							<script src="http://code.jquery.com/jquery-latest.min.js"></script>
							<script
								src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
							<script
								src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
							<!-- ie10-viewport-bug-workaround.js -->
							<script
								src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
							<!-- holder.js -->

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