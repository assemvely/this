<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/item/payment" method="post">

	<h2>주소 : ${login.address}<br/>
		받으시는 분 : ${ordertakername}<br/>
		총 상품금액 : ${ordertakerprice}<br/>
		총 배송비 : ${ordertakerdeliverycharge}	<br/>
		총 적립금 : ${ordertakermileage}<br/>
		결제수단 : ${ordertakerhowtopay}<br/>
	<br/><br/><br/>
	
		<button type="submit">확인</button>
	</form>
	
	</h2>
	

</body>
</html>