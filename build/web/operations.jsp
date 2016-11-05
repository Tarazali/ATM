<%-- 
    Document   : operations
    Created on : 17.10.2016, 16:30:44
    Author     : Aknur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operations</title>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="Beans.User"/>
        <% out.println("<h3>"+user.getFullName()+"</h3>"); %>
        <a href="balance.jsp" ><button>BALANCE</button></a><br/><br/>
        <a href="withdraw.jsp" ><button>WITHDRAW</button></a><br/><br/>
        <a href="transfer.jsp" ><button>TRANSFER</button></a><br/><br/>
        <a href="exit" ><button>EXIT</button></a><br/><br/>        
    </body>
</html>
