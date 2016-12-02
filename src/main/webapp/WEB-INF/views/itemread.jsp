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
<title>Home</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="Stylesheet" href="/resources/css/bootstrap.min.css" /> 

<!-- =========================================================================== -->
 
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
<script type="text/javascript">
	 $(document).ready(function(){
		 
		  $("#cartbtn").on("click",function(){
			  var color=$("#color option:selected").val();
			  var amount=$("#amount").val();
			  var clothcode=$("#clothcode").val();
			  var price=$("#price").val();
			  var name=$("#name").val();
			  var imgname=$("#imgname").val();
		 
			  $.ajax({
				contentType:'application.json',
				type:'post',
				url:'/item/incart',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
					
				},
				dataType:'text',
				data: JSON.stringify({
					color:color,
					amount:amount,
					clothcode:clothcode,
					price:price,
					imgname:imgname,
					name:name
				}),
				success:function(data){
			   		 
		/*     var str="";
			   		$(data).each(function(){
			   			str+="<h3>"+this.color+"/"+this.amount+"</h3>";
			   			
			   		});   */
			   		
			   		var jsonData = JSON.parse(data);
			   		
			   		$("#coloramount").append(jsonData.color);
			   		$("#coloramount").append(jsonData.amount);
					 $("#myModal").modal('toggle');
				}
				
			  });

		  });
		 
	 });
	 
	 
</script>

</head>
<body>
	
	 <%@ include file="css.jinc" %>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
 <br/>
 <div class="col-md-12" style="margin-left:400px; margin-righg:400px;">
<form action=/item/buy>
<li><img src="/resources/itemimg/${READ.imgname}" alt="이미지가 없습니다"></li>

<li >name:${READ.name}</li>
<br/>
<br/>
<li>Price:${READ.price}</li>
<li>mileage:${READ.mileage}</li>
	
<select id="color" name="color">
		 <c:forEach items="${COLOR}" var="COLOR">
		 		<option  value="${COLOR.color}">${COLOR.color}</option>
		 	</c:forEach>
		 	</select>
		 	 	
<input type="number" name="amount" id="amount" placeholder="amount"/>
	
<input type="hidden" id="clothcode"name="clothcode" value="${READ.clothcode}"/>
 <input type="hidden" id="imgname" name="imgname" value="${READ.imgname}"/>
<input type="hidden" id="name" name="name" value="${READ.name}"/>
<input type="hidden" id="price" name="price" value="${READ.price}"/>
 

 
  <input type="submit" value="buy now!" name="submit" class="btn btn-primary btn-lg">

 </form>
 <button id="cartbtn" class="btn btn-primary btn-lg">cart</button>
  	<!-- 버튼 -->

 
 	<div class="container">
 	  
	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Shopping</span></button>
		<h4 class="modal-title" id="myModalLabel">cart</h4>
	      </div>
	      <div class="modal-body">
		 	<img src="/resources/itemimg/${READ.imgname}" alt="이미지가 없습니다">
		 	${READ.name}
		 <h4 id="coloramount"></h4>
		 	<br/>
		 	 <h4 id="coloramount"></h4>
		 	
	      </div>
	      <div class="modal-footer">
	      <form action="/item/cart">
	      <input type="submit" value="cart" name="submit" class="btn btn-primary"/>
	       
	      </form>
		<button type="button" class="btn btn-default" data-dismiss="modal">keep shopping</button>
		 
	      </div>
	    </div>
	  </div>
	</div>



</div>    
<br/>
<br/>
<br/>
<br/>
<hr/>
<li>${READ.content}</li>


<a href="/comment/list?clothcode=${READ.clothcode}">댓글보기</a>
</div>
  <!-- 1588모달모달~ -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
</body>
</html>