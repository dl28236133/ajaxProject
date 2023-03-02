<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link  rel="stylesheet" href="css/setting.css" type="text/css">
        <style rel ="stylesheet" type="text/css">
            
            #content{
            margin-top:30px;
           	margin-left:10%;
		  	height:500px;
		  	width: 80%;
		  	
           }
           #content>div{
           	margin-top:30px;
           	
           	margin-left: auto;
		  	margin-right: auto;
		  	width : 780px;
           }
           #content>div>div>p{
           		margin-top:10px;
           		float:left;
           		
           		
           }
           #content>div>div>p>img{
           		background-size:cover;
           		background-repeat: no-repeat;
           		width:200px;
           		height: 200px;
           		margin-left: 30px;
		  		margin-right: 30px;
		  		margin-bottom: 30px;
           }
           #content>div>div>h1{
           	margin-top:5%;
			text-align: center;
			font-family: '휴먼옛체';
    		color: rgb(219,153,50);           
           }
        </style>
        
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
                <li><a href="#">디저트</a></li>
            </ul>
        </div>
        <div id="content">
            
            <div>
	            <div>
					<h1>dessert</h1>
					<p><img src = "imgs/dessert01.jpg" ></p>
					<p><img src = "imgs/dessert02.jpg" ></p>
					<p><img src = "imgs/dessert03.jpg" ></p>
				</div>
			</div>
			<div>
	            <div>
					<p><img src = "imgs/dessert04.jpg" ></p>
					<p><img src = "imgs/dessert05.jpg" ></p>
					<p><img src = "imgs/dessert06.jpg" ></p>
				</div>
			</div>


        </div>
        <div id="footer">
            <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
           	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
        </div>
    </body>

</html>