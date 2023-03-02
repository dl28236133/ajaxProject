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
            	
            	height:400px;
            }
            
            #content>div{
            	margin:auto;
            	margin-top:200px;
            	border-radius:20px;
            	width:400px;
            	height:200px;
            	background-color: rgb(121,80,35);
            }
            #content>div>div{
            	
            	text-align: center;
            }
            #content>div>div>form{
            	margin-top: 50px;
            }
            #content>div>div>form>h1{
            	
            	font-family: '휴먼옛체';
            	color:rgb(238,217,182);
            }
            #content>div>div>form>input{
            	width:200px;
            	margin-bottom:10px;
            	height:30px;
            	
            }
             #content>div>div>login{
            	width:60px;
            	margin-bottom:10px;
            	height:40px;
            	
            }
            #login>a{
            font-family: '휴먼옛체';
            }
            
        </style>
        
    </head>
	<body>
    	<div id="login">
    		<a href="signup.jsp">회원가입</a>
            <p>&nbsp;</p>
            <a href="#"></a>
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
        	<div>
        		<div>
	        		
	        		<form action="./login.do" method="post">
	        		<h1>로그인</h1>
					<input type = "text" name="id" placeholder ="id"/>      		
					<input type = "password" name="pw" placeholder ="password"/>
					<br>
					<input value="LOGIN" type ="submit" name="login">
					</form>
        		</div>	    		
        	</div>
        </div>
        <div id="footer">
            <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
           	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
        </div>
    </body>
</html>