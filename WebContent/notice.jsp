<%@page import="com.bit.model.NoticeDto,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/setting.css" type="text/css">
<style rel ="stylesheet" type="text/css">
            
#content{
	margin-left:10%;
  	height:600px;
  	width: 80%;
}
.board_list {
	margin-top: 30px;	
	width: 100%;
	text-align:center;
	border: 1px solid #000;
	border-bottom: 2px solid #000;
	text-align: center;C
}	
.board_list > div{
	font-family: '휴먼옛체';
	border-top: 1px solid #000;
}
.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
}
.board_list > .top {
    font-weight: 600;
    margin:0px;
}
.board_list .num {
	width: 10%;
}
.board_list .title {
    width: 40%;
}
.board_list .writer {
    width: 10%;
}
.board_list .date {
    width: 20%;
}
.board_list .count {
    width: 10%;
    text-align: right;
}
.board_list .title>a{
 position: block;
    color:black;
    text-decoration: none;
}

.board_page{
	justify-content: center;
	display:flex;
	text-align: center;
	
	
}
.board_page > a{
	padding-bottom: 100px
	
}
.addbtn{
	text-align:right;
	margin-right: 10px;
}
.paging{
}
.paging>a{
}
.paging>div{

	display: inline-block;
	width: 20px;
}
      
</style>
	
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript">
var count;
var pageCount;
var maxContent
var page=1;
var setPage = function(){
// 	$.getJSON('http://localhost:8080/WebProject/noticelist.do',function(data){
	$.getJSON('http://localhost:8080/WebProject/noticelist.do',function(data){
		count = data.notice.length;
		maxContent = count;
		if((maxContent%5)==0)
			pageCount = parseInt((maxContent/5));
		else 
			pageCount = parseInt((maxContent/5)) +1;
		
		console.log(count);
		console.log(maxContent);
		console.log(pageCount);
		
		for(var i = 0 ; i< pageCount ;i++)
		{
		$('<div/>')
		.html('<a href="#" onclick ="pageClick('+(i+1)+')" >'+(i+1)+'</a>')
		.appendTo('.paging');
		}
	});
}

var listLoading=function(){
// 	$.getJSON('http://192.168.240.198:8080/WebProject/noticelist.do',function(data){
 	$.getJSON('http://localhost:8080/WebProject/noticelist.do',function(data){
		$('div').remove('#delete');
		var start = page*5-4;
		var end = page*5
		if ( end > maxContent)
			end = maxContent
		for(var i = start-1 ; i< end;i++)
			{	
				$('<div id = "delete"/>')
				.append($('<div/>').addClass('num').html('<p>'+data.notice[i].num+'</p>'))
				.append($('<div/>').addClass('title').html('<a href="detail.do?idx='+data.notice[i].num+'">'+data.notice[i].sub+'</a>'))
				.append($('<div/>').addClass('writer').html('<p>'+data.notice[i].id+'</p>'))
				.append($('<div/>').addClass('date').html('<p>'+data.notice[i].hiredate+'</p>'))
				.append($('<div/>').addClass('count').html('<p>'+data.notice[i].cnt+'</p>'))
				.appendTo('.board_list');
			}
		data.notice.forEach(function(ele){
		});
	});
}

function pageClick(a){
		page = a;
		
		listLoading();
}
function nextClick(){
	if ( page !=pageCount)
		page++;
	
	listLoading();
}function prevClick(){
	if ( page !=1)
		page--;
	
	listLoading();
}

$(function(){
	setPage();
	
	listLoading();
	
});



</script>
    
</head>
    <body>
    	<div id="login">
    		<a href="signup.jsp">회원가입 </a>
            <p>&nbsp;</p>
            <%if(session.getAttribute("login") !=null){%>
            	<a href="logout.do">로그아웃</a>
            	
            <%}else{%>
            
            	<a href="login.jsp">로그인</a>
            <%} %>
    	</div>
        <div id="header">
            <h1></h1>
            
        </div>
        <div id="menu">
            <ul>
                <li><a href="Main.jsp">메인화면</a></li>
                <li><a href="notice.do">게시판</a></li>
                <li><a href="menu1.jsp">빵</a></li>
                <li><a href="menu2.jsp">디저트</a></li>
            </ul>
        </div>
        <div id="content">
        	<div class="addbtn">
        	<%if(session.getAttribute("login") !=null){%>
            	<a href="write.jsp">글 작성</a>
            <%}else{%>
            	<a href="login.jsp">글 작성</a>
            <%} %>
	        </div>
            <div class="board_list">
	            
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회수</div>
                </div>
                
            </div>
            <div class="board_page">
                <a href="#" onclick ="prevClick()"><</a>
                <div class = "paging"></div>
            
                <a href="#" onclick ="nextClick()">></a>
            </div>
            
        </div>
        <div id="footer">
            <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
           	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
        </div>

        
    </body>

</html>