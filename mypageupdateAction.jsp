<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userPassword = null;
		if(session.getAttribute("userPassword") != null){
			userPassword = (String)session.getAttribute("userPassword");
		}

		UserDAO userDAO = new UserDAO();
		int result = userDAO.PasswordCheck(user.getUserPassword());
		if(result == 0){
			session.setAttribute("userPassword", user.getUserPassword());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='mypageupdate.jsp'");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB 오류, 코드 확인')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
	
	
</body>
</html>