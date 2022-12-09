<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>IT지원실</title>
</head>
<body>
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
				<li><a href="mypage.jsp">마이페이지</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="join_Action.jsp" method="post">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userRank" autocomplete="off" value="학생" checked>학생
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userRank" autocomplete="off" value="교수">교수
							</label>
							<label class="btn btn-primary second">
								<input type="radio" name="userRank" autocomplete="off" value="교직원">교직원
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
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
</body>
</html>