<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="/resources/jquery/jquery-1.12.4.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

$(document).ready( function(){


	getAllList();
	
	
	$("#replyAddBtn").on("click",function() {
		
		
		/* data["id"]=$("#id").val();
		data["reply"]=$("#reply").val();
		data["clothcode"]=$("#clothcode").val();
		data["boardcode"]=$("#boardcode").val();  */
		
		var id=$("#id").val();
		var reply=$("#reply").val();
		var bno=$("#bno").val();
		var boardcode=$("#boardcode").val();
	  
		
		//var data1=$("#comment").serialize();
		
		$.ajax({
			contentType:'application/json',
			type:'post',
			url:'/comment/b_insert',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			dataType:'text',
			data: JSON.stringify({
				id:id,
				reply:reply,
				bno:bno,
				boardcode:boardcode
			}),  
			
			
			success:function(result){
				
					
					alert("등록되었습니다.");
					 getAllList();
				
				
				
				}
			
		});
	});

		
	
	$(document).on('click', '.replyDelBtn', function() {
		////alert($(this).parent().parent()[0].nodeName);
		////alert( $(this).parent()[0].attr("id"));
		//alert( $(this).parent().attr("data-c_bno"));
		
		//var c_bno = $(this).parent().attr("data-c_bno");
		var c_bno=$(this).parent().parent().attr("data-c_bno");
		var id=$(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().attr("data-id");
		
		alert(id);
		
		
		//var c_bno=$(".replyLi").attr("data-c_bno");
		
		//type:'get',
		//data:JSON.stringify({c_bno:"test"}), //c_bno}),
		$.ajax({
			contentType:'application/json',
			type:'get',
			url:'/comment/c_delete',
			data:'c_bno='+$(this).parent().parent().attr('data-c_bno')+'&id='+$(this).parent().parent().attr('data-id'),
			
			
			
			success:function(result){
				
				if(result=="SUCCESS"){
				
				alert("삭제되었습니다. result : " + result);
				getAllList();
				}else{
					alert("접근불가합니다!");
				}
				
			}
		});
		
		
	});

	

	
	
	
	
	
	/* function allList(){
		
		
	 	var bno=$("#bno").val();
	 
	 

		$.ajax({

			contentType:'application/json',
			type:'get',
			url:'/comment/b_list',
			dataType:'json',
			data:JSON.stringify({
				bno:bno
			}),
			success:function(data){
					
				var str="";
				
				$(data).each(
						function(){
						  str+="<li data-rno='"+this.c_bno+"' class='replyLi'>"
							+this.c_bno+":" +this.id+this.reply+"<button id='replyDelBtn'>MOD</button></li>"+
							 
							
							str+="<li data-c_bno='"+this.c_bno+"'>" +this.c_bno+":" +this.reply+"</li>";
							$("#replies").html(str);
						});
			}
		});
		

	} */


	


 });
 
 





/* function getAllList(){
	
	 	var bno=$("#bno").val();
	 	var boardcode=$("#boardcode").val();
	 	
	
		$.getJSON("/comment/b_list/"+bno, function(data){
			var str="";
			//var str2="";
			
			
			$(data).each(
					function(){
						
						
						
						
						
						 str+=

								"<tr data-c_bno='"+this.c_bno+"'>"+
								
								
								
								
								"<td><div style='width: 100px; height: 100px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;'>"
								+"<img src='/resources/img/${b.imgname}' style='margin-left: -200px;' />"
								+"</div></td>"
								+
						
								
								"<td>"+this.id+"</td>"+
								"<td>"+this.reply+"</td>"+
								"<td>"+this.writedate+"</td>"+
								"<td><button class='replyDelBtn'>삭제</button></td></tr>"; 
								
					
								
								
							
						
						
						
						//alert("str : " + str);
					});
			
			$("#replies").html(str);
			//$("#replies").html(str2);
		});
	}   */
	
	

function getAllList(){ 
		
			$.ajax({
				url:'/comment/b_list/',
				type:'GET',
				data:'bno='+$('#bno').val()+'&boardcode='+$('#boardcode').val(),
				success:function(data){
		
			var str="";
			//var str2="";
			
			//alert("!!!");
			
			$(data).each(
				
					function(){
					
						
						 str+="<tr data-c_bno='"+this.c_bno+"'>"+
								"<td><div style='width: 100px; height: 100px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;'>"
								+"<img src='/resources/userimg/"+this.imgname+";' style='margin-left: -200px;' />"
								+"</div></td>"
								+"<td>"+"<a href='/user/mypage?id="+this.id+"'>"+this.id+"</a>"+"</td>"+
								"<td>"+this.reply+"</td>"+
								"<td>"+this.writedate+"</td>"+
								"<td><button class='replyDelBtn'>삭제</button></td></tr>"; 
					
							
						
						//alert("str : " + str);
					});
			
			$("#replies").html(str);
			//$("#replies").html(str2);
		}
			});
	}  


 
 

</script>
<body>

<table border="1" id="replies">

<!-- <li id="replies"></li> -->
    

</table>

<div id="divParent">
	
	<input type="hidden" id="bno" value="${clothcode}">
	<input type="hidden" id="id" value="${sessionScope.login.id}">
	<input type="hidden" id="boardcode" value="b">
<%-- 	<div>
	REPLYER ${sessionScope.login.id}
	</div>


	<div>
	REPLY TEXT<input type="text" name="reply" id="reply">
	</div>
	<button id="replyAddBtn">ADD REPLY</button> --%>
	
		<table border="1">


			<td>
				<div
					style="width: 100px; height: 100px; -webkit-border-radius: 50px; -moz-border-radius: 50px; border-radius: 50px; overflow: hidden; background: red;"
					title="Captain Slow">
					<img src="/resources/userimg/${sessionScope.login.imgname}" style="margin-left: -200px;" />
				</div>
			</td>
			<td>${sessionScope.login.id}</td>

			<td><textarea rows="5" cols="70" id="reply" name="reply" /></textarea> </pre></td>
			
			<td><button id="replyAddBtn">ADD REPLY</button></td>
			</table>

</div>
</body>
</html>