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
 .card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: rigth;
    background-color: #fff;
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 200px;
    
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
    padding:0 5px;
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
    -webkit-border-radius:0 !important;
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

<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<!-- owl carousel깔기 -->
<link rel="stylesheet" href="/resources/owl.carousel/owl.carousel.css">
<!-- <link rel="stylesheet" href="owl.carousel/owl.theme.default.min.css"> -->
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>
<script src="/resources/owl.carousel/owl.carousel.min.js"></script>

</head>

<body>
 	 
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="/resources/image/8367cb771db775d39f09b8a5b547242a.jpg">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
           
           <c:choose>
           	<c:when test="${empty user.imgname}">
           	 	 <img src="/resources/userimg/null.jpg" alt=""/>
           	</c:when>
            <c:when test="${not empty user.imgname}">
           		 <img src="/resources/userimg/${user.imgname}" alt=""/>
           	</c:when>
           
           </c:choose> 

        </div>
        <div class="card-info"> <span class="card-title">${user.id}</span>
		 <div class="userinfo"> 
 
			<h4>판매자</h4>
		 
       
         	
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
		 <h3>ㅎㅎ</h3>
		 </c:when>
		 </c:choose>
		 </div>
        </div>
        
    </div>
    
    <br/>
    <br/>
    <br/>
    <form action="/user/mypage">
    	<fieldset data-role="controlgroup" data-type="horizontal">
  	<INPUT TYPE=RADIO NAME=categorycode VALUE=OUTER > OUTER
	<INPUT TYPE=RADIO NAME=categorycode VALUE=TOP> TOP
	<INPUT TYPE=RADIO NAME=categorycode VALUE=BOTTOM> BOTTOM
	<INPUT TYPE=RADIO NAME=categorycode VALUE=SKIRT> SKIRT
	<INPUT TYPE=RADIO NAME=categorycode VALUE=DRESS> DRESS
	<INPUT TYPE=RADIO NAME=categorycode VALUE=ACC>ACC
	<input type=hidden name=id value="${user.id}">
	</fieldset>
<input type=submit value=submit>
  </form>
	<hr/>
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
										<h3>${itemvo.name}</h3>
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
    <button onclick="btn_delete();" id="bye">탈퇴</button>
	 
</body>
</html>