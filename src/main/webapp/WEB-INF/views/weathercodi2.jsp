<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script><!-- 그래프 그리기 -->
<script type="text/javascript"	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
					
						if(list[i] == 'TSHIRT' || list[i] == 'KNIT'|| list[i] == 'SHIRT' || list[i] == 'DRESS')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 20, 20, 300, 300);					
						}
						else if(list[i] == 'PANTS' || list[i] == 'SHORTS' || list[i] == 'SKIRT')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 30, 200, 200, 300);					
						}
						else if(list[i] == 'COAT' || list[i] == 'JACKET' || list[i] == 'CARDIGAN')
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];						
							ctx.drawImage(image, 200, 10, 300, 400);					
						}
						else if (list[i] == 'SHOES') 
						{
							//alert(list[i]+imglist[i]);
							image.src = "/resources/itemimg/"+imglist[i];
							ctx.drawImage(image, 300, 350, 150, 150);
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

 <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      /* 지금 시간으로부터 4,7,10,13,16시간 뒤의 기온정보를 각각 가져와 그래프로 만들어줍니당.  */ 
      function drawChart() {
        var data = google.visualization.arrayToDataTable
        ([
          ['time', 'Temparature'],
          ['${fourhoursafter_int}시',  ${temp4hour}],
          ['${sevenhoursafter_int}시',  ${temp7hour}],
          ['${tenhoursafter_int}시',  ${temp10hour}],
          ['${thirteenhoursafter_int}시',  ${temp13hour}],
          ['${sixteenhoursafter_int}시',  ${temp16hour}]
        ]);

        var options = {
          title: 'todays temparature',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
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
	
	#curve_chart
	{
		position : absolute;
		top :  150px;
		align : center;
		left : 850px;
				
	}
	
</style>


</head>
<body>

	<h1>weather 페이지</h1>
		
	
	<span id = "weatherinfo">
	<h1>오늘 날씨</h1>
		<h3> ${city} </h3>
		
	<c:choose>
		<c:when test="${todayskyname=='맑음'}">
			<img  src="/resources/weather/맑음.png" alt="no images" width="150" >			
		</c:when>
		<c:when test="${todayskyname=='구름조금'}">
			<img  src="/resources/weather/구름조금.png" alt="no images"width="150" >
		</c:when>
		<c:when test="${todayskyname=='구름많음'}">
			<img  src="/resources/weather/구름많음.png" alt="no images" width="150">
		</c:when>
		<c:when test="${todayskyname=='흐림'}">
			<img src="/resources/weather/흐림.png" alt="no images" width="150">
		</c:when>
		<c:when test="${todayskyname=='비'}">
			<img src="/resources/weather/비.png"  alt="no images" width="150" >
		</c:when>
		<c:when test="${todayskyname=='눈'}">
			<img  src="/resources/weather/눈.png" alt="no images" width="150">
		</c:when>
		<c:when test="${todayskyname=='비 또는 눈'}">
			<img src="/resources/weather/비또는눈.png" alt="no images"  width="150" >
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

		<img id="refresh" src="/resources/weather/refresh.png" style="WIDTH:50px; HEIGHT:50px;" onClick="window.location.reload()"/>
		<br>

	<div id="curve_chart" style="width: 900px; height: 500px"></div>

	

	<c:forEach items="${todayscomment}" var="todayscomment">		
		<h3>오늘의 추천 코디 : ${todayscomment}</h3>
	</c:forEach>

	
	

</body>
</html>