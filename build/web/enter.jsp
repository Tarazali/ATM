<%-- 
    Document   : enter
    Created on : 17.10.2016, 15:44:18
    Author     : Aknur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Beans.User" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            String fullName = request.getParameter("full_name");
            String pin = request.getParameter("pin");

            if( user.enter(fullName, pin) ){
                out.println("<h3>"+ user.getFullName() +"</h3>");
                out.println("<a href=\"operations.jsp\" >MAKE OPERATIONS</a>");
                out.println("<a href=\"exit\" >EXIT</a>");
            }else{
                response.sendRedirect("index.html");
            }
        
        %>
    </body>
</html>
