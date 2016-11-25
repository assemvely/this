<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h1>follow</h1>
		<table border="1">
		<tr>
		<th>id</th>
		<th>following</th>
		</tr>
	
		<c:forEach items= "${userlist}" var="userVO" >
		 
		 <img src="/resources/userimg/${userVO.imgname} " alt="이미지가 없습니다">
		 <a href="/user/mypage?id=${userVO.id}">${userVO.id}</a>
		 <hr/>
		 
		</c:forEach>
		
		</table>
		
</body>
</html>