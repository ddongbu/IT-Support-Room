<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="user.UserDAO"%>
     <%@page import="user.User"%>
     <%@page import="user.UserDAO"%>
     <%@page import="bbs.Bbs"%>
     <%@page import="bbs.BbsDAO"%>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>IT지원실</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
<body>
<%
	 String userID = null;
         
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	 User user = new User(); 
        UserDAO userDAO = new UserDAO(); 
        
        %>
     	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
				<span class="icon-bar"></span>
				<!-- 게시판 아이콘 작대기(-) 하나를 의미 -->
			</button>
			<a class="navbar-brand" href="main.jsp"><b><span style="color:#337AB7">IT 지원실</span></b></a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="bbs.jsp">A/S요청</a></li>
				<li><a href="company.jsp">회사위치</a>
				<li class="active"><a href="mypage.jsp">마이페이지</a>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav> 
<div class="card card-margin">
         <div style="margin: 50px;padding: 0;display: flex;justify-content: center;">
    <div class="py-5 text-center">
      <h2>비밀번호 확인</h2><br><br><br>
      <div class="card card-margin" style="background-color:#FCFCFC">
    	<form class="col-12" action="mypageupdateAction.jsp">
            <input style="display:inline-block;width:25em" type = "password" class="form-control" id="userPassword" name="userPassword" ">
            <input type = "submit" class="btn btn-primary pull-right"    name="chpasswordbtn" value="비밀번호 확인" style="background-color:black; border:0;display:inline-block; width:9em;height:3em">
            </form>
     </div>
      <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
</body>
</html>