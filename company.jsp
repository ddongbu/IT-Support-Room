<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title> IT 지원실 </title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID")!=null){
	userID = (String) session.getAttribute("userID");
}
%>
<nav class="navbar navbar-default">
	
	<div calss="navbor-header">
	
	<button type="button" class="navbar-toggle collapsed"
	data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
		aria-expanded="false">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		
	</div>
	
	<div class="collapse navbar-collapse id="bs-example-navbar-collapse-1">
	<a href="main.jsp"><img src="logo.JPG" alt="/" width="200px" height="45px" align="left" border="0"></a>
		<ul class="nav navbar-nav">
		<li><a href="bbs.jsp">A/S요청</a></li>
		<li class = "active"><a href="company.jsp">회사위치</a>
		<li><a href="mypage.jsp">마이페이지</a>
		</ul>
		<%
			if(userID == null){
				
		%>
		<ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			</li>
		</ul>
		<%
			}else{	
		%>
		<ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			</li>
		</ul>
		<%
			}
		%>
	</div>
</nav>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>


<script src="http://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBt6ajCsvRe7ZLJZWLwyE85oNMngXL5ZCo" ></script>

<script>
function initialize() {



  var LatLng = new google.maps.LatLng(37.447316, 126.658368);

  var mapProp = {

    center: LatLng, // 위치

    zoom:17, // 어느정도까지 세세하게 볼 것인지.

    mapTypeId:google.maps.MapTypeId.ROADMAP

  };

  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);





  var marker = new google.maps.Marker({

	position: LatLng,

	map: map,

	

  });

}

google.maps.event.addDomListener(window, 'load', initialize);

</script>

</head>

<body>
<div id="googleMap" style="width:1280px;height:520px"></div>

</body>
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
</html>