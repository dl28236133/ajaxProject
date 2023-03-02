<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <link  rel="stylesheet" href="css/setting.css" type="text/css">
        <style rel ="stylesheet" type="text/css">
           #content{
           	height: 600px;
           	width: 100%
		  	
           }
            #content>div{
            	
            
            }
            
           #content>div>h1{
           	margin-top:5%;
           	
           	text-align:center;
           	font-family: '휴먼옛체';
    		color: rgb(219,153,50);
           }
           #content>div>p{
           		text-align:center;
           		justify-content: center;
            	margin:0px auto;
           		background-image: url("imgs/Bread01.jpg");
           		background-size:cover;
           		background-repeat: no-repeat;
           		width:600px;
           		height: 600px;
           		
           }
           
			
        </style>
		
		<script type="text/javascript">
		
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
                <li><a href="#">메인화면</a></li>
                <li><a href="notice.do">게시판</a></li>
                <li><a href="menu1.jsp">빵</a></li>
                <li><a href="menu2.jsp">디저트</a></li>
            </ul>
        </div>
        <div id="content">
            <div>
            	<h1>금주의 인기빵</h1>
            	<p></p>
            </div>
		</div>
        </div>
        <div id="footer">
            <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
           	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
        </div>
    </body>

</html>