<%-- 
    Document   : withdraw
    Created on : 17.10.2016, 17:15:41
    Author     : Aknur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw</title>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="Beans.User"/>
        <%
            out.println("<h3>"+user.getFullName()+"</h3>");
            out.println("<h3>Your balance : "+user.getBalance()+" T</h3>");
        %>
        <form action="withdraw" method="post" >
            <label>Enter an amount of money : <input type="text" name="money" /></label><br/><br/>
            <input type="submit" value="Get" />
        </form>
        <%
            out.println("<a href=\"operations.jsp\" ><button>BACK</button></a>");
        %>
    </body>
</html>
