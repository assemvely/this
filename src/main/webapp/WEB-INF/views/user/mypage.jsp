<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style type="text/css">
/* USER PROFILE PAGE */
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
.card {
   margin-top: 140px;
   padding: 30px;
   background-color: rgba(214, 224, 226, 0.2);
   -webkit-border-top-left-radius: 5px;
   -moz-border-top-left-radius: 5px;
   border-top-left-radius: 5px;
   -webkit-border-top-right-radius: 5px;
   -moz-border-top-right-radius: 5px;
   border-top-right-radius: 5px;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card.hovercard {
   position: relative;
   padding-top: 0;
   overflow: hidden;
   text-align: rigt;
   background-color: #fff;
   background-color: rgba(255, 255, 255, 1);
}

.card.hovercard .card-background {
   height: 230px;
   width: 480px;
}

.card-background img {
   -webkit-filter: blur(25px);
   -moz-filter: blur(25px);
   -o-filter: blur(25px);
   -ms-filter: blur(25px);
   filter: blur(25px);
   margin-left: -100px;
   margin-top: -200px;
   min-width: 200%;
}

.card.hovercard .useravatar {
   position: absolute;
   top: 15px;
   left: 0;
   right: 0;
}

.card.hovercard .useravatar img {
   width: 100px;
   height: 100px;
   max-width: 100px;
   max-height: 100px;
   -webkit-border-radius: 50%;
   -moz-border-radius: 50%;
   border-radius: 50%;
   border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .card-info {
   position: absolute;
   bottom: 14px;
   left: 0;
   right: 0;
}

.card.hovercard .card-info .card-title {
   padding: 0 5px;
   font-size: 20px;
   line-height: 1;
   color: #262626;
   background-color: rgba(255, 255, 255, 0.1);
   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;
   border-radius: 4px;
}

.card.hovercard .card-info {
   overflow: hidden;
   font-size: 12px;
   line-height: 20px;
   color: #737373;
   text-overflow: ellipsis;
}

.card.hovercard .bottom {
   padding: 0 20px;
   margin-bottom: 17px;
}

.btn-pref .btn {
   -webkit-border-radius: 0 !important;
}

.userinfo {
   font-size: 12px;
   right: 150;
 
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
<title>Insert title here</title>
 
<script type="text/javascript">


	function btn_delete()
	{
		if (confirm("탈퇴 하시겠습니까?") == true) { //확인
			location.replace('/user/deleteuser');
			
		} else { //취소
			return;
		}
	}
	
	
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS 깔기 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<!-- <link rel="stylesheet" href="owl.carousel/owl.theme.default.min.css"> -->
<!-- css admin깔기 -->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>

</head>

<body style="margin-left: 400px; margin-right: 400px;">
    <%@ include file="css.jinc"%>
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="/resources/image/8367cb771db775d39f09b8a5b547242a.jpg">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar" style="margin-top: 10px; text-align: center;">
           
           <c:choose>
           	<c:when test="${empty user.imgname}">
           	 	 <img src="/resources/userimg/null.jpg" alt=""/>
           	</c:when>
            <c:when test="${not empty user.imgname}">
           		 <img src="/resources/userimg/${user.imgname}" alt=""/>
           	</c:when>
           
           </c:choose> 
	<br/><br/>
	<br/>
        </div>
        <div class="card-info"  style="margin-top: 50px; margin: auto; text-align: center;"> <span class="card-title"><h4>구매자 ${user.id}</h4></span>
		 <div class="userinfo">	 
	  
		 
  <div class="userinfo"
            style="margin-top: 10px; margin: auto; text-align: center;">

  
   <c:choose>
   <c:when test="${followercounter==0}">
   <li>follower 0</li>
   </c:when>
   <c:when test="${followercounter>0}">
  <li>  <a href="/user/follower?id=${user.id}">follower ${followercounter}</a></li>
   </c:when>
   </c:choose>
     
   <c:choose>
   <c:when test="${followingcounter==0}">
   <li>following 0</li>
   </c:when>
   <c:when test="${followingcounter>0}">
 <li>  <a href="/user/followinguser?id=${user.id}">following ${followingcounter}</a></li>  
   </c:when>
   </c:choose>
 
  
		 <br/>
		 <c:choose>
		 <c:when test="${ALREADY==0}">
		
		 <a href="/user/following?id=${user.id}">following</a>
		 </c:when>
		 <c:when test="${ALREADY==1}">
		<a href="/user/unfollowed?id=${user.id}">unfollow</a>
		 </c:when>
		 <c:when test="${ALREADY==2}">
			<h3>modify</h3>
		 </c:when>
		 </c:choose>
		 </div>
        </div>
        
    </div>
    </div>
    

   <br />
   <br />
   <hr />
   <br />
   <div style="text-align: center;">
      <h3>
         <img src="/resources/glyphicons/glyphicons-49-star-empty.png"
            aria-hidden="true"> My Page <img
            src="/resources/glyphicons/glyphicons-49-star-empty.png"
            aria-hidden="true">

      </h3>

      <br /> <br /> <br /><br/><br/>


   </div>
    

	<c:choose>
	
	<c:when test="${empty USERITEM}">
	<h3>아직 사진이 없습니다!</h3>
	</c:when>
	<c:when test="${not empty USERITEM}">

	<c:forEach items="${USERITEM}" var="itemvo">
						<div class="col-lg-3 text-center">


							<div class="thumbnail">
								<a href="/item/readposting?clothcode=${itemvo.clothcode}"><img src="/resources/itemimg/${itemvo.imgname} " alt="No Image"></a>
									
								<div class="caption">
										<h3>${newitem.name}</h3>
								 <p>
										<a href="#" class="btn btn-primary" role="button">좋아요</a> <a
											href="#" class="btn btn-default" role="button">싫어요</a>
									</p>
								</div>

							</div>
						</div>
					</c:forEach>
					
					</c:when>
					</c:choose>
	
	
	<br/>
	<br/>
	<hr/>
	<br/>
    <button onclick="btn_delete();" id="bye">탈퇴</button>
	 
</body>
</html>