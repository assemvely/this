<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h1>�̽��� ����� ���</h1>
		<table border="1">
		<tr>
		<th>id</th>
		<th>Ż��</th>
		<th>����</th>
		</tr>
	
		<c:forEach items= "${templist}" var="userVO" >
		<tr>
		<td><a href="/user/toreadtempuserinfo?id=${userVO.id}">${userVO.id}</a></td>
		<td><button onclick="location.href='/user/deletetempuser?id=${userVO.id}'">����</button>
		<td><button onclick="location.href='/user/approve?id=${userVO.id}'">����</button>
		</tr>
		</c:forEach>
		
		</table>

</body>
</html>