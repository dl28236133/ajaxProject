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
	
	border:1px solid #000;
	margin-left:10%;
	width:80%;
  	height:600px;
  	border-radius: 10px;
  	
}
#content>div>div{

}

.second>div{
	margin-left:30px;
	
  	float:left;
  	padding: 10px;
  	
}
.title{
	margin-left:20px;
	text-align:left;
	font-size: 40px;
	border-bottom:1px solid #000;
	margin-right:20px;
}

.Content{
	clear:both;
	margin-top:10px;
	border-top:1px solid #000;
	margin-left:20px;
	margin-right:20px;
	text-align:left;
	
}
.btn1{
	text-align:right;
	padding-top:30px;
	margin-right:10%;
	margin-bottom:10px;   
}
.btn2{
	text-align:right;
	padding-top:30px;
	margin-right:10%;
	margin-bottom:10px;   
}

         
</style>	
    <!--  
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript">
	
function edit(){
	
	console.log(1);
	$('#content>div').remove();
	$('#content')
	.append($('<div/>'))
	.append($('<div/>')).addClass('title').html('<p><input name= "sub" value='+bean1.getSub()+'></p> ');
	
	
};
// $('<div id = "delete"/>')
// .append($('<div/>').addClass('num').html('<p>'+data.notice[i].num+'</p>'))
// .append($('<div/>').addClass('title').html('<a href="detail.do?idx='+data.notice[i].num+'">'+data.notice[i].sub+'</a>'))
// .append($('<div/>').addClass('writer').html('<p>'+data.notice[i].id+'</p>'))
// .append($('<div/>').addClass('date').html('<p>'+data.notice[i].hiredate+'</p>'))
// .append($('<div/>').addClass('count').html('<p>'+data.notice[i].cnt+'</p>'))
// .appendTo('.board_list');

-->
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
        	<%@ page import="com.bit.model.NoticeDto" %>
		<%
		NoticeDto bean=(NoticeDto)request.getAttribute("dto");
		Object obj =session.getAttribute("id");

		if (obj == null)obj ="";
		%>
		
		<%if(obj.equals(bean.getId())){%>
            <form class="btn1" action="delete.do?idx=<%=bean.getNum()%>" method ="post">
            	<button type="submit">삭제</button>
            </form>
              
               <!--  
             <form class="btn2" action="#">
	         	<button type="submit" onclick = "edit()" value = "<%=bean.getNum()%>">수정</button>
         	</form>
				 -->
			
            	
            <%}%>
       
        <div id="content">
			<div>
				<div class = "title"><p><%=bean.getSub() %></p></div>
				<div class = "second">
					<div class = "num"><p>번호 <%=bean.getNum() %></p></div>
					<div class = "id"><p>글쓴이 <%=bean.getId() %></p></div>
					<div class = "hiredate"><p>작성 시간 <%=bean.getHiredate() %></p></div>
					<div class = "count"><p>조회수 <%=bean.getCnt() %></p></div>
				</div>
				<div class = "Content"><p><%=bean.getContent() %></p></div>
			</div>
        </div>

        <div id="footer">
            <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
           	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
        </div>
    </body>

</html>