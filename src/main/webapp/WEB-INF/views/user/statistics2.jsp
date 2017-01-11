<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 
<head>
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
</head>
<body style="margin-left:400px;margin-right:400px;">
<%@ include file="css.jinc"%>
<br/>
<br/>
<br/>
<br/>
<br/>
   <c:choose>
      <c:when test="${login.bsm=='m'}">
         <h1>manager 통계</h1>
       
      <li>구매자 회원 수 : ${buyercounter}       <br/></li> 
      <li>판매자 회원 수 : ${sellercounter}      <br/></li>
              
      <li>브랜드 판매 순위                    <br/></li>
      
            <c:forEach items="${bestbrand}" var="cnt">
            <h3><a href="/user/mypage?id=${cnt.brandid}">brand ${cnt.brandid}</a></h3>
            <h5>${cnt.cnt}</h5>
            
            </c:forEach> 
      <li>베스트 상품</li>
            <c:forEach items="${bestItem}" var="top3">
            <a href="/item/readposting?clothcode=${top3.clothcode}">   <img src="/resources/itemimg/${top3.imgname} " alt="No Image"></a>
            <p>${top3.name}</p>
            </br>   
            </c:forEach>
      <li>주별 회원수</li>
      </c:when>



      <c:when test="${login.bsm=='s'}">

         <h1>seller 통계</h1>
         
         <li>총 구매자 회원 수 :${buyercounter}<br /></li>
         <li>이번 주 내 계정 구매자 수 : <br /></li>
         <c:forEach items="${weeklymybuyer}" var="buyer">
         
            <h3>${buyer.cnt}</h3>
            </c:forEach>
         <li>내 브랜드 순위 :         <br /></li> 
            
            <c:forEach items="${bestbrand}" var="cnt">
            
            <h3><a href="/user/mypage?id=${cnt.brandid}">brand ${cnt.brandid}</a></h3>
            <h5>${cnt.cnt}</h5>   
            </c:forEach>    <br />
            
            <li>아이템 판매 순위</li>
            <c:forEach items="${mybestitem}" var="mytop3">
            <a href="/item/readposting?clothcode=${mytop3.clothcode}">   <img src="/resources/itemimg/${mytop3.imgname} " alt="No Image"></a>
            <p>${mytop3.name}</p>
            </br>   
            </c:forEach>
                  <br />

         </h2>
      </c:when>

   </c:choose>

 

</body>
</html>