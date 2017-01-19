<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


</head>
<body>

	<h1>my codi list</h1>

	<h2>로그인한 사용자가 만든 코디를 뿌려줄 임시 페이지</h2>
	
		<span id="imgbox" style="border:1px solid #9f9f9f; width:500px; margin-top:10px; box-shadow:3px 3px 8px #3f3f3f;">
		
		
		<c:forEach items="${codilist}" var="codiimgvo">
			<h6>${codiimgvo.writedate}</h6>
			<%-- <img id="${codiimgvo.writedate}" src="/resources/${codiimgvo.codicapture}"
			 style="WIDTH:150px; HEIGHT:150px;" 
			  onclick="location.href='/codi/codimodify?writedate=${codiimgvo.writedate}'" 
			onclick="tomodifypage()"
			 hspace="5"/>	 --%>
			 
			<img id="${codiimgvo.writedate}" src="data:image/jpeg;base64,${codiimgvo.codicapture}"
			 style="WIDTH:150px; HEIGHT:150px;" 
			  onclick="location.href='/codi/codimodify?writedate=${codiimgvo.writedate}'" 
			onclick="tomodifypage()"
			 hspace="5"	/>
		
	
	
		</c:forEach>
	
		</span>

</body>
</html>