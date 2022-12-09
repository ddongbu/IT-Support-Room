<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="user.UserDAO"%>
     <%@page import="user.User"%>
     <%@page import="user.UserDAO"%>
     <%@page import="bbs.Bbs"%>
     <%@page import="bbs.BbsDAO"%>
     <%@ page import="java.util.ArrayList" %>
        <%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="css/bootstrap.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>IT지원실</title>

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
         <div style="margin: 50px; padding: 0;">
    <div class="py-5 text-center">
      <h2>내 정보</h2><br><br><br>
      <div class="card card-margin" style="background-color:#FCFCFC"><br><br>
    
        <form class="needs-validation" novalidate>
        </form>
          <div class="row g-3">
            <div class="col-12">

            <div class="col-12">
            <form class="col-12" action="PasswordUpdate.jsp">
            <input style="display:inline-block;width:25em"class="form-control" id="chpassword1" name="chpassword1" >
            <input style="display:inline-block;width:25em"class="form-control" id="chpassword2" name="chpassword2" >
            <input type = "submit" class="btn btn-primary pull-right"    name="chpasswordbtn" value="비밀번호 변경" style="background-color:black; border:0;display:inline-block; width:9em;height:3em">
            </form>
              </div>
              <br><br>
              
            <div class="col-12">
               <form class="col-12" action="nameUpdate.jsp">
            <input style="display:inline-block;width:25em"class="form-control" id="chname1" name="chname1"  placeholder="<%=userDAO.getName(userID) %>">
            <input style="display:inline-block;width:25em"class="form-control" id="chname2" name="chname2" placeholder="<%=userDAO.getName(userID) %>" >
            <input type = "submit" class="btn btn-primary pull-right"    name="chpasswordbtn" value="이름 변경" style="background-color:black; border:0;display:inline-block; width:9em;height:3em">
            </form>
            </div>
            
			<br><br>
            <div class="col-12">
              <form class="col-12" action="RankUpdate.jsp">
            <input style="display:inline-block;width:25em"class="form-control" id="chRank1" name="chRank1"   placeholder="<%=userDAO.getRank(userID) %>">
             <input style="display:inline-block;width:25em"class="form-control" id="chRank2" name="chRank2"  placeholder="<%=userDAO.getRank(userID) %>">
            <input type = "submit" class="btn btn-primary pull-right"    name="chpasswordbtn" value="직급 변경" style="background-color:black; border:0;display:inline-block; width:9em;height:3em">
            </form>
            </div>
			<br><br>
            <div class="col-12">
              <form class="col-12" action="emailUpdate.jsp">
            <input style="display:inline-block;width:25em"class="form-control" id="chemail1" name="chemail1"  placeholder="<%=userDAO.getEmail(userID) %>">
             <input style="display:inline-block;width:25em"class="form-control" id="chemail2" name="chemail2"  placeholder="<%=userDAO.getEmail(userID) %>">
            <input type = "submit" class="btn btn-primary pull-right"    name="chpasswordbtn" value="이메일 변경" style="background-color:black; border:0;display:inline-block; width:9em;height:3em">
            </form>
            </div>
			<br><br>
    
      <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
</body>
</html>