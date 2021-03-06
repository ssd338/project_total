<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 건강티비 페이지 -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;	
}

/* Style the header */


/* Create three unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

/* Left and right column */
.column.side {
  width: 25%;
}

/* Middle column */
.column.middle {
  width: 50%;
  height: auto;
}

/* Clear floats after the columns */
.row{
	padding-top: 130px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}


/* 위에는 w3school 긁어온것 */


/* 페이지이름 */
.part_title{
	padding: 50px;
	text-align: center;
	
	font-size: 30px;
	font-family: bold;
}

/* 내용부분(메인) */
.part_content{
	width: 100%;
	border-top: 3px solid #94ccc4;
}

/* 영상 목록 리스트 */
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto;
  padding: 24px;
}
.grid-item {
  background-color: #EAEAEA;
  border: 1px solid #A4A4A4;
  border-radius: 10px;
  padding: 15px;
  margin: 10px;
  width: 250px;
  height:220px;
  font-size: 30px;
  text-align: center;
}
/*영상목록*/
.tv{
	border-bottom: 2px solid #94ccc4;
}
/*영상이미지*/
.tv img{
	width: 100%;
	height: 130px;
}

.tv_title{
	font-size: 16px;
}


/* 페이징 */
.bottom{
	text-align: center;
}


.num{
	border: 1px solid #94ccc4;
	padding-left: 4px;
	padding-right: 4px;
	padding-top: 2px;
	padding-bottom: 2px;
}

.div_num{
	margin-bottom: 10px;
}




.search button{
	width: 50px;
	height: 20px;
	border: none;
	border-radius: 6px;
	background-color: #94ccc4;
	margin-left: 5px;
}
	/*main_search 속 - 의학티비 검색창*/
	.search{
		margin-top: 20px;
	}
	
	.searchText{
	width:220px;
	height: 25px;
    padding-right: 10px;
    padding-left: 10px;
    border: 1px solid #ccc;
    color: #666;
    font-size: 14px;
	}
	.search button{
	 background-color: #94ccc4;
	 width: 70px;
     height: 30px;
     padding: 0 10px;
     color: #fff;
     font-size: 16px;
     letter-spacing: -.8px;
     line-height: 1.5;
	}


/*사이드바 start*/


.side_ul{
  float: right;
  list-style-type: none;
  margin: 100px 50px 0 0;
  padding: 0px;
  padding-top: 20px;
  width: 200px;
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
 /* 다음(이전) 버튼 */
    .btn_pn{ 
     text-align: center;
    background-color: #CBE2B8;
    border: solid 3px #CBE2B8;
    width: 50px;
     height: 30px;
     padding: 0 8px 0 5px;
     margin: 0px 3px 5px 0px;
     color: #fff;
     font-size: 16px;
     letter-spacing: -.8px;
     line-height: 1.5;
   }
   
</style>
<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/eef195c997.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="header.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	function pagingAjax(dataPerPage,currentPage,search){   //매개변수로 한페이지에 나타낼데이터 수, 현재 선택된 페이지,검색어
	    $.ajax({
	        url: "/listMedicalTV.ajax",
	        method: "POST",
	        data: {dataPerPage:dataPerPage,currentPage:currentPage,search:search},
	        dataType : "json",
	        async:false,
	        success: function(data) {    					  //map - MedicinVo가 담긴 list와 검색어에 따른 레코드수가 들어있는 cnt       
				var list = data.list
				$("#cnt").val(data.cnt)
				$("#grid-container").empty()
	            if(list.length>0){      
	        	  $.each(list, function(idx, item){
	            	  var img = $("<img>").attr("src","./TVImg/"+item.tv_img)
	            	  var div2 = $("<div class='tv'></div>").html(img)
					  var div3 = $("<div class='tv_title'></div>").html(item.tv_title)	            	  
	            	 
	            	  var a = $("<a></a>").attr("href","/detailMedicalTV?no="+item.tv_no).append(div2,div3);
	            	  var div = $("<div class='grid-item' style='cursor: pointer;'></div>")
	                  $(div).html(a)
	                  $("#grid-container").append(div)
	        	  })  
	        	$("#page_tv").html($("#grid-container"))
	        	
	           }
	        }
	    })
	 }   
	 
	  var totalData = $("#cnt").val();    // 총 영상 수      6
	  var dataPerPage = 6;   			  // 한 페이지에 나타낼 데이터 수
	  var pageCount = 5;        		  // 한 화면에 나타낼 페이지 수
	  var search = $("#search").val();    // 검색어

	 
	  function paging(totalData, dataPerPage, pageCount, currentPage){				//페이징 번호표 [이전]12345[다음]이거 생성해주는 메소드
	      var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수    올림(총 약품 수 / 한페이지에 나타낼 데이터의 수)
	      var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹(1번페이지면 1번 그룹, 6페이지면 2번그룹) (현재페이지/한화면에 나타낼 페이지수)
	      
	      var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호       페이지그룹/한 화면에 나타낼 페이지 수
	      if(last > totalPage)                 // 총 페이지 수보다 last가 큰 경우
	          last = totalPage;
	      
	      var first = (pageGroup * pageCount) - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
	      if(first <1){                  // 현재 총 페이지의 수가 5보다 적으면  fist는 1
	       first = 1
	      }
	      var next = last+1;   //다음
	      var prev = first-1;   //이전
	      
	      var html = "";
	      
	      if(prev > 0)
	          html += "<a href=# id='prev'><button class='btn_pn'>이전</button></a> ";
	      
	      for(var i=first; i <= last; i++){
	          html += "<a href='#' id=" + i + ">" + i + "</a> ";
	      }
	      
	      if(last < totalPage)
	          html += "<a href=# id='next'><button class='btn_pn'>다음</button></a>";

	      if(totalData>0){                 //약품이 있는 경우
	         $("#paging").html(html);    // 페이지 목록 생성
	         $("#paging a").css("color", "black");
	         $("#paging a#" + currentPage).css({"text-decoration":"none", 
	                                            "color":"#CBE2B8", 
	                                            "font-weight":"bold"});    // 현재 페이지 표시
	      }else{                        //약품이 없는 경우
	    	  $("#grid-container").val("진료 이력이 없습니다.")
	      } 
	                                          
	      $("#paging a").click(function(){         //숫자를 (a태그)를 눌렀을때 동작
	          var $item = $(this);
	          var id = $item.attr("id");
	          var selectedPage = id;
	          
	          if(id === "next")    selectedPage = next;      //다음 혹은 이전이 눌렸는지 체크
	          if(id === "prev")    selectedPage = prev;
	          pagingAjax(dataPerPage,selectedPage,search);               //페이지에 맞는 레코드를 가져오는 ajax을 호출
	          paging(totalData, dataPerPage, pageCount, selectedPage);      //밑에 페이징 번호표 [이전]12345[다음]이거 생성
	          
	      });
	  }

	  $("#btn").click(function(){         							// 검색 버튼을 눌렀을때
		  search = $("#search").val();								// 검색어를 가져옴
	      pagingAjax(dataPerPage,1,search);                         // ajax으로 레코드를 가져온다(한페이지에 보여줄데이터 수(5),현재페이지,검색어)
	      totalData = $("#cnt").val();								// 검색어에 따른 데이터의 수 - ajax에서 cnt에 담아놓음
	      paging(totalData, dataPerPage, pageCount, 1);             // 페이징버튼 메소드호출
	     });
	  
	  $("document").ready(function(){ 								// 처음 화면 켰을때
		  pagingAjax(dataPerPage,1,search);                         // 첫 화면의 레코드  한페이지에 나타낼데이터 수, 현재 선택된 페이지, 검색어 => 검색어는 "%%"
		  totalData = $("#cnt").val();
		  paging(totalData, dataPerPage, pageCount, 1);             // 페이징버튼 메소드호출 [이전]12345[다음]
	   });

});
</script>
<title>건강TV</title>
</head>
<body>
  <!-- Header Start -->
      <jsp:include page="/header.jsp"></jsp:include>
<!--    Header End -->

<div class="row">
	<!-- 양쪽 빈공간중에 왼쪽. 메뉴바 들어옴. -->
  <div class="column side">
  	     		<!-- sidebar -->
  	<div>
  		<ul class="side_ul">
  		<h1 style="font-size: 23px;" class="leftTop">고객 서비스</h1>		<!-- 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="/document">증명서 발급 안내</a></li>			<!-- 서브 메뉴 이름 (페이지마다 다르게 지정) -->
		  <li class="side_li"><a href="/listMedicalTV">건강TV</a></li>
		  <li class="side_li"><a href="/listMedicine">약품 정보</a></li>
		  <li class="side_li"><a href="/course.jsp">이달의 강좌</a></li>
		</ul>
  	</div>
  	
  	<!-- //sidebar -->
  </div>
  
  	<!-- 중간 -->
  <div class="column middle">
  
  <!-- 페이지의 이름. -->
  	<div class="part_title"> 
  		<p>건강TV</p>
  	</div>
  	
  	<!-- 페이지의 내용 -->
  	<input type="hidden" value="${cnt }" id="cnt">
  	<div class="part_content">
  	<div id="page_tv">
  		<div class="grid-container" id="grid-container">
  		
		</div>
	</div> 	
		<!-- 리스트번호, 검색 -->
	<div class="bottom">
		<div class="bottom">
			<div class="div_num" id="paging">
				
			</div>
		</div>
			<div class="search">
				<div id="ser_css">
					<input type="text" size="40" name="search" class="searchText" id="search">
					<button id="btn">검색</button>
				</div>
			</div>
	</div>
		
	</div><!-- part_content 끝 -->
  </div><!-- 가운데 레이아웃 끝 -->
  
  <div class="column side"></div>
</div>

  <!-- footer -->
   <jsp:include page="/footer.jsp"></jsp:include>
   <!-- //footer -->
   
</body>
</html>