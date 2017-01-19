
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	 	 
	<meta http-equiv="X-UA-Compatible" content="Edge">
	
	<title>codi page</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	
<script type="text/javascript">
		

		//클릭된 a태그의 id값, 
		$(document).on('click', 'a', function () {
			
			var thispage = this.id;
			
			if(thispage==("«"))
				{
					thispage="prev";
				}
			else if(thispage==("»"))
				{
					thispage="next";
				}
			else
				{
					thispage = this.id;
				}
			
		//	alert(thispage);
			
						
			var selected = $("#selectlittlecategory").val();
			var selectedUppercase = selected.toUpperCase();
			
			var param = {"selected_category" : selectedUppercase, "thispage" : thispage}
			
			$.ajax({      
		        type:"POST",
		        url:"/item/selected_item_page",    
		        data:param,      
		        success:function(data)
		        {

					data=data.replace(/\\/g,''); 
					
					var jsondata = JSON.parse(data);

					
					$('#imgbox').empty();
					

					for(i=0; i<jsondata[1].length; i++)
						{
							var item = (jsondata[1])[i];
							
							var clothcode = item.clothcode;
		        			var imgname = item.imgname;
		        			
		        			$('#imgbox').append('<img id='+clothcode+' src="/resources/itemimg/'
		        					+imgname+'" style="WIDTH:100PX; HEIGHT:100PX;" draggable="true" ondragstart="drag(event)" hspace="5" />');

			        			
						}
					
					var totalcount = jsondata[0].totalCount;
					var startpage = jsondata[0].startPage;
					var endpage = jsondata[0].endPage;
					var prev = jsondata[0].prev;
					var next = jsondata[0].next;
					var displaypagenum = jsondata[0].displayPageNum;
					var page = jsondata[0].cri.page;
					var perpagenum = jsondata[0].cri.perPageNum;
					
					$('#pagination').empty();
					
					if(prev==true)
						{					
						
							$('#pagination').append('<li><a id="&laquo;" name="&laquo;" >&laquo;</a>');
						
							for(var j=startpage; j<=endpage; j++)
							{
								$('#pagination').append('<li class="active"><a id="'+j+'" name="'+j+'">'+j+'</a></li/>');					
							}
							if(next==true)
							{
								$('#pagination').append('<li><a id="&raquo;" name="&raquo;">&raquo;</a></li>');		
							}

							
							
						}
					else
						{
							for(var j=startpage; j<=endpage; j++)
								{
									$('#pagination').append('<li value='+j+'class="active">'
									+'<a id="'+j+'" name="'+j+'">'+j+'</a></li>');					
								}
							if(next==true)
								{
									$('#pagination').append('<li><a id="&raquo;" name="&raquo;">&raquo;</a></li>');		
								}
						}
		        },
		        error:function(jqXHR, textStatus, errorThrown)
		        {				        	
		            alert("error~~ \n" + textStatus + " : " + errorThrown);
		            self.close();				            
		        }
		    }); 
		    
			
			
			
			
		});

		
</script>
	<script type="text/javascript">

		var canvas;
		var ctx;
		var BB;
		var offsetX;
		var offsetY;
		var WIDTH;
		var HEIGHT;

		// drag related variables
		var bStatusDrag;	// drag 상태인지 (boolean)
		var bStatusMagnify;	// 확대축소 상태인지 (boolean)
		var startX;
		var startY;

		// an array of objects that define different rectangles
		var rects = [];
		
		//var img1;
		//var img2;
		var imgs = [];
		
		var list = new Array();

		$(document).ready(function() {
			// get canvas related references
			canvas = document.getElementById("canvas");
			ctx = canvas.getContext("2d");
	//		ctx.globalCompositeOperation = "destination-over";
			
			
			
/* 			context = canvas.getContext("2d");

			// set to draw behind current content
			context.globalCompositeOperation = "destination-over";

			// set background color
			context.fillStyle = '#fff'; // <- background color

			// draw background / rect on entire canvas
			context.fillRect(0, 0, canvas.width, canvas.height); */
			
			BB = canvas.getBoundingClientRect();
			offsetX = BB.left;
			offsetY = BB.top;
			WIDTH = canvas.width;
			HEIGHT = canvas.height;

			// drag related variables
			bStatusDrag = false;
			startX;
			startY;
			
			canvas.onmousedown = myDown;
			canvas.onmouseup = myUp;
			canvas.onmousemove = myMove;
			
			ctx.globalCompositeOperation = "destination-over";
			ctx.fillStyle = '#FFFFFF';
			ctx.fillRect(0, 0, WIDTH, HEIGHT);			
			
			draw();
		

		})
		
		// clear the canvas
		function clear() {
			ctx.clearRect(0, 0, WIDTH, HEIGHT);
		}

		
		//삭제
		function delete_last_img()
		{
			
			clear();
					
		//rects배열을 한번 훑어보기.
			for(var nOrder=0; nOrder<=rects.length-1; nOrder++) 
			{
				
				for(var i = 0; i < rects.length; i++) 
				{ 
					//order==가 nOrder인 것이 
					
					if(rects[nOrder].order == nOrder) 
					{		
						console.log(rects[i].clothcode);
						console.log(rects[i].order);
				//		var r = rects[i];									
						changeOrderToTop(i);
						nOrder=rects.length;	
						rects.splice(rects.length-1, 1);
						break;
							
					}
					
				}
			}  
		
			
			draw();
		}
			

		
		
		// redraw the scene
		function draw() {
			ctx.clearRect(0, 0, WIDTH, HEIGHT);
			//rects.length가 아마도 객체의 길이.
			for(var nOrderToDraw=rects.length-1; nOrderToDraw>=0; nOrderToDraw--) 
			{
				for(var j=0;j<rects.length;j++) {
					if( rects[j].order == nOrderToDraw ) {
						if(nOrderToDraw==0) {
							var rm=rects[j].ratioMagnify;
						
							//첫번째 보조선 그리기.
							ctx.beginPath();
							
							ctx.moveTo(rects[j].x+(rects[j].width/2)*rm, rects[j].y+(rects[j].height/2)*rm );
							//ctx.lineTo(rects[j].x+(rects[j].width/2)*rm, rects[j].y+(rects[j].height+50)*rm );
							
							ctx.moveTo(rects[j].x+(rects[j].width/4)*rm, rects[j].y+(rects[j].height+25)*rm );
							//ctx.lineTo(rects[j].x+(rects[j].width*3/4)*rm, rects[j].y+(rects[j].height+25)*rm );
						
							//ctx.strokeStyle = '#FFFFFF';
							//ctx.stroke();
							
																				
							//두번째 보조선 그리기.
							ctx.beginPath();
							ctx.arc(rects[j].x+(rects[j].width/2)*rm, rects[j].y+(rects[j].height+25)*rm, 6, 0, 4 * Math.PI, false);						
							ctx.lineWidth = 2;
							ctx.strokeStyle = '#ff7f7f';
							ctx.stroke();
							
						}
						
						ctx.save();	//회전시키기 전 저장?
						
						var cx = rects[j].dx - rects[j].width/2;
						var cy = rects[j].dy - rects[j].height/2;

						var radian;
						ctx.translate(rects[j].x+rects[j].width/2, rects[j].y+rects[j].height/2);
						if(cx>=0 && cy>=0) radian = Math.atan( cx / cy * (-1));
						else if(cx<0 && cy>=0) radian = Math.atan( cx / cy ) * (-1);
						else if(cx>=0 && cy<0) radian = Math.atan(  cy / cx ) + Math.PI *1.5;
						else if(cx<0 && cy<0) radian = Math.atan(  cy / cx ) + Math.PI *0.5;
						
						ctx.rotate(radian);
						ctx.translate((rects[j].x+rects[j].width/2)*(-1), (rects[j].y+rects[j].height/2)*(-1));

						//이 부분 저장할 것!!!			각 이미지의 좌표로 저장하고 싶다면..
						ctx.drawImage(imgs[j], rects[j].x, rects[j].y, rects[j].width*rects[j].ratioMagnify, rects[j].height*rects[j].ratioMagnify);
						ctx.restore();
						list.push(rects);
						
						//j=>배열에서 몇번째에 해당하는 지.
						//rects[j].clothcode 객체의 clothcode
						//rects[j].x 객체의 x 좌표
						//rects[j].y 객체의 y 좌표
						//rects[j].width*rects[j].ratioMagnify 객체의 넓이.
						//rects[j].height*rects[j].ratioMagnify 객체의 높이.
						
												
						//ctx.drawImage(imgs[j], rects[j].x, rects[j].y, rects[j].width*rects[j].ratioMagnify, rects[j].height*rects[j].ratioMagnify);
						//alert("["+j+"] "+ imgs[j]);
						
						
					}

				}
			}
		}
		
//*********************************이미지 좌표로 저장하는 부분! 캡쳐된 이미지로 저장할 것이므로 팰요없음!		
/* 		$(document).ready(function(){
			
			$("#savebtn").click(function(){ 

			    var codilist = new Array();
			    var codicomment =  $("#codi_comment").val();
	
				for(var n=0; n<rects.length; n++)
					{
						var codiinfo = new Object();
					
						codiinfo.clothcode = rects[n].clothcode;
						codiinfo.x = rects[n].x;
						codiinfo.y = rects[n].y;
						codiinfo.width = rects[n].width;
						codiinfo.height = rects[n].height;
						codiinfo.arrayindex = n;
					
						codilist.push(codiinfo);
					
					}
			          
			          var jsonInfo = JSON.stringify(codilist);			
			         
			          
			          var param = {"data" : jsonInfo, "comment" : codicomment};
	
			
						$.ajax({      
					        type:"POST",
					        url:"/codi/savecodi",    
					        data:param,      
					        success:function(data)
					        {
					            alert("codi saved!");
					            self.close();
					            location.href="/item/main";
					            
					        },
					        error:function(jqXHR, textStatus, errorThrown)
					        {				        	
					            alert("error~~ \n" + textStatus + " : " + errorThrown);
					            self.close();				            
					        }
					    });  	
			     	  				
				})
			
		}); */
				
		


// 백업redraw the scene
		function BACKUP_draw() 
		{
			ctx.clearRect(0, 0, WIDTH, HEIGHT);
			
			for(var nOrderToDraw=rects.length-1; nOrderToDraw>=0; nOrderToDraw--) 
			{
				for(var j=0;j<rects.length;j++) 
				{
					if( rects[j].order == nOrderToDraw ) 
					{
						if(nOrderToDraw==0) 
						{
							ctx.beginPath();
							ctx.moveTo(rects[j].x+rects[j].width/2, rects[j].y+rects[j].height/2 );
						//	ctx.lineTo(rects[j].x+rects[j].width/2, rects[j].y+rects[j].height+50);
							ctx.moveTo(rects[j].x+rects[j].width/4, rects[j].y+rects[j].height+25);
						//	ctx.lineTo(rects[j].x+rects[j].width*3/4, rects[j].y+rects[j].height+25);
						//	ctx.strokeStyle = '#000';
						//	ctx.stroke();
							
							ctx.beginPath();
							
							ctx.arc(rects[j].x+rects[j].width/2, rects[j].y+rects[j].height+25, 3, 0, 2 * Math.PI, false);
							ctx.lineWidth = 2;
							ctx.strokeStyle = '#ff7f7f';
							ctx.stroke();
							
						}
						
						ctx.drawImage(imgs[j], rects[j].x, rects[j].y, rects[j].width, rects[j].height);
							


						//alert("["+j+"] "+ imgs[j]);
					}
				}
			}
		}


		// handle mousedown events
		function myDown(e) {

			// tell the browser we're handling this mouse event
			e.preventDefault();
			e.stopPropagation();

			// get the current mouse position
			var mx = parseInt(e.clientX - offsetX);
			var my = parseInt(e.clientY - offsetY);

		
			//1.마우스가 이미지 안에 있는지, 2. 마우스가 확대점 안에 있는지.
			bStatusDrag = false;
			
			for(var nOrder=0; nOrder<=rects.length-1; nOrder++) 
			{
				
				for(var i = 0; i < rects.length; i++) 
				{ 
					if(rects[i].order == nOrder) 
					{		
						var r = rects[i];
						var rm = rects[i].ratioMagnify;
						
						// 마우스가 확대점을 잡았는지.
 						if (Math.abs(mx-(rects[i].x+(rects[i].width/2)*rm))<20*rm && Math.abs(my-(rects[i].y+(rects[i].height+25)*rm))<20*rm) 
						{
						//	console.log("grabbed the point 'magnify'.");
							rects[i].isMagnifying = true; // 해당 그림이 확대 or 축소 인 상태!
							changeOrderToTop(i);		//order 바꿔주기				
							bStatusMagnify = true; // 해당 그림이 확대 or 축소 인 상태!
						} 
						
 						if (mx > r.x && mx < r.x + r.width*rm && my > r.y && my < r.y + r.height*rm) 
						{
							
							// if yes, set that rects isDragging=true
							bStatusDrag = true;
							r.isDragging = true;
							
							changeOrderToTop(i);
							
							i=1000;  // 1000 means the infinite.
							nOrder=rects.length;	
							break;
							
						} 
					}
				}
			}
			// save the current mouse position
			startX = mx;
			startY = my;
			
			draw();
		}

		function plusOneAllRects() {
			for(var i=0; i<=rects.length-1; i++) 
				rects[i].order ++;
		}
		
		// indexToTop : 0부터.
		// nTop : 0부터.
		// rects[i].order : 인덱스 및 값 1->0부터.
		// arrOrderIndex[i] : 인덱스 및 값 1->0부터.
		function changeOrderToTop(indexToTop) //i가 들어옴
		{
			var nTop;	// 현재 top(order값=0)인 index번호.
			
			for(var i=0; i<=rects.length-1; i++) 
			{
				if(rects[i].order==0) nTop = i;	
			}
			
			if(indexToTop == nTop) return ;
		//	console.log("indexToTop : " + indexToTop);
			
			var arrOrderIndex = new Array();	// [0]부터 사용. 
			
			for(var i=0; i<=rects.length-1; i++) {
				arrOrderIndex[ rects[i].order ] = i;
			}
			
			var nCurrent;	// arrOrderIndex[]의 값으로 indexToTop 을 들고 있는 게 누구인지.
			for(var i=0; i<=rects.length-1; i++) {
				if(arrOrderIndex[i] == indexToTop) nCurrent = i;
			}
			for(var i=nCurrent; i>=1; i--) {
				arrOrderIndex[i] = arrOrderIndex[i-1];
			}
			arrOrderIndex[0] = indexToTop;
			
			for(var i=0; i<=rects.length-1; i++) 
			{
				for(var j=0; j<=rects.length-1; j++) 
				{
					if( arrOrderIndex[j]==i )  
					{
						rects[i].order = j;
					}
				}
			}
			
			//console.log("arrOrderInde : " + arrOrderIndex);
			var strResult = "";
			for(var i=0; i<=rects.length-1; i++) 
			{
				strResult += rects[i].order + " / ";
			}
			//console.log("rects[].order : " + strResult);
			
		}
		
		
		// handle mouseup events
		function myUp(e) {  
			// tell the browser we're handling this mouse event
			e.preventDefault();
			e.stopPropagation();

			// clear all the dragging flags
			bStatusDrag = false;
			for (var i = 0; i < rects.length; i++) {
				rects[i].isDragging = false;
			}
			// clear the maginfy flag
			bStatusMagnify = false;
			for (var i = 0; i < rects.length; i++) {
				rects[i].isMagnifying = false;
				
			}
			
		}

		// handle mouse moves
		function myMove(e) 
		{
			// 만약에 무언가 확대/축소 중이라면
			if(bStatusMagnify) 
			{

				// tell the browser we're handling this mouse event
				e.preventDefault();
				e.stopPropagation();

				// get the current mouse position
				var mx = parseInt(e.clientX - offsetX);
				var my = parseInt(e.clientY - offsetY);

				for(var i=0; i<rects.length; i++) 
				{
					if(rects[i].isMagnifying) 
					{
					//		console.log("IN");
						var x1 = rects[i].x;
						var y1 = rects[i].y;
						rects[i].dx = mx-x1;
						rects[i].dy = my-y1;
						rects[i].ratioMagnify = Math.sqrt( Math.pow((x1+rects[i].width/2)-(x1+rects[i].dx), 2)+Math.pow((y1+rects[i].height/2)-(y1+rects[i].dy), 2) ) / rects[i].distanceInitial;
						rects[i].ratioMagnify = Math.sqrt( rects[i].ratioMagnify );
					}
				}	
				draw();

			}
			else if (bStatusDrag) {

				// tell the browser we're handling this mouse event
				e.preventDefault();
				e.stopPropagation();

				// get the current mouse position
				var mx = parseInt(e.clientX - offsetX);
				var my = parseInt(e.clientY - offsetY);

				// calculate the distance the mouse has moved
				// since the last mousemove
				var dx = mx - startX;
				var dy = my - startY;

				// move each rect that isDragging 
				// by the distance the mouse has moved
				// since the last mousemove
				for (var i = 0; i < rects.length; i++) 
				{
					var r = rects[i];
					if (r.isDragging) 
					{
						r.x += dx;
						r.y += dy;
					}
				}

				// redraw the scene with the new rect positions
				draw();

				// reset the starting mouse position for the next mousemove
				startX = mx;
				startY = my;

			}

		}
	</script>
	<script>
	//여기서 부턴 drag & drop
		function allowDrop(ev) {
			console.log("allowDrop.");
			ev.preventDefault();
		}

		function drag(ev) {
			console.log("drag.");
			ev.dataTransfer.setData("dragID", ev.target.id);
		}

		function drop(ev) {
			var mx = parseInt(ev.clientX - offsetX);
			var my = parseInt(ev.clientY - offsetY);

			console.log("drop.");
			ev.preventDefault();
			var dataID = ev.dataTransfer.getData("dragID");
			
			//ev.target.appendChild(document.getElementById(dataID));
			plusOneAllRects();
			imgs.push( document.getElementById(dataID));
			
 			var x1 = mx - parseInt($("#"+dataID).css("width"))/2;
			var y1 = my - parseInt($("#"+dataID).css("height"))/2;
			var x2 = x1 + parseInt($("#"+dataID).css("width"))/2;
			var y2 = y1 + parseInt($("#"+dataID).css("height")+25); 
			
			rects.push({
				x: mx - parseInt($("#"+dataID).css("width"))/2,
				y: my - parseInt($("#"+dataID).css("height"))/2,
				width: parseInt($("#"+dataID).css("width")),
				height: parseInt($("#"+dataID).css("height")),
				clothcode:dataID,
				order:0,
				isDragging: false,
				ratioMagnify:3.000000001,
				isManifying: false,
				distanceInitial:Math.sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) )
			});
			
					
			draw();
		}
				
	</script>

<script>




	function onChangeSelect() 
	{
		//카테고리 골랐을 때!! 비동기적으로 옷 이미지를 가져와 뿌려준다.
		var selected = $("#selectlittlecategory").val();

			if (selected != "0") 
			{
				var selectedUppercase = selected.toUpperCase();
		
				var selectedcategory_arr = new Array();
				
				var selectedcategory_data = new Object();
				
				selectedcategory_data.data = selectedUppercase;
				
				selectedcategory_arr.push(selectedcategory_data.data);
			
				var param = {"data" : selectedUppercase};
					
				
				$.ajax({      
			        type:"POST",
			        url:"/item/select_little_category",    
			     //  	url:"/item/",
			      	data:param,      
			        success:function(data)
			        {
			  //      	alert(data);

						data=data.replace(/\\/g,''); 
						
						var jsondata = JSON.parse(data);
						

						$('#imgbox').empty();

						for(i=0; i<jsondata[1].length; i++)
							{
								var item = (jsondata[1])[i];
								
								var clothcode = item.clothcode;
			        			var imgname = item.imgname;
			        			
			        			$('#imgbox').append('<img id='+clothcode+' src="/resources/itemimg/'
			        					+imgname+'" style="WIDTH:100PX; HEIGHT:100PX;" draggable="true" ondragstart="drag(event)" hspace="5" />');

				        			
							}
						
						var totalcount = jsondata[0].totalCount;
						var startpage = jsondata[0].startPage;
						var endpage = jsondata[0].endPage;
						var prev = jsondata[0].prev;
						var next = jsondata[0].next;
						var displaypagenum = jsondata[0].displayPageNum;
						var page = jsondata[0].cri.page;
						var perpagenum = jsondata[0].cri.perPageNum;
						
						$('.pagination').empty();
						
						if(prev==true)
							{
								$('.pagination').append('<li><a id="&laquo;" name="&laquo;" >&laquo;</a></li>');
							
								for(var j=startpage; j<=endpage; j++)
								{
									$('.pagination').append('<li value='+j+'class=active>'
									+'<a id="'+j+'" name="'+j+'">'+j+'</a></li>');					
								}
								if(next==true)
								{
									$('.pagination').append('<li><a id="&raquo;" name="&raquo;">&raquo;</a></li>');		
								}

							}
						else
							{
								for(var j=startpage; j<=endpage; j++)
									{
										$('.pagination').append('<li value='+j+'class=active>'
										+'<a id="'+j+'" name="'+j+'">'+j+'</a></li>');					
									}
								if(next==true)
									{
										$('.pagination').append('<li><a id="&raquo;" name="&raquo;">&raquo;</a></li>');		
									}
							}
			            
			        },
			        error:function(jqXHR, textStatus, errorThrown)
			        {				        	
			            alert("error~~ \n" + textStatus + " : " + errorThrown);
			            self.close();				            
			        }
			    });  
				
				
			}
			else
				{
					var selectedUppercase = selected.toUpperCase();
					
					document.getElementById("Form1").submit();
					form.Form3.submit();
				
				}

	}
</script>


<script type="text/javascript">

	//*****************************************이미지 캡쳐해서 저장하는 부분
	//*****************************************해당 이미지의 left-top 좌표도 저장할 것
	function save_codi_as_imgfile()
	{
		
		ctx.globalCompositeOperation = "destination-over";
		ctx.fillStyle = '#FFFFFF';
		ctx.fillRect(0, 0, WIDTH, HEIGHT);						
		
		
		 var codilist = new Array();
		   
		 for(var n=0; n<rects.length; n++)
			{
				var codiinfo = new Object();
			
				codiinfo.ratiomagnify = rects[n].ratioMagnify;	
				codiinfo.clothcode = rects[n].clothcode;
				codiinfo.x = rects[n].x;
				codiinfo.y = rects[n].y;
				codiinfo.width = rects[n].width;
				codiinfo.height = rects[n].height;
				codiinfo.arrayindex = n;
			
				codilist.push(codiinfo);
			
			}
		 
		 var codilistjsoninfo = JSON.stringify(codilist);			
		
		
		var codiimglist = new Array();
		var codicomment =  $("#codi_comment").val();
		
		
		var codiimg = new Object();
		
		codiimg = canvas.toDataURL('image/jpeg');
		codiimglist.push(codiimg);
	
		var jsonInfo2 = JSON.stringify(codiimglist);	
      
		//canvas에 찍인 이미지를 text형태로 변환 => imagedata 
		var imagedata = canvas.toDataURL('image/jpeg');
				
		var parameter = {"data" : jsonInfo2, "comment" : codicomment, "codijsonarray" : codilistjsoninfo};

		$.ajax({      
	        type:"POST",
	        url:"/codi/slip",    
	        data:parameter,      
	        success:function(data)
	        {
	            alert("codi saved!");
	            self.close();
	            location.href="/item/main";
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown)
	        {				        	
	            alert("error~~ \n" + textStatus + " : " + errorThrown);
	            self.close();				            
	        }
	    });  	
		

	}

</script>


	<style>
		#canvas 
		{
			border: 1px solid black;
			display: inline;

		}

		input[type=text] 
		{
			width: 400px;
			height: 200px
		}
		
		#Form1
		{
			position : absolute;
			top : 20px;
			left : 760px;
			display:inline;
			margin : 0 auto;
		}
		
		#box
		{
			position : absolute;
			top : 50px;
			left : 760px;
			display : inline;
			text-align : center;
			padding-top : 20px;
			
		}
		
		#delete
		{
			position : absolute;
			
			left : 860px;
			display : inline;
			text-align : center;

			
		}

</style>
	
</head>

<body>
	<span>
	<canvas id="canvas" width=700 height=700 style="box-shadow:3px 3px 8px #3f0000;" ondrop="drop(event)" ondragover="allowDrop(event)"></canvas>	 
	</span>
	<span>
	<form name="Form1" id="Form1" action="/item/select_codi_category" method="GET">
	
		<span class="dropdown">
			<select id="selectlittlecategory" name="outer"
				onchange="onChangeSelect()">
				<option name="outer" value="all"
					<%if ("ALL".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>All</option>
				<option name="outer" value="coat"
					<%if ("COAT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Coat</option>
				<option name="outer" value="jacket"
					<%if ("JACKET".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Jacket</option>
				<option name="outer" value="cardigan"
					<%if ("CARDIGAN".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Cardigan</option>
				
				<option name="outer" value="knit"
					<%if ("KNIT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Knit</option>
				<option name="outer" value="shirt"
					<%if ("SHIRT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Shirt</option>
				<option name="outer" value="tshirt"
					<%if ("TSHIRT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Tshirt</option>	
					
				<option name="outer" value="pants"
					<%if ("PANTS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Pants</option>
				
				<option name="outer" value="shorts"
					<%if ("SHORTS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Shorts</option>
				
				<option name="outer" value="skirt"
					<%if ("SKIRT".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Skirt</option>	
				
				<option name="outer" value="dress"
					<%if ("DRESS".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Dress</option>	
					
				<option name="outer" value="bag"
					<%if ("BAG".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Bag</option>
				
				<option name="outer" value="jewelry"
					<%if ("JEWELRY".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Jewelry</option>
				
				<option name="outer" value="shoes"
					<%if ("SHOES".equals(request.getAttribute("SELECTLITTLECATEGORY"))) {%>
					SELECTED="SELECTED" <%}%>>Shoes</option>	
				
			</select>

		</span>

		<!-- 정렬하는 부분 끝 !-->
	</form>
	</span>

 
 	<img id="delete" src="/resources/weather/delete.png" style="WIDTH:50px; HEIGHT:50px;" onClick="delete_last_img()"/>

	<span id="box" style="border:1px solid #9f9f9f; width:500px; margin-top:10px; box-shadow:3px 3px 8px #3f3f3f;">
	<span id="imgbox" >
		
		<c:forEach items="${SELECTCATEGORY}" var="itemvo">
			<img id="${itemvo.clothcode}"   src="/resources/itemimg/${itemvo.imgname}"
			 draggable="true" ondragstart="drag(event)" width="300"
			 hspace="5"
			  />	
		</c:forEach>
	</span>	
		<br>
		
	<div class="text-center" id="text-center">
		<ul class="pagination" id="pagination">
			<c:if test="${pagemaker.prev}">
				<li><a id="&laquo;" name="&laquo;" >&laquo;</a>
					<%--  href="codipage${pagemaker.makeQuery(pagemaker.startPage-1)}" 
				 onClick="changepage()" --%>
				
			</c:if>

			<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="idx">
				<li	<c:out value="${pagemaker.cri.page==idx? 'class=active' : ''}"/>>
					<a id="${idx}" name="${idx}" 				<%--  href="codipage${pagemaker.makeQuery(idx)}"  					
					 onClick="changepage()">--%>
					 >  ${idx} </a>
				</li>		
			</c:forEach>
		
	
		<c:if test="${pagemaker.next&&pagemaker.endPage>0}">
			<li>
				<a id="&raquo;" name="&raquo;" 
				<%--  href="codipage?page=${pagemaker.endPage+1}" onClick="changepage()" --%>
				  >&raquo;</a>
			</li>
		</c:if> 
		
		</ul>
	
	</div>
	

	</span>	


	<br>
	<p id="comment">
	Codi Comment: <input type="text" name="codi_comment" id="codi_comment" size="50" height="200px"/><br>
	</p>
<!--  	<button id="savebtn" > Codi Save </button>   -->
	<button onclick="location.href='/codi/mycodipage'"> to my codi list </button> 
	<button onclick = "save_codi_as_imgfile()"> save codi as image file </button>
	
</body>
</html>