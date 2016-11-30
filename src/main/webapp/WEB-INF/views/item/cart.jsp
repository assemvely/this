<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
</head>
<body>
 



	<h1>장바구니</h1>
	
	<form action="/item/buy" name="form" id="form" method="post">
		
		<table>
				<tr>
					<th>check</th>
					<th>image</th>
					 
					<th>name</th>
					<th>price</th>
					
					<th>delivery charge</th>
					<th>mileage</th>
					<th>color</th>
					<th>amount</th>
				</tr>
			
			 <c:forEach items="${cart}" var="itemVo">
			    <tr>	
			    	<td><input type="checkbox" name='chk' id="chk" value="${itemVo.cartbno}"></td>
				  	<td><a href="/item/readposting?clothcode=${itemVo.clothcode}">	<img src="/resources/itemimg/${itemVo.imgname}" alt="이미지가 없습니다"></a></td>	  
				  
				  	<td>${itemVo.name}</td>
				  	<td>${itemVo.price}</td>
				  	 
		    		<td>2500</td>	
		    		<td>${itemVo.price*0.1}</td>	
		    		 <td>${itemVo.color}</td>
		    		 <td>${itemVo.amount}</td>
		     	 </tr>
		  	</c:forEach>		
		</table>
		<br/><br/><br/>	<br/>
	

		
		<button type="submit">체크된 항목 구매</button>	
				
	</form>

</body>
</html>