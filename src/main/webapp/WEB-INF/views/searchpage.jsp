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

	<h1>회원 목록</h1>
	<h2>
	<c:forEach items="${searchuserlist}" var="userVo">
  	<p>
	<a href="/user/mypage?id=${userVo.id}"> <img src="/resources/userimg/${userVo.imgname} " alt="이미지가 없습니다"></a>
	<h3>${userVo.id}</h3>
	</p>
  	<hr/>
 	 </c:forEach>
	

	</h2>
	<br/><br/><br/><br/><br/><hr/><br/><br/><br/>
	
	<h1>아이템 목록</h1>
	<h2>
	<c:forEach items="${searchitemlist}" var="itemVo">
	<p>
  	<a href="/item/readposting?clothcode=${itemVo.clothcode}"><img src="/resources/itemimg/${itemVo.imgname} " alt="No Image"></a>
  	<h3>${itemVo.name}</h3> 
  	</p>
  	<hr/>
 	 </c:forEach>
	
	
	</h2>





</body>
</html>