<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>내 마일리지 : ${login.mileage}</h3>
<h3>구매내역 리스트</h3>

  
 <c:forEach items="${myshopping}" var="shopping">
 <br/>
 <a href="/item/readposting?clothcode=${shopping.clothcode}">	<img src="/resources/itemimg/${shopping.imgname} " alt="No Image"></a>
   ${shopping.name } 
    ${shopping.price} 
    
    <br/>
 </c:forEach>
  
 
</body>
</html>