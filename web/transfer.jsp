<%-- 
    Document   : transfer
    Created on : 17.10.2016, 17:55:09
    Author     : Aknur
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer</title>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="Beans.User"/>
        <%
            out.println("<h3>"+user.getFullName()+"</h3>");
            out.println("<h3>Your balance : "+user.getBalance()+" T</h3>");
            
            ArrayList<Integer[]> cardInfo = new ArrayList<Integer[]>();
            Connection c = user.getConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT id, card_number FROM users WHERE id<>"+ user.getId() +" ");
            
            while( rs.next() ){
                Integer x[] = { Integer.parseInt(rs.getString("id")), Integer.parseInt( rs.getString("card_number") ) };
                cardInfo.add(x);
            }

        %>
        <form action="transfer" method="POST" >
            <label>Enter an amount of money : <input type="text" name="money" /></label><br/><br/>
            Card numbers : <select name="card" >
            <%
                for( int i=0; i<cardInfo.size(); i++ ){
                    out.println("<option value="+ cardInfo.get(i)[0] +" >"+ cardInfo.get(i)[1] +"</option>");
                }
            %></select>
            <input type="submit" value="Send" />
        </form>
        
    </body>
</html>
