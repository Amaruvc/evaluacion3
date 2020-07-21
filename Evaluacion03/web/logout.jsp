<%-- 
    Document   : logout
    Created on : Jul 20, 2020, 7:56:03 PM
    Author     : rodrigo
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

<%
    session.setAttribute("usuario", null);
    response.sendRedirect("index.jsp");
%>