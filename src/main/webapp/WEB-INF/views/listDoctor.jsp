<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./css/temp.css">
<link rel="stylesheet" href="./css/sidebar.css">
<style type="text/css">
.main {
	display: table;
	border-bottom: solid #94CCC4 1px;
	padding: 30px;
 	justify-content: center; 
 	display: flex; 
	color: #5d5d5d;
	font-family: '맑은 고딕';
	width: 100%;
	padding-left: 10%;
	padding-right: 10%;
}

   .row{
   width:1600px;
   margin:0 auto;
   padding-top: 30px;
   position: relative;
   }

.face {
	width: 150px;
	height: 200px;
	margin-right: 100px;
}

.info li {
	list-style: none;
	padding-bottom: 5px;
	margin-bottom: 5px;
	display: table-row;
}
.info span {
	display: table-cell;
	width: 400px;
	padding-left: 50px;
}
.info strong {
	display: table-cell;
	margin-right: 30px;
}
.info button {
	float: right;
	margin: 5px;
	color: white;
	background-color: #94CCC4;
	border-radius: 3px;
 	border: none;
 	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 16px;
  	transition-duration: 0.4s;
  	cursor: pointer;
  	padding: 5px;
}
.info button:hover {
  background-color: white;
  color: #94CCC4;
}
.info div {
	margin-bottom: 10px;
}

.title {
	border-bottom: solid 2px #94CCC4;
	padding: 5px;
	padding-bottom: 50px;
	padding-top: 50px;
	text-align: center;
	margin-bottom: 0px;
	color: #5d5d5d;
}

.active {
	background: #f6f7dd;
}

.title span {
/* 	background-color: #94CCC4; */
	padding: 10px;
	text-align: center;
	margin-left: 30px;
}

.title button {
	margin: 5px;
	color: white;
	background-color: #CBE2B8;
	border-radius: 3px;
	height : 40px;
 	border: none;
 	justify-content: center;
	display: flex;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 15px;
  	transition-duration: 0.4s;
  	cursor: pointer;
  	padding: 5px;
}
.title button:hover {
  background-color: white;
  color: #5d5d5d;
}

.title input {
	height: 25px;
	text-align: center;
	color: #5d5d5d;
	border: solid 1px #CBE2B8;
}

.title strong {
	text-decoration: underline;
	color: #94CCC4;
}


#buttons > button {
	margin: 5px;
	color: white;
	background-color: #94CCC4;
	border-radius: 3px;
 	border: none;
 	justify-content: center;
 	text-align : center;
	display: flex;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 19px;
  	transition-duration: 0.4s;
  	cursor: pointer;
  	padding: 10px;
}

#searchbar {
    margin-top : 10px;
 	height: 40px;
 	font-size: 18px;

}

#deptbtn {
	margin: 5px;
	color: white;
	background-color: #94CCC4;
	border-radius: 3px;
 	border: none;
 	justify-content: center;
 	text-align : center;
	display: flex;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 19px;
  	transition-duration: 0.4s;
  	cursor: pointer;
  	padding: 10px;

}

</style>
<title>율제대병원 의료진 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function () {

	
// function titlearea() {
// 	//타이틀
// 	var titlediv = $("<div></div>").addClass("title");
// 	//	var dept = $("<h1></h1>").html("<strong>"+strongtitle+"</strong> 의료진목록");
// 	var dept = $("<h1></h1>").html("<strong>"+dname+"</strong> 의료진목록");
// 	var searchspan = $("<span></span>");
// 	var searchinput = $("<input>").attr("type", "search").attr("size", "50").attr("placeholder", "의료진 이름을 입력하세요");
// 	var searchbtn = $("<button>의료진 검색</button>");
// 	searchbtn.on("click",function(str){
// 		search(str);
// 	});

// 	searchspan.append(searchinput);
// 	searchspan.append(searchbtn);
	
// 	titlediv.append(dept);
// 	titlediv.append(searchspan);
	
// 	$("#ajaxtest_output").append(titlediv);
// }



	var num = "${dept_no}"; //진료과번호
	var dname = ""; //상단에 진료과이름
	var str; //검색어
	
	
	var searchbar = $("#searchbar").val();

	$("#searchbtn").click(function(){
		$('#titleline').empty();
		$('#ajaxtest_output').empty();
		
		searchbar = $("#searchbar").val(); //검색어를 가져옴

		$('#titleline').html("<strong>"+searchbar+"</strong> 검색결과");
		search(searchbar); //검색실행
	});

function search(str){
	$.ajax({
		url:"/listDoctor2",
		type: "POST",
		data: {str:str},
		dataType:"json",
		success:function(data){
		for(var doc of data){
			var div = $("<div></div>").addClass("main");
			var imgspan = $("<span></span>");
			var img = $("<img>").attr("src", "./docimage/"+doc.doc_fname).addClass("face");
			imgspan.append(img);
			
			var infospan = $("<span></span>").addClass("info");

			var infoul = $("<ul></ul>");
			var namediv = $("<div></div>");
			var nameli = $("<li></li>").html("<h2>"+doc.doc_name+"</h2>");
			namediv.append(nameli);
			var majorli = $("<li></li>").html("<strong>진료과</strong>"+"<span>"+doc.major+"</span>");
			var specli = $("<li></li>").html("<strong>전문분야</strong>"+"<span>"+doc.specialization+"</span>");
			infoul.append(namediv);
			infoul.append(majorli);
			infoul.append(specli);

			
			var rlink = $("<a></a>").attr("href", "/reservation");
			var reserbtn = $("<button>예약</button>").appendTo(rlink);			
			var dlink = $("<a></a>").attr("href", "/detailDoctor?doc_no="+doc.doc_no);
			var detailbtn = $("<button>상세보기</button>").appendTo(dlink);


			infospan.append(infoul);
			infospan.append(dlink);
			infospan.append(rlink);
			
			div.append(imgspan);
			div.append(infospan);

			$("#ajaxtest_output").append(div);
		}
	}})
}


function list(num){ 
	
	$.ajax({
		url:"/listDoctor1",
		type: "GET",
		data:{dept_no:num}, 
		dataType:"json",
		success:function(data){
	
// 		console.log(data);
		

		
		for(var doc of data){
			if(doc.dept_no==num){
// 				console.log(doc.dept_no);
				
				$('#titleline').html("<strong>"+doc.major+"</strong> 의료진목록");
				var div = $("<div></div>").addClass("main");
				var imgspan = $("<span></span>");
				var img = $("<img>").attr("src", "./docimage/"+doc.doc_fname).addClass("face");
				imgspan.append(img);
				
				var infospan = $("<span></span>").addClass("info");

				var infoul = $("<ul></ul>");
				var namediv = $("<div></div>");
				var nameli = $("<li></li>").html("<h2>"+doc.doc_name+"</h2>");
				namediv.append(nameli);
				var majorli = $("<li></li>").html("<strong>진료과</strong>"+"<span>"+doc.major+"</span>");
				var specli = $("<li></li>").html("<strong>전문분야</strong>"+"<span>"+doc.specialization+"</span>");
				infoul.append(namediv);
				infoul.append(majorli);
				infoul.append(specli);
				
// 				var reserbtn = $("<button></button>").html("예약하기");
				var rlink = $("<a></a>").attr("href", "/reservation");
				var reserbtn = $("<button>예약</button>").appendTo(rlink);	

				var dlink = $("<a></a>").attr("href", "/detailDoctor?doc_no="+doc.doc_no);
				var detailbtn = $("<button>상세보기</button>").appendTo(dlink);

				infospan.append(infoul);
// 				infospan.append(reserbtn);
				infospan.append(dlink);
				infospan.append(rlink);
				
				div.append(imgspan);
				div.append(infospan);

				$("#ajaxtest_output").append(div);
			}
		} //전체반복끝
	}}) //ajax통신끝.
	} //함수끝


// 	titlearea();
	list(num);


	
	$("#ajaxtest_btn1").click(function(){
		$('#ajaxtest_output').empty(); 
		num=1;
		list(num);
	});
	$("#ajaxtest_btn2").click(function(){
		$('#ajaxtest_output').empty();
		num=2;
		list(num);
	});
	$("#ajaxtest_btn3").click(function(){
		$('#ajaxtest_output').empty();
		num=3;
		list(num);
	});
	$("#ajaxtest_btn4").click(function(){
		$('#ajaxtest_output').empty();
		num=4;
		list(num);
	});
	$("#ajaxtest_btn5").click(function(){
		$('#ajaxtest_output').empty();
		num=5;
		list(num);
	});
	$("#ajaxtest_btn6").click(function(){
		$('#ajaxtest_output').empty();
		num=6;
		list(num);
	});
	$("#ajaxtest_btn7").click(function(){
		$('#ajaxtest_output').empty();
		num=7;
		list(num);
	});
	$("#ajaxtest_btn8").click(function(){
		$('#ajaxtest_output').empty();
		num=8;
		list(num);
	});
	$("#ajaxtest_btn9").click(function(){
		$('#ajaxtest_output').empty();
		num=9;
		list(num);
	});
	$("#ajaxtest_btn10").click(function(){
		$('#ajaxtest_output').empty();
		num=10;
		list(num);
	});
	$("#ajaxtest_btn11").click(function(){
		$('#ajaxtest_output').empty();
		num=11;
		list(num);
	});
	$("#ajaxtest_btn12").click(function(){
		$('#ajaxtest_output').empty();
		num=12;
		list(num);
	});
	$("#ajaxtest_btn13").click(function(){
		$('#ajaxtest_output').empty();
		num=13;
		list(num);
	});
	$("#ajaxtest_btn14").click(function(){
		$('#ajaxtest_output').empty();
		num=14;
		list(num);
	});
	$("#ajaxtest_btn15").click(function(){
		$('#ajaxtest_output').empty();
		num=15;
		list(num);
	});


})


</script>
</head>
<body>
<!-- Header Start -->
     <jsp:include page="/header.jsp"></jsp:include>
<!-- 	Header End -->

<div class="row">
  <div class="column side">
  
  <!-- sidebar -->
  	<div>
  		<ul class="side_ul">
  		<h1 style="font-size: 23px;" class="leftTop">의료진/진료과</h1>		<!-- 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="">진료과</a></li>			<!-- 서브 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="/listDoctor">의료진</a></li>
		  <li class="side_li"><a href="">의료과 검색</a></li>
		</ul>
  	</div>
  	
  	<!-- //sidebar -->
  
</div>
  <div class="row">
 	<div class="column middle">
  	<div id="ajaxtest">
  		<div id="buttons">
  		<button id="ajaxtest_btn1" class="deptbtn">호흡기내과</button>
  		<button id="ajaxtest_btn2" class="deptbtn">순환기내과</button>
  		<button id="ajaxtest_btn3" class="deptbtn">소화기내과</button>
  		<button id="ajaxtest_btn4" class="deptbtn">알레르기내과</button>
  		<button id="ajaxtest_btn5" class="deptbtn">내과(일반)</button>
  		<button id="ajaxtest_btn6" class="deptbtn">간담췌외과</button>
  		<button id="ajaxtest_btn7" class="deptbtn">위장관외과</button>
  		<button id="ajaxtest_btn8" class="deptbtn">대장항문외과</button>
  		<button id="ajaxtest_btn9" class="deptbtn">이식혈관외과</button>
  		<button id="ajaxtest_btn10" class="deptbtn">외과(일반)</button>
  		<button id="ajaxtest_btn11" class="deptbtn">신경과</button>
  		<button id="ajaxtest_btn12" class="deptbtn">안과</button>
  		<button id="ajaxtest_btn13" class="deptbtn">정형외과</button>
  		<button id="ajaxtest_btn14" class="deptbtn">가정의학과</button>
  		<button id="ajaxtest_btn15" class="deptbtn">산부인과</button>
  		</div>
  		
  		<div class="title">
  			<h1 id="titleline">
  				<strong>${d.major}</strong> 의료진목록
  			</h1>
  			<span>
<!--   				<input type="text" size="40" name="search" class="searchText" id="search"> -->
<!--   				<button id="btn">검색</button> -->
  				<input type="text" id="searchbar" size="50" placeholder="의료진 이름을 입력하세요.">
  				<button id="searchbtn">의료진 검색</button>
  			</span>
  		</div>
  		 
  		<div id="ajaxtest_output">
  		
  		</div>
  		<div>
  			<a href="/listDept"><button id="deptbtn">진료과</button></a>
  		</div>
  	</div> 
  	</div>
  </div>

  <div class="column side"></div>
</div>
 	<jsp:include page="/footer.jsp"></jsp:include> 
</body>
</html>