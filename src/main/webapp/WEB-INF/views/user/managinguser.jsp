<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

		<h1>회원 목록</h1>
		<table border="1">
		<tr>
		<th>id</th>
		<th>판매자/구매자</th>
		<th>email</th>
		</tr>
	
		<c:forEach items= "${userlist}" var="userVO" >
		<tr>
		<td> <img src="/resources/userimg/${userVO.imgname} " alt="이미지가 없습니다">
		<a href="/user/mypage?id=${userVO.id}">${userVO.id}</a></td>
		<td> {userVO.bsm}</td>
		<td>${userVO.email}</td>
		</tr>
		</c:forEach>
		
		</table>






</body>
</html>