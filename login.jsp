<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/login.css">
<title>Insert title here</title>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="JoinStyle.css" rel="stylesheet" type="text/css">
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
			<a href="main.jsp"><img src="logo.JPG" alt="/" width="200px" height="45px" align="center" border="0"></a>
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
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 사이트 박스 시작 -->
<section class="site-box min-height-100vh flex flex-column">
  <main class="main-box flex-grow-1 visible-md-up">
    <section class="main-box-section con">
      <!-- 로그인 페이지 시작 -->
       <form class="flex flex-jc-c flex-ai-c" name="form" onsubmit="check(this); return false;" action="loginAction.jsp" method="POST">
        <div class="form">
	<div class="form-toggle"></div>
	<div class="form-panel one">
		<div class="form-header">
			<h1 style="color: #3b71a1">Login</h1>
		</div>
		<div class="form-content">
		<label for="id">ID</label>
			 <form class="flex flex-jc-c flex-ai-c" name="form" onsubmit="check(this); return false;" action="loginAction.jsp" method="POST">
			 <input type="hidden" name="loginPwReal">
				<div class="form-group">
					<input class="idInput" type="text" name="userID" maxlength="50" placeholder="ID 입력">
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					 <input type="password" name="userPassword" maxlength="50" placeholder="PW 입력">
				</div>
				<div class="form-group">
						<button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> 로그인</button>
   					 <button class="btn btn-modify" type="button" onclick="location.href='join.jsp'"><i class="fas fa-undo"></i> 회원가입</button>
    				<button class="btn btn-back" type="button" onclick="location.href='main.jsp'"><i class="fas fa-undo"></i> 뒤로가기</button>
				</div>
				</form>
		</div>
	</div>
</div>
		
      <!-- 로그인 페이지 끝 -->
    </section>
  </main>
</section>
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