<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./resCal/cal.css">
<script src="https://kit.fontawesome.com/eef195c997.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./resCal/cal.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

* {
  box-sizing: border-box;
}

body {
	margin:0;
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.row{
	width:1600px;
	margin:0 auto;
	padding-top: 140px;
	position: relative;
}


/* Create three unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  height: 1000px; /* Should be removed. Only for demonstration */
}

/* Left and right column */
.column.side {
  width: 300px;
}

/* Middle column */
.column.middle {

  width: 1000px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}
.m2, .m3{
	width:100%;
}

.m2{
	height: 260px;
	margin-bottom: 10px;
}
.m2_1, .m3_1{
	float:left;
	width:70%;
}
.m2_1{
	border: 4px solid #94ccc4;
}
.m2_2, .m3_2{
	margin-left: 10px;
float:left;

	width:28.98%;

}
.m2_2{
	background-color:#94ccc4;
	color: white;
	padding: 30px 30px;
	height:260px;
}
.m2_2 > p{
	margin: 10px 0;
}
.m2_2btn{
	padding-bottom: 18px;
}
.m2_2btn button{
	border-radius: 3px;
	font-size: 15px;
}

.m2_2btn_1{
	margin-right: 10px;
}

.m3_1{
	border: 1px solid #EAEAEA;
	border-top: 4px solid #94ccc4;
	height: 621px;
}

.m3_1 > h3{
	padding: 20px;
}
.doc_box{
	border-top: 1px solid #EAEAEA;
	padding: 35px 10px;
	width:100%;
}
.doc_box ul{
	padding: 0;
	margin:0;
}
.doc_box ul li{
	display:inline-block;
	width: 49%;
	height: 150px;
	margin-bottom: 10px;
}

.doc_img{
	width: 40%;
	float: left;
}
.doc_img img{
	width: 100%;
	height: 150px;
}

.doc_info{
	width: 60%;
	float: left;
	padding-left: 20px;
}
.doc_info h3{
	margin: 0 0 15px 0;
}

.doc_info p{
	margin: 5px 0;
}

.doc_info p span{
	background-color: #5D5D5D;
	padding: 3px 5px;
	color: white;
}

.m3_2{
	height: 621px;
	border: 1px solid #EAEAEA;
/*  	text-align: center;  */
}
.m3_2 >h3{
	padding-left: 20px;
	padding-top: 25px;
	padding-bottom: 25px;
}
.calendar{
	text-align: center;
/*     padding-top: 50px; */
/*     height: 460px; */
/*     padding-left: 36px; */
	height: 370px;

}
.confirmation_btn{
   margin-top: 15px; 
    border: 1px solid #94ccc4;
    text-align: center;
    background: #94ccc4;
    font-size: 20px;
    font-weight: bold;
    color: white;
    padding: 13px;
}
.confirmation_btn:hover {
    border: 1px solid #94ccc4;
    text-align: center;
    background: white;
    font-size: 20px;
    font-weight: bold;
    color: #94ccc4;
    padding: 13px;
}

#confirm_btn{
	text-align: center;
	height: 150px;
/* 	position: fixed; */
	}

#cal_btn{
	text-align: center;
	padding-top: 30px;
}

.ampm_btn{
	background-color: #94ccc4; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
/*   margin: 4px 2px; */
margin-left: 5px;
margin-right: 5px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.ampm_btn:hover {
  background-color: white;
  color: #94ccc4;
}


/* Style the tab */
.tab {

  overflow: hidden;
  background-color: #EAEAEA;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: #EAEAEA;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  font-weight: bold;
  color:#5D5D5D;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #94ccc4;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #94ccc4;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  height: 200px;
}


.tabcontent ul li{
	text-align:left;
	width: 25%;
	border:none;
	float:left;
	font-size:14px;
	padding: 10px;
	display: inline-block;
	font-weight: bold;
	color:#5D5D5D;
}
.tablinks{
	width: 50%;
}

.tabcontent p{
	text-align: center;
	padding: 30px 10px 10px 10px;
}
#input{
	text-align: center;
}
#depart{
	 padding: 20px;
	display: block;
}
.side_ul{
  float: right;
  list-style-type: none;
  margin: 0px;
  padding: 0px;
  padding-top: 20px;
  width: 200px;
  margin-right: 50px;
  color: #5D5D5D;
}

.side_ul > li {
    display: block;
    width: 200px;
    line-height: 50px;
    color: #111;
    font-size: 15px;
    border: 1px solid #ddd;
    font-weight: bold;
    font-family: 'noto-sans';
    text-align: center;
    color: #5D5D5D;
    
    
}

.leftTop {
    color: #94CCC4;	/* 각 페이지 색으로 지정*/
    font-family: 'noto-sans';
    text-align: center;
    margin-bottom: 10px;
}

.side_ul li a:hover,
.side_ul li a:focus {
	background-color:#94CCC4;	/* 각 페이지 색으로 지정*/
	width: 200px;
    line-height: 50px;
    display: block;
    color: #5D5D5D;
}   

.side_ul li a{
	text-decoration:none;
	color: #5D5D5D;
}


/*사이드바 end*/

/* Style the footer */
.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
  height: 20%;
}
   

   #column_side_left {
   /*width: 160px;
   padding: 20px;
   margin-right: 20px;
   border: 1px solid #bcbcbc;*/
   }
   
   #column_side_right {
    /*width: 160px;
   padding: 20px;
    margin-bottom: 20px;
 	 border: 1px solid #bcbcbc;*/
}
   
  

   .row{
    width:1600px;
	margin:0 auto;
	padding-top: 140px;
	position: relative;
   }
   /* Clear floats after the columns */
   .row:after {
   
     content: "";
     display: table;
     clear: both;
     
   }
   
   /* Style the footer */
   .footer {
     background-color: #f1f1f1;
     padding: 10px;
     text-align: center;
   }
   
   /* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
   @media (max-width: 600px) {
     .column.side, .column.middle {
       width: 100%;
     }  
     
   }
   
 
/*footer start*/
#footer .family-site dd li {
    margin-bottom: 12px;
}


#footer .family-site {
    float: left;
    width: 250px;
    height: 184px;
    padding: 15px 28px;
    border-left: 1px solid #4e5157;
}

#hos_ul > li {
    list-style: none;
    display: list-item;
    text-align: -webkit-match-parent;
    
}

.clearfix > li {
    list-style: none;

}

#hos_ul {
    list-style-type: disc;
    display: block;
    padding: 0px;
    font-size: 13px;
    text-align: left;
}

#footer .btn-home {
    position: absolute;
   
    font-size: 11px;
    text-align: center;
    text-decoration:none;
    display: block;
    padding-top: 13px;

}

*, *:before, *:after {
    margin: 0px;
    padding: 0px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
}
.inner > a {
    color: #333;
    text-decoration: none;
    font-family: "NotoSans-Regular";
    vertical-align: middle;
}


.inner > a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

#footer {
    padding: 35px 0 88px 0;
   /* background: #7A9AA0;*/
    font-size: 16px;
    color: #5D5D5D;
    text-align: center;
}

#footer .info {
    float: left;
    width: 700px;
    height: 184px;
    padding-top: 15px;
}

#footer .tel-num {
    float: left;
    width: 295px;
    height: 184px;
    padding-top: 15px;
    border-left: 1px solid #4e5157;
    text-align: center;
}

#footer .family-site {
    float: left;
    width: 305px;
    height: 184px;
    padding: 15px 28px;
    border-left: 1px solid #4e5157;
}

#footer a{
	text-decoration:none;
	color: #5D5D5D;
	text-align:center;
}

.inner {
    max-width: 1300px;
    margin: 0 auto;
    position: relative;
}



footer{
    display: block\9;
    margin: 0\9;
    padding: 0\9;
    display: block;
}

.btn-top{
	border: 1px solid #ccc;
}

/*footer end*/



</style>
</head>
<script type="text/javascript">
function departMent(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
function doctor(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
</script>
<script type="text/javascript">

$(function(){
	show();
	function show(){
	        if(ampm != null){
	            $('#confirm_btn').show();
	        }else{
	            $('#confirm_btn').hide();
	        }
	}

	
	//진료과 선택
	$(document).on("click",".res_dept",function(){
		$("#cal_btn").empty();
		$("#calendarDiv").empty();
		ampm = null;
		show();
		var dept_no = $(this).val();
		dept_num = $(this).val();
		var dname = $(this).attr("dname");
		$("#deptname").html(dname);
		$("#res_doc").html("");
		$.ajax({
		    url: "/resDoc",
		    method: "POST",
		    dataType: "json",
		    data: {dept_no:dept_no},
		    success: function(data) {
// 				alert(data);
				for(var doc of data){
					var li = $("<li></li>");
					
					var img = $("<img>").attr("src","./image/"+doc.doc_fname);
					var doc_img = $("<div></div>").addClass("doc_img").html(img);
					
					var doc_info = $("<div></div>").addClass("doc_info");
					var name = $("<h3></h3>").html(doc.doc_name);
					var major = $("<p></p>").html(doc.major+" "+doc.position);
					var sc1 = $("<p></p>").append($("<span></span>").html("오전"));
					var sc2 = $("<p></p>").append($("<span></span>").html("오후"));
					var btn = $("<button></button>").html("진료예약").addClass("r_btn");
					$(btn).attr({doc_no:doc.doc_no, doc_name:doc.doc_name});

					var doc_no = doc.doc_no;
					$.ajax({
					    url: "/resSche",
					    method: "POST",
					    dataType: "json",
					    async: false,
					    data: {doc_no:doc_no},
					    success: function(data) {
						    for(var sche of data){
								if(sche.am_pm == "오전"){
									$(sc1).append(" "+sche.workday);
								}
								if(sche.am_pm == "오후"){
									$(sc2).append(" "+sche.workday);
								}
							}
					    }
					});

					
					$(doc_info).append(name,major,sc1,sc2,btn);

					$(li).append(doc_img,doc_info)
					
					$("#res_doc").append(li);
				}
		    }
		});
	});

	//의사 선택
	$(document).on("click",".r_btn",function(){
		$("#cal_btn").empty();
		ampm = null;
		show();
		var doc_no = $(this).attr("doc_no");
		doctor_num = $(this).attr("doc_no");
		var doc_name = $(this).attr("doc_name");
		$("#docname").html(doc_name);
		getCal();

		$.ajax({
		    url: "/resSche",
		    method: "POST",
		    dataType: "json",
		    async: false,
		    data: {doc_no:doc_no},
		    success: function(data) {
			    for(var sche of data){
				    var workday = sche.workday;
				    var am = sche.am_pm;
// 				    alert(am)
					switch(workday){
						case "일" : // 일요일
							$(".sunday").addClass("today");
							$(".sunday").removeClass("sunday");
							if (am == "오전") {
// 								alert("ok")
								$(".sunday").attr("am",am);
							}
							if (am == "오후") {
								$(".sunday").attr("pm",am);
							}
	                    	break;
						case "월" : // 월요일
							$(".monday").addClass("today");
							$(".monday").removeClass("day");
							if (am == "오전") {
// 								alert("ok")
								$(".monday").attr("am",am);
							}
							if (am == "오후") {
								$(".monday").attr("pm",am);
							}
	                    	break;
						case "화" : // 화요일
							$(".tuesday").addClass("today");
							$(".tuesday").removeClass("day");
							if (am == "오전") {
// 								alert("ok")
								$(".tuesday").attr("am",am);
							}
							if (am == "오후") {
								$(".tuesday").attr("pm",am);
							}
	                    	break;
						case "수" : // 수요일
							$(".wednesday").addClass("today");
							$(".wednesday").removeClass("day");
							if (am == "오전") {
// 								alert("ok")
								$(".wednesday").attr("am",am);
							}
							if (am == "오후") {
								$(".wednesday").attr("pm",am);
							}
	                    	break;
						case "목" : // 목요일
							$(".thursday").addClass("today");
							$(".thursday").removeClass("day");
							if (am == "오전") {
// 								alert("ok")
								$(".thursday").attr("am",am);
							}
							if (am == "오후") {
								$(".thursday").attr("pm",am);
							}
	                    	break;
						case "금" : // 금요일
							$(".friday").addClass("today");
							$(".friday").removeClass("day");
							if (am == "오전") {
// 								alert("ok")
								$(".friday").attr("am",am);
							}
							if (am == "오후") {
								$(".friday").attr("pm",am);
							}
	                    	break;
						case "토" : // 토요일
							$(".saturday").addClass("today");
							$(".saturday").removeClass("saturday");
							if (am == "오전") {
// 								alert("ok")
								$(".saturday").attr("am",am);
							}
							if (am == "오후") {
								$(".saturday").attr("pm",am);
							}
	                    	break;
					}
				}
		    }
		});
	});

	//예약시 필요한 전역번수
	var year;
	var month;
	var day;
	var ampm;
	var doctor_num;
	var dept_num;
	var resdate
	
	//날짜 선택
	$(document).on("click",".today",function(){
		ampm = null;
		show();
		day = $(this).html();
		$("#cal_btn").html("");
		var am = $(this).attr("am");
		var pm = $(this).attr("pm");

		if (am != null){
			var resbtn = $("<button></button>").html("오전예약").addClass("res_am ampm_btn");
			$("#cal_btn").append(resbtn);
		}
		if (pm != null){
			var resbtn = $("<button></button>").html("오후예약").addClass("res_pm ampm_btn");
			$("#cal_btn").append(resbtn);
		}
	});

	//오전예약 선택
	$(document).on("click",".res_am",function(){
// 		alert(dept_num);
// 		alert(doctor_num);
// 		alert(day);
		year = $("#year").html();
		month = $("#month").html();
		month = month.substring(0,month.length-1);
		ampm = "오전";
		resdate = (year+"/"+month+"/"+day);
// 		resdate = new Date(year+"/"+month+"/"+day);
// 		var aa = confirm("gg");
// 		alert(aa)
		show();
	});
	
	//오후예약 선택
	$(document).on("click",".res_pm",function(){
		year = $("#year").html();
		month = $("#month").html();
		month = month.substring(0,month.length-1);
		ampm = "오후";
		resdate = (year+"/"+month+"/"+day);
		show();
	});

	//예약확정버튼
	$(document).on("click","#confirm_btn2",function(){
		if (ampm == null){
			alert("예약일을 정해주세요.");
			return false;
		}
		
		$.ajax({
		    url: "/insertRes",
		    method: "POST",
		    dataType: "json",
		    async: false,
		    data: {reser_date:resdate, reser_time:ampm, doc_no:doctor_num, dept_no:dept_num},
		    success: function(data) {
			    if(data.no > 3){
					alert("예약이 종료되었습니다. 다른날짜를 선택해주세요.");
					return false;
				}
				if (data.re >0){
					alert("예약에 성공하였습니다.");
					location.href="/resOk";
				} else {
					alert("예약에 실패하였습니다. 다시 예약해주세요.");
					return false;
				}
		    }
		});
	});
	
	$.ajax("/resDept",{success:function(data){
		$("#deptul").html("");
		for(let de of data){
			var li = $("<li></li>");
			var input = $("<input>").val(de.dept_no).attr({type:"radio",name:"dept_no",dname:de.dept_name}).addClass("res_dept");
			var text = $("<span></span>").html(" "+de.dept_name);
			$(li).append(input,text);
			$("#deptul").append(li);
		}
	}});
});
</script>
<body>


<!-- Header Start -->
<%--      <jsp:include page="/header.jsp"></jsp:include> --%>
<!-- 	Header End -->

<div class="row">
  <div class="column side">
  		<div>
  		<ul class="side_ul">
  		<h1 style="font-size: 23px;" class="leftTop">진료	예약</h1>		<!-- 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="">진료과</a></li>			<!-- 서브 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="">의료진</a></li>
		  <li class="side_li"><a href="">예약확인</a></li>
		  <li class="side_li"><a href="">마이페이지</a></li>
		</ul>
  	</div>
  </div>
  <div class="column middle">
  	
  	<div class="m1">
  		<h2>인터넷 진료예약</h2>
  		<img src="">
  	</div>
	
	<div class="m2">
		
		<div class="m2_1">
			<div class="tab">
			  <button class="tablinks" onclick="departMent(event, 'depart')">진료과 선택</button>
			  <button class="tablinks" onclick="doctor(event, 'doc')">의료진 검색</button>
			 
			</div>
			<div id="depart" class="tabcontent">
				<ul id="deptul">

			  	</ul>
			</div>
		
			<div id="doc" class="tabcontent">
				<div id="input">
				<p>찾으시는 의료진명을 입력해 주세요.</p>
				<input type="text">
				<button>찾기</button>
				</div>
			</div>
			
		</div>
		
		<div class="m2_2">
			<h3>예약하실 정보</h3>
			<p>환자명 : ${m.name }</p>
			<div class="m2_2btn">
			<button class="m2_2btn_1">환자정보확인</button>
			<button>최근예약</button>
			</div>
			<p>진료과 : <span id="deptname"></span></p>
			<p>의료진 : <span id="docname"></span></p>
			<p>진료일시 : <span id="resdate"></span></p>
			<p></p>
		</div>
	</div>
	
	<div class="m3">
		<div class="m3_1">
			<h3>의료진 선택</h3>
			<div class="doc_box">
				<ul id="res_doc">				
				</ul>
			</div>
		</div>
		<div class="m3_2">
			<h3>진료일정</h3>
			<div class="calendar">
				<div id="calendarDiv" style= "font-weight:bold;font-size:15pt;"></div>
			</div>
			<div id="cal_btn"></div>
			<div id="confirm_btn">
			<button class="confirmation_btn" id="confirm_btn2">
				예약확정하기
			</button>
			</div>
		</div>
	</div>  
  
  </div>
  <div class="column side"></div>
</div>

<!-- footer -->
 
<!-- //footer -->

</body>
</html>