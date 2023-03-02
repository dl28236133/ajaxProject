<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link  rel="stylesheet" href="css/setting.css" type="text/css">
    <style rel ="stylesheet" type="text/css">
        .board_write_wrap {
        	margin-top:5%;
        	border: 1px solid #000;
        	margin-left:10%;
        	width: 80%;
        }
         
        .board_write .title {
		    padding: 15px;
		    border-bottom: 1px solid #000;
		}
		.board_write .title dl {
		    font-size: 0;
		}
		
		.board_write .info dl {
		    display: inline-block;
		    width: 50%;
		    vertical-align: middle;
		}
		
		.board_write .title dt,
		.board_write .title dd{
		    display: inline-block;
		    vertical-align: middle;
		    font-size: 1.4rem;
		}
		
		.board_write .title dt{
		    width: 100px;
		}
		
		.board_write .title dd {
		    width: calc(100% - 100px);
		}
		
		.board_write .title input[type="text"]{
		    padding: 10px;
		    box-sizing: border-box;
		}
		
		.board_write .title input[type="text"] {
		    width: 80%;
		}
		
		.board_write .content {
			border-top: 1px dashed #ddd;
		    border-bottom: 1px solid #000;
		}
		
		.board_write .content textarea {
		    display: block;
		    width: 100%;
		    height: 300px;
		    padding: 15px;
		    box-sizing: border-box;
		    border: 0;
		    resize: vertical;
		}
		
		.bt_wrap {
		    margin-top: 30px;
		    text-align: center;
		    font-size: 0;
		}
		
		.bt_wrap button {
		    display: inline-block;
		    min-width: 80px;
		    margin-left: 10px;
		    padding: 10px;
		    border: 1px solid #000;
		    border-radius: 2px;
		    font-size: 1.4rem;
		}
		
		.bt_wrap button:first-child {
		    margin-left: 0;
		}
		
		.bt_wrap button.on {
		    background: #000;
		    color: #fff;
		}
    </style>
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
    	<div class="board_write_wrap">
    		<form action="./write.do" method = "POST">
	            <div class="board_write">
	                <div class="title">
	                    <dl>
	                        <dt>제목</dt>
	                        <dd><input type="text" name = "title" placeholder="제목 입력"></dd>
	                    </dl>
	                </div>
	                <div class="content">
	                    <textarea name = "content" placeholder="내용 입력"></textarea>
	                </div>
	            </div>
	            <div class="bt_wrap">
	                <button type="submit" class = 'on'>작성</button>
	                <button type="button"><a href ="notice.do">취소</a></button>
	            </div>
	         </form>
        </div>
    </div>
    <div id="footer">
        <address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
       	Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
    </div>
</body>
</html>