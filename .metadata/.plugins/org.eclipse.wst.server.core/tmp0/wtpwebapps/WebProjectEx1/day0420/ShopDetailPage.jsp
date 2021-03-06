<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Brush+Script&display=swap" rel="stylesheet">  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	div.detail{
		margin-top: 100px;
		margin-left: 200px;
		font-size: 25px;
		font-family: 'Jua';
	}
</style>
<script type="text/javascript">
	$(function() {
		init(); //처음 시작시 dto데이터 넣어주기
		
		//메인페이지로 가는 이벤트
		$("#btnmain").click(function() {
			history.back(); //이전 페이지로 이동
			//location.href="ShopJson.jsp"
			
		});
		
		$("#btndelete").click(function(){
			var ans = confirm("삭제하려면 [확인]버튼을 눌러주세요");
			if(ans){
				$.ajax({
					type: "get",
					dataType: "html",
					url: "delete.jsp",
					data: {"num":$("#num").val()},
					success:function(){
						alert("삭제되었습니다");
						//Shopjson.html로 이동 
						location.href="Shopjson.html";
					}
				});
			}
		}); 
		
		//수정 버튼
		$("#btnupdate").click(function(){
			$.ajax({
				type: "get",
				dataType: "json",
				url: "DetailJson.jsp",
				data: {"num":$("#num").val()},
				success:function(data){
					$("#usangpum").val(data.sangpum);
					$("#uprice").val(data.price);
					$("#ucnt").val(data.cnt);
					$("#uphoto").val(data.photo);
					$("#umyphoto").attr("src",data.photo);
					$("#ipgoday").val(data.ipgoday);
					$("#ucolor").val(data.color);
					//console.log(data);
				}
			});
	
			 $("#myModal").modal();
		});
			 
		$("#ubtnupdate").click(function(){
			 //전체 폼데이터 읽기
			var fdata = $("#ufrm").serialize(); //serialize는 num값으로 불러옴 
			//alert(fdata);
			$.ajax({
				type: "post",
				dataType: "html",
				url: "update.jsp",
				data: fdata,
				success: function(){
					location.reload(); //새로고침
				}
			});
		});	
	});
	
	function init() {
		$.ajax({
			type: "get",
			dataType: "json",
			url: "DetailJson.jsp",
			data: {"num":$("#num").val()},
			success:function(data){
				console.log(data);
				$("#photo").attr("src",data.photo);
			 	$("#photo").css("border","4px solid gray");
			 	$("#sangpum").text(data.sangpum);
			 	$("#price").text(data.price + "원");
			 	$("#color").text(data.color);
			 	$("#color").css({
			 		"background-color":data.color,
			 		"float":"right"
			 	});
			 	$("#cnt").text(data.cnt + "개");
			 	$("#ipgoday").text(data.ipgoday);		
			}
		});
	}
</script>
</head>
<%
	String num = request.getParameter("num");
%>

<body>
<input type="hidden" id="num" value="<%=num%>">
<div class="detail">
	<table class="table table-bordered" style="width: 600px;" >
	<caption><h1>상품 상세 페이지</h1></caption>
		<tr>
			<td width="300">
				<img src="" width="300" height="400" id="photo">
			</td>
			<td>
				<h2>상품명 : <span id="sangpum"></span></h2>
				<h2>색 상 : <div id="color"></div></h2>
				<h2>가 격 : <span id="price"></span></h2>
				<h2>수 량 : <span id="cnt"></span></h2>
				<h2>입고일 : <span id="ipgoday"></span></h2>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-success"
				style="width: 120px;" id="btnmain">메인</button>
				
				<button type="button" class="btn btn-info"
				style="width: 120px;" id="btnupdate" num=<%=num%>>수정</button>
				
				<button type="button" class="btn btn-danger"
				style="width: 120px;" id="btndelete" num=<%=num%>>삭제</button>
			</td>
		</tr>
	</table>
</div>

<!--수정 다이얼로그 Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상품 수정</h4>
        </div>
        <div class="modal-body">
         
          <!-- 수정폼 -->
          <form action="#" id="ufrm" class="form-inline">
          <input type="hidden" id="unum" value="<%=num%>" name="unum">
		<table class="table table-bodered" style="width: 400px;">
			<tr>
				<th bgcolor="pink" style="width: 100px;">상품명</th>
				<td>
					<input type="text" id="usangpum" name="usangpum"
						class="form-control">
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" style="width: 100px;">상품사진</th>
				<td>
					<select id="uphoto" name="uphoto" class="form-control" style="width: 120px;">
					<script type="text/javascript">
						var data = ["라운드티","블랙원피스","화이트원피스",
								"도트원피스","블랙조끼","꽃무늬원피스","프릴원피스",
								"반팔원피스","레이스원피스","블랙코트","체크쿠션"];
						var s = "";
						for(i=0; i<=10; i++) {
							s += "<option value='../image2/" + (i+1) + ".jpg'>" + data[i] + "</option>";
						}
						document.write(s);
					</script>
					</select>
					<img src="" id="umyphoto" width="60" height="60">
					<script>
						//변경시 이벤트
						$("#uphoto").change(function(){
							$("#umyphoto").attr("src",$(this).val());
						});
					</script>
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" style="width: 100px;">색상</th>
				<td>
					<input type="color" id="ucolor" name="ucolor"
						class="form-control" value="#fffccc"
						style="width: 80px;">
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" style="width: 100px;">단가</th>
				<td>
					<input type="text" id="uprice" name="uprice"
						class="form-control">
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" style="width: 100px;">수량</th>
				<td>
					<input type="number" id="ucnt" name="ucnt"
						class="form-control" min="1" max="5" value="1">
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" style="width: 100px;">입고일</th>
				<td>
					<input type="date" id="uipgoday" name="uipgoday"
						class="form-control" value="2022-04-20">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-info"
					style="width: 130px;" id="ubtnupdate"
					data-dissmiss="modal">DB수정</button>
				</td>
			</tr>
		</table>
	</form>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>








