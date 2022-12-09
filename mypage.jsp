<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="user.UserDAO"%>
     <%@page import="user.User"%>
     <%@page import="bbs.Bbs"%>
     <%@page import="bbs.BbsDAO"%>
     <%@ page import="java.io.PrintWriter" %>
     <%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="ko">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="generator" content="Hugo 0.104.2">
    <title>IT 지원실</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
<style type="text/css">
	a, a:hover{
		color: :#000000;
		text-decoration: none;
	}
</style>
  </head>
  <body class="bg-light">
  <%
	 String userID = null;
         
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		
	}
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
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
			<a href="main.jsp"><img src="logo.JPG" alt="/" width="200px" height="45px" align="center" border="0"></a>
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
<div class="container">
<div class="row"style="margin: 50px; padding: 0;text-align:center">
<div class="col-12" >
       <div class="card card-margin">
   		<div style="margin: 50px; padding: 0;">

    <div class="py-5 text-center">
    
      
      <h2>내 정보</h2><br><br><br>
      <div class="card card-margin" style="background-color:#FCFCFC"><br><br>
    
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="firstName" class="form-label">아이디    :    <%=userID %></label>
            
              <%-- <input type="text" class="form-control" id="firstName" placeholder="<%=userID %>" value="" required> --%>
              <div class="invalid-feedback">
              </div>
            </div>

         

            <div class="col-12">
              <label for="email" class="form-label">이름 : <%=userDAO.getName(userID) %></label>
              <%-- <label for="email" class="form-label"><%=userDAO.getName(userID) %></label> --%>
    <%--           <input type="email" class="form-control" id="email" placeholder="<%=userDAO.getName(userID) %>"> --%>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">직급 : <%=userDAO.getRank(userID) %></label>
             <%--  <input type="text" class="form-control" id="address" value="<%=userDAO.getGender(userID) %>" required> --%>
              <div class="invalid-feedback">
              </div>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label">이메일 : <%=userDAO.getEmail(userID) %> </label><br><br>
             <%--  <input type="text" class="form-control" id="address2" placeholder="<%=userDAO.getAge(userID) %>"> --%>
            </div>
            </div>
            </form>
            </div>
            <br><br><br>
            <h2>회원정보 수정</h2><br><br><br>
            <form class="col-12" action="mypagecheck.jsp" style="position: absolute; top: 80%; left: 46%;">
             <input type="submit" class="btn btn-primary pull-right" name="chpasswordbtn" value="회원정보 수정" style="background-color:black; border:0;display:inline-block; width:9em;height:3em ">
            </form>
            
            
            
            </div>
            </div>
       
</div>       
          
            </div>
            </div></div>
             <div class="container">
   <div class="row"style="margin: 50px; padding: 0;">
        <div class="col-12">
            <div class="card card-margin">
            <br><br>
                <div class="card-body">
                    <div class="row search-body">
                        <div class="col-lg-12">
                            <div class="search-result">
                                <div class="result-header">
                                    <div class="row">
                                        
                                        <div class="col-lg-6">
                                            <div class="result-actions">
                                                
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
             <div class="result-body">
      <div class="table-responsive">
      <h2 style="text-align:center">내가 쓴 글</h2><br><br><br>
          <table class="table widget-26">
          <thead>
   					<tr>
   						<th style="background-color:#eeeeee; text-align:center;">게시판ID</th>
   						<th style="background-color:#eeeeee; text-align:center;">제목</th>
   						<th style="background-color:#eeeeee; text-align:center;">작성자</th>
   						<th style="background-color:#eeeeee; text-align:center;">작성일</th>
   					</tr>
   				</thead>
          <%
   					Bbs Bbs = new Bbs();
          BbsDAO bbsDAO = new BbsDAO();
          ArrayList<Bbs> list = bbsDAO.getMyList(pageNumber, userID);
   					for(int i=0; i < list.size() ; i++) {
   						
   					   				
   				%>
   				
              <tbody style="text-align:center">
                  <tr>                      
                      <td>
                          <div class="widget-26-job-info">
                              <a href="#" style="color : black"><%=list.get(i).getBbsID() %></a>
                              
                          </div>
                      </td>
                              <td style="color : black"><div class="widget-26-job-info" ><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>" style="color : black"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></div></td>
                         <td>
                          <div class="widget-26-job-salary" ><%= list.get(i).getUserID() %></div>
                      </td>
                      <td>
                          <div class="widget-26-job-category bg-soft-base">
                              <%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"  %>
                          </div>
                      </td>
                       <%
   					}
   				%>
                      
                  </tr>
                   </tbody>
          </table>
      </div>
  </div>
  
   </div>
   <%
   				if (pageNumber != 1) {
			%>
			<a href="afterloginmypage.jsp?pageNumber=<%= pageNumber -1 %>" class = "btn btn-success btn-arraw-left" style="background-color:gray; border: 0;">이전</a>
			<%
   				} if(bbsDAO.nextPage(pageNumber +1)) {
			%>
			<a href="afterloginmypage.jsp?pageNumber=<%= pageNumber +1 %>" class = "btn btn-success btn-arraw-left" style="background-color:gray; border: 0;">다음</a>
			<%
   				}
			%>
   			<a href = "write.jsp" class="btn btn-primary pull-right" style="background-color:black; border:0">글쓰기</a>
    </div>
                  </div>
                    </div>
                 
                </div>
                
            </div>
            
        </div>
        
        
    </div>

           

           


    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
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
