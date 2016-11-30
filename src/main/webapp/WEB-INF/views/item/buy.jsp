<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" >

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/item/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}



function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.address.value = roadFullAddr;
		
}

</script>
<body>
	<form name="form" id="form" method="post" action="/item/ordertaker">
	<h1>구매페이지</h1>

	    <table>
				<tr>			
					<th>image</th>
					<th>name</th>
				 
					<th>price</th>
					<th>color</th>
					<th>amount</th>
					<th>delivery charge</th>
					<th>mileage</th>
				</tr>
		
			 <c:forEach items="${shoppinglist}" var="itemVo">
			    <tr>
			    		<td><a href="/item/readposting?clothcode=${itemVo.clothcode}">	<img src="/resources/itemimg/${itemVo.imgname} " alt="No Image"></a></td>	  
			    	<td>${itemVo.id}</td>
				  	<td>${itemVo.name}</td>	  
				  	<td>${itemVo.price}</td>
				  	<td>${itemVo.color}</td>
				  	<td>${itemVo.amount}</td>
		    		<td>2500</td>	
		    		<td>${itemVo.price*0.1}</td>	
		     	 </tr>
		     	  
		  	</c:forEach>		
		</table>
	<br/><br/><br/>	<br/>
	


	<div id="list"></div>
	<div id="callBackDiv">
	
	<input type="checkbox" name="useraddress" value="useraddress" id="checkbox">
		<table border="1">
			<tr>
			<td>도로명주소 </td>
				<td>
					<input type="text"  style="width:500px;" id="address"  name="address" />
					<input type="button" onClick="goPopup();" value="주소검색"/>
				</td>
			</tr>
			<tr><td>받으시는 분 </td><td><input type="text"  style="width:500px;" id="name"  name="name" /></td></tr>
			<tr><td>이메일 </td><td>${login.email}</td></tr>
			<tr><td>전화번호</td><td><input type="text"  style="width:500px;" id="ph"  name="ph" /></td></tr>
					</table>
					
	</div>
		<br/><br/><br/><br/>
		
		<table border="1">
			<tr>
				<td>총 상품금액</td>
				<td>${ordertakerprice}</td>
			</tr>
			<tr>
				<td>총 배송비</td>
				<td>${ordertakerdeliverycharge}</td>
			</tr>
			<tr>
				<td>총 적립금</td>
				<td>${ordertakermileage}</td>
			</tr>
			<tr><td>결제수단</td>
			<td>
				<input TYPE='radio' id='howtopay' name='howtopay' value='적립금' checked/>
				<label for='적립금'>적립금</label>
				<input TYPE='radio' id='howtopay' name='howtopay' value='카드'/>
				<label for='카드'>카드</label>
				<input TYPE='radio' id='howtopay' name='howtopay' value='무통장입금'/>
				<label for='무통장입금'>무통장입금</label>
			</td>
			</tr>
		
		</table>	 
 	 
		
		<button type="submit" onclick="ordertakerpopup();">구매</button>
	 
	</form>	
	
	
	
</body>
</html>