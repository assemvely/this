<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
#h2 {
   position: absolute;
   left: 145px;
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
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
   background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
   display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
   background-color: #3e8e41;
}

.nav-counter {
   position: absolute;
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
   -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px
      rgba(0, 0, 0, 0.12);
   box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px
      rgba(0, 0, 0, 0.12);
}
</style>
<head>
<title>My Shopping</title>

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
<script type="text/javascript">
   
</script>
</head>
<body
   style="margin-left: 400px; margin-right: 400px; align: center; margin-top: 200px;">

   <%@ include file="css.jinc"%>
   <br />
   <br />
   <h3>My Shopping</h3>
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
   border-width: 1px;
   overflow: hidden;
   word-break: normal;
   border-color: #ccc;
   color: #333;
   background-color: #fff;
}

.tg th {
   font-family: Arial, sans-serif;
   font-size: 14px;
   font-weight: normal;
   padding: 10px 5px;
   border-style: solid;
   border-width: 1px;
   overflow: hidden;
   word-break: normal;
   border-color: #ccc;
   color: #333;
   background-color: #f0f0f0;
}

.tg .tg-58iv {
   font-size: 18px;
   font-family: Arial, Helvetica, sans-serif !important;;
   text-align: center
}

.tg .tg-yw4l {
   vertical-align: top
}
</style>
   <table class="tg" width="800px" height="200px" text-align="center">
      <tr>
         <th text-align="center" class="tg-031e"><img src="/resources/userimg/${user.imgname}" alt="" /></th>
         <th class="tg-58iv">내 마일리지</th>
      </tr>
      <tr>
         <td class="tg-yw4l">${user.id}</td>
         <td class="tg-yw4l" text-align="center">${login.mileage}</td>
      </tr>
   </table>
   <!--  -->

   <br />
   <hr />
   <br />
   <br />
   <h3>구매내역 리스트</h3>
   <!--  -->

   <br />
   <hr />
   <br />
   <br />

   <div class="row">

      <c:forEach items="${myshopping}" var="shopping">
         <div class="col-lg-3 text-center">


            <div class="thumbnail">
               <img src="/resources/itemimg/${shopping.imgname} " alt="No Image">
               <div class="caption">
                  <h3>${shopping.name}</h3>
                  <p>${shopping.price}원</p>
                  
                  <p></p>
               </div>

            </div>
         </div>
      </c:forEach>

   </div>


</body>
</html>