<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">


<title>IT지원실</title>
<style type="text/css">
	a, a:hover{
		color: :#000000;
		text-decoration: none;
	}
	* {margin:0;padding:0;}
	.section {}
	.section input[id*="slide"] {display:none;}

	.section .slide-wrap {max-width:1200px;margin:0 auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .left {left:30px;background:url('leftarrow.png') center center / 100% no-repeat;}
	.section .slidelist .right {right:30px;background:url('rightarrow.png') center center / 100% no-repeat;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:50%;transform:translate(-50%,-50%);line-height:1.6;text-align:center;}
	
	.section .slidelist .textbox h3 {font-size:50px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:24px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}

	.section input[id="slide01"]:checked ~ .slide-wrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slide-wrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slide-wrap .slidelist > li {transform:translateX(-200%);}

	.section input[id="slide01"]:checked ~ .slide-wrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide01"]:checked ~ .slide-wrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide02"]:checked ~ .slide-wrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide02"]:checked ~ .slide-wrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
	.section input[id="slide03"]:checked ~ .slide-wrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);transition-delay:.2s;}
	.section input[id="slide03"]:checked ~ .slide-wrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}
</style>
</head>
<body>
	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
              <a href="main.jsp"><img src="logo.JPG" alt="/" width="200px" height="45px" align="center" border="0"></a>
            </li>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="bbs.jsp">A/S요청</a></li>
				<li><a href="company.jsp">회사위치</a>
				<li><a href="mypage.jsp">마이페이지</a>
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
	<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slide-wrap">
		<ul class="slidelist">
			<li>
				<a>
					<label for="slide03" class="left"></label>
					<div class="textbox">
						<h3 style="color : black;">A/S 요청을 할수 있습니다.</h3>
						<p style="color : black;">각 호관마다 근로학생, 전문적인 유지보수기사님이 계십니다.</p>
					</div>
					<img src="index1.JPG">
					<label for="slide02" class="right"></label>
				</a>
			</li>
			<li>
				<a>
					<label for="slide01" class="left"></label>
					<div class="textbox">
						<h3 style="color : black;">IT지원실 위치를 알수있습니다.</h3>
						<p style="color : black;">맵 API를 통해 위치를 알 수 있습니다.</p>
					</div>
					<img src="index2.JPG">
					<label for="slide03" class="right"></label>
				</a>
			</li>
			<li>
				<a>
					<label for="slide02" class="left"></label>
					<div class="textbox">
						<h3 style="color : black;">마이페이지에서 회원 정보를 수정하세요</h3>
						<p style="color : black;">회원정보 수정을 도와드립니다</p>
					</div>
					<img src="index3.JPG">
					<label for="slide01" class="right"></label>
				</a>
			</li>
		</ul>
	</div>
</div>

	 <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © INHA TECHNICAL COLLEGE</span><br>
            <span>22212 인천광역시 미추홀구 인하로100 인하공업전문대학 TEL. 032)870-2662</span><br>
            <span>Lee SangMin(sangmin5848@naver.com)</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->
      
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>