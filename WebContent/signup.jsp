<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link  rel="stylesheet" href="css/setting.css" type="text/css">
    <style rel ="stylesheet" type="text/css">
        #content{
        	
        	height:500px;
        }
        
        #content>div{
        	margin:auto;
        	margin-top:200px;
        	border-radius:20px;
        	width:400px;
        	height:300px;
        	background-color: rgb(121,80,35);
        }
        #content>div>div{
        	text-align: center;
        }
        #content>div>div>form{
        	margin-top: 50px;
        }
        #content>div>div>form>input{
        	width:200px;
        	margin-bottom:10px;
        	height:30px;
        	
        }
        #content>div>div>form>h1{
        	font-family: '휴먼옛체';
        	color:rgb(238,217,182);
        }
         #content>div>div>login{
        	width:60px;
        	margin-bottom:10px;
        	height:40px;
        }
        .err{color: rgb(238,217,182);}
    </style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#content>div>div>form').submit(function(){
		var bool = true;
		$(this).find('span').remove();
		$(this).find(":text").each(function(dix,ele){
			if($(ele).val()==''){
				$(ele).after('<span class="err">입력 필수</span>');
			bool = false;	
			}
		});
		$(this).find(":password").each(function(dix,ele){
			if($(ele).val()=='')
				{
				$(ele).after('<span class="err">입력 필수</span>');
				bool = false;}	
				
		});
		
		$(this).find("input")
		.eq(0).each(function(dix,ele){
			if($(ele).val().length>10)
				{
				$(ele).after('<span class="err">길이 오류</span>');
				bool = false;}
			
		});
		$(this).find("input")
		.eq(1).each(function(dix,ele){
			if($(ele).val().length>10)
				{
				$(ele).after('<span class="err">길이 오류</span>');
				bool = false;}
		});
		$(this).find("input")
		.eq(2).each(function(dix,ele){
			if($(ele).val() != 
				$('#content>div>div>form').find("input").eq(1).val())
				{
				$(ele).after('<span class="err">다시 입력</span>');
				bool = false;}
		});
		$(this).find("input")
		.eq(3).each(function(dix,ele){
			if($(ele).val().length>10)
				{
				$(ele).after('<span class="err">길이 오류</span>');
				bool = false;}
			
		});
		
		
		return bool;
	});
});
</script>
</head>
<body>
	<div id="login">
		<a href="#">회원가입 </a>
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
    	<div>
    		<div>
     		<form action="./add.do" method = "POST">
	     		<h1>회원가입</h1>
				<input type = "text" name="id" placeholder ="아이디 입력"/>   		
				<input type = "password" name="pw" placeholder ="비밀번호"/>
				<input type = "password" name="re" placeholder ="비밀번호 재 입력"/>
				<input type = "text" name="name" placeholder ="이름 입력"/>
				<input type = "text" name="phone" placeholder ="전화번호 입력 xxx-xxxx-xxxx"/>  
				<br>
				<input value="가입" type ="submit" name="login">
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