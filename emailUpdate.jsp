<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%
   
   String userID = null;
   if(session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
   }
   
   if(userID == null) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요')");
      script.println("location.href = 'index.jsp'");
      script.println("</script>");
   } 
   

      UserDAO userDAO = new UserDAO();   
       String a = request.getParameter("chemail1");
       String b = request.getParameter("chemail2");
       if ( a.equals(b) ){ 
         int result = userDAO.emailupdate(userID, b);
         if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("history.back()");
            script.println("</script>");
         } else {
         
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'mypageupdate.jsp'");
            script.println("</script>"); }
       }
        else {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 일치하지 않습니다')");
         script.println("location.href = 'mypageupdate.jsp'");
         script.println("</script>");
      } 
       
      
   
      
      
   %>
</body>
</html>