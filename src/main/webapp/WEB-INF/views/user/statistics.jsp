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
	<c:choose>
		<c:when test="${login.bsm=='m'}">
			<h1>manager ���</h1>
			<h2>
				������ ȸ�� �� : ${buyercounter} 		<br/> 
				�Ǹ��� ȸ�� �� : ${sellercounter}		<br/>
				�̹� �� sellingcnt : 					<br/> 
				�귣�� �Ǹ� ���� : 						<br/> 
				�� �Խñ� �� :							 <br/>


			</h2>
		</c:when>



		<c:when test="${login.bsm=='s'}">

			<h1>seller ���</h1>
			<h2>
				�� ������ ȸ�� �� : 		<br />
				�̹� �� �� ���� ������ �� : <br />
				�� �귣�� ���� :			<br /> 
				������ �Ǹ� ���� : 		<br />
				�� �Խñ� �� : 			<br />

			</h2>
		</c:when>

	</c:choose>







</body>
</html>