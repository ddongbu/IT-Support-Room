<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 

<%@ page import="java.sql.*" %> 

<!DOCTYPE html>

<html>

<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">


<% 
request.setCharacterEncoding("euc-kr"); 
String realFolder = ""; 
String filename1 = ""; 
int maxSize = 1024*1024*5; 
String encType = "euc-kr"; 
String savefile = "img"; 
ServletContext scontext = getServletContext(); 
realFolder = scontext.getRealPath(savefile); 
 
try{ 
MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
Enumeration<?> files = multi.getFileNames(); 
String file1 = (String)files.nextElement(); 
filename1 = multi.getFilesystemName(file1); 
} catch(Exception e) { 
e.printStackTrace(); 
} 
String fullpath = realFolder + "\\" + filename1; 
%> 

<title> 글 보기 </title>


</head>

<body>

	<%
String userID = null;
if(session.getAttribute("userID")!=null){
	userID = (String) session.getAttribute("userID");
}
		int bbsID = 0;
		int commentID = 0;
		int commentAvailable = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
				<a href="main.jsp"><img src="logo.JPG" alt="/" width="200px" height="45px" align="center" border="0"></a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="bbs.jsp">A/S요청</a></li>
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

	<!-- 게시판 -->

	<div class="container">

		<div class="row">
		
			<form method="post" action="writeAction.jsp" >

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;"> 요청 내용 </th>

						</tr>

					</thead>

					<tbody>
					

						<tr>

							<td style="width: 20%;"> 위치 </td>

							<td style="text-align: left;" colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>

						</tr>

						<tr>

							<td>신청인</td>	

							<td style="text-align: left;" colspan="2"><%= bbs.getUserID() %></td>

						</tr>

						<tr>

							<td>신청일</td>	

							<td style="text-align: left;" colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"

							+ bbs.getBbsDate().substring(14, 16) + "분"%></td>

						</tr>
					
						<tr>

							<td>내용</td>
							

							<td style="text-align: left;"colspan="2" style="min-height: 200px;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>

						</tr>
				
						
								</tbody>
								
				</table>
				<%
				//글작성자 본인일시  수정 삭제 가능 
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
						<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
						
						<a href = "bbs.jsp" class="btn btn-primary">목록</a>
				<%
					}
				%>
			</form>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>