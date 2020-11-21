<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/temp.css">
<link rel="stylesheet" href="./css/sidebar.css">
<style>
#title {
	text-align: center;
	border-bottom: 2px solid #94CCC4;
	padding-bottom: 20px;
}

#main {
	color: #5d5d5d;
}

.mtitle {
	margin-top: 50px;
	border-left: 5px solid #94CCC4;
	padding-left: 10px;
}

.mmain table {
	margin-top: 40px;
	margin-bottom: 40px;
  border-collapse: collapse;
  width: 100%;
  border-top: solid 2px #CBE2B8;
}

.mmain th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  padding-top: 20px;
  padding-bottom: 20px;
}

.mmain th {
	width: 15%
}

#mbot {
	float: right;
}

.btnBot {
	margin-left: 10px;
	height: 30px;
	background-color: #94CCC4;
	
	  border: none;
	  color: white;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  width: 70px;
}

.btnBot:hover {
  background-color: white;
  color: #94CCC4;
}

#mimg {
	padding-top: 50px;
	padding-bottom: 30px;
	text-align: center;
}

#mimg p {
	text-align: center;
	font-size: 30px;
	font-family: 맑은 고딕;
}
</style>
</head>
<body>

<!-- Header Start -->
     <jsp:include page="/header.jsp"></jsp:include>
<!-- 	Header End -->

   
   <div class="row">
   
     	<div class="column side" id="column_side_left">
     	    <!-- sidebar -->
  	<div>
  		<ul class="side_ul">
  		<h1 style="font-size: 23px;" class="leftTop">예약/조회/발급</h1>		<!-- 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="">진료예약</a></li>			<!-- 서브 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="">예약안내</a></li>
		  <li class="side_li"><a href="">온라인예약</a></li>
		  <li class="side_li"><a href="">예약조회/취소</a></li>
		  <li class="side_li"><a href="">진료과별 상담</a></li>
		</ul>
  	</div>
  	
  	<!-- //sidebar -->
     	</div>
     	<!-- 메인부분 -->
  		<div class="column middle">
			<div id="title">
				<h1>예약완료 및 확인</h1>
			</div>
			
			
			
			<div id="main">
				<div id="mimg">
					<img alt="" src="./image/select.jpg" width="100" height="100">
					<p>인터넷 진료예약 접수가 완료되었습니다.</p>
				</div>
				<div class="mtitle">
					<h2>회원정보 및 예약 정보</h2>
				</div>
				<form action="/reserconfirm">
				<div class="mmain">
					<table>
						<tr>
							<th>이름</th>
							<td>${name }</td>
							<th>진료과</th>
							<td>${dept_name }</td>
						</tr>
						<tr>
							<th>환자번호</th>
							<td>${reser_no }</td>
							<th>의료진</th>
							<td>${doc_name }</td>
						</tr>
						<tr>
							<th>환자구분</th>
							<td>${roles }</td>
							<th>예약날짜</th>
							<td>${reser_date }</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${tel }</td>
							<th>예약시간</th>
							<td>${reser_time }</td>
						</tr>
					</table>
				</div>
				</form>
				
				<div id="mbot">
					<button class="btnBot">변경</button>
					<button class="btnBot">취소</button>
					<button class="btnBot">인쇄</button>
				</div>
			</div>
			
		</div>
  		
  		<div class="column side" id="column_side_right"></div>
  </div>
   
   <jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>