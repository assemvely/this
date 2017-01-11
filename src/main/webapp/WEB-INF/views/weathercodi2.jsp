<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">

	var canvas;
	var ctx;
	var image = new Image();
	var list = new Array();
	var imglist = new Array();
	var categorycode;
	var imagename;
		
	<c:forEach items="${selected_tempcode_itemlist}" var="itemvo">
	
		 categorycode = "${itemvo.categorycode}";			
		 imagename = "${itemvo.imgname}";
					 
 			list.push(categorycode);
			imglist.push(imagename); ;
			
			
	</c:forEach>	
			
			$(document).ready(function() {				

				canvas = document.getElementById("canvas");
				ctx = canvas.getContext("2d");
				
				for(var i=0; i<list.length; i++)
					{
					
						if(list[i] == 'TSHIRT' || list[i] == 'KNIT'|| list[i] == 'SHIRT')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 20, 20, 300, 300);					
						}
						else if(list[i] == 'PANTS' || list[i] == 'SHORTS')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 30, 200, 200, 300);					
						}
						else if(list[i] == 'COAT' || list[i] == 'JACKET' || list[i] == 'CARDIGAN')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 300, 20, 300, 400);					
						}
						else if (list[i] == 'SHOES') 
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];
							ctx.drawImage(image, 300, 300, 150, 150);
						}
						else if (list[i] == 'BAG') 
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];
							ctx.drawImage(image, 150, 70, 200, 300);
						} 					
					}			
			});
</script>
<style type="text/css">

	#canvas
	{	
		display : inline;
		position : absolute;
		top :  100px;
		left : 300px;
		margin : 10 auto;

	}
	
	#refresh
	{
		position : absolute;
		top :  115px;
		left : 738px;
	}
	
	#imgbox
	{
		display  : inline;
		position : absolute;
		top :630px;
		left : 300px;
		margin : 10 auto;
			
	}

	#weatherinfo
	{
		position : absolute;
		top :  150px;
		align : center;
		left : 50px;
				
	}
	

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


</head>
<body style="margin-left:400px; margin-right:400px;">
 <%@ include file="css.jinc" %>
 
 	<div class="col-md-12">
 	
 	
	<h1>weather 페이지</h1>
		
	
	<span id = "weatherinfo">
	<h1>오늘 날씨</h1>
	<c:choose>
		<c:when test="${todayskyname=='맑음'}">
			<img  src="/resources/weather/맑음.png" alt="no images" width="150" height="150">			
		</c:when>
		<c:when test="${todayskyname=='구름조금'}">
			<img  src="/resources/weather/구름조금.png" alt="no images"width="150" height="150">
		</c:when>
		<c:when test="${todayskyname=='구름많음'}">
			<img  src="/resources/weather/구름많음.png" alt="no images" width="150" height="150">
		</c:when>
		<c:when test="${todayskyname=='흐림'}">
			<img src="/resources/weather/흐림.png" alt="no images" width="150" height="150">
		</c:when>
		<c:when test="${todayskyname=='비'}">
			<img src="/resources/weather/비.png"  alt="no images" width="150" height="150">
		</c:when>
		<c:when test="${todayskyname=='눈'}">
			<img  src="/resources/weather/눈.png" alt="no images" width="150" height="150">
		</c:when>
		<c:when test="${todayskyname=='비 또는 눈'}">
			<img src="/resources/weather/비또는눈.png" alt="no images"  width="150" height="150">
		</c:when>
	</c:choose>
	<h3>최고 기온 : ${todaytemperaturetmax}</h3>
	<h3>최저 기온 : ${todaytemperaturetmin}</h3><br/>
	</span>
	
	<canvas id="canvas" width=500 height=500 style="box-shadow:3px 3px 8px #3f0000;"></canvas>
	
	<span id = "imgbox">
	<c:forEach items="${selected_tempcode_itemlist}" var="itemvo">		
			<img id="${itemvo.categorycode}" src="/resources/itemimg/${itemvo.imgname}" style="WIDTH:100PX; HEIGHT:100PX;"/>	
	</c:forEach>
	</span>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<img id="refresh" src="/resources/weather/refresh.png" style="WIDTH:50px; HEIGHT:50px;" onClick="window.location.reload()"/>
		<br>
	
</div>
</body>
</html>