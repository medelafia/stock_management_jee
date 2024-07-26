<%@page import="com.med.gestion_de_stock_jee.entities.Client"%>
<%@page import="com.med.gestion_de_stock_jee.repositories.RepoClient"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title> Modifier Client</title>
</head>
<body>
<%
	RepoClient repoClient = new RepoClient() ; 
	Client client = repoClient.trouverClientAvecId(Integer.parseInt(request.getParameter("idClient"))) ; 
%>
<form action="edit-client-servlet" method="post">
    <input hidden name="idClient" value="<%=client.getIdClient() %>">
    <br>Nom   : <input type="text" name="firstName" value="<%=client.getNom()%>"> <br>
    <br>Prenom   : <input type="text" name="lastName" value="<%=client.getPrenom()%>"> <br>
    <br>Email   : <input type="text" name="email" value="<%=client.getEmail()%>"> <br>
    <br>Telephone   : <input type="text" name="phone" value="<%=client.getTel() %>"> <br>
    <br>Adresse   : <input type="text" name="adress" value="<%=client.getAddresse() %>"> <br>

    <br><br><input type="submit" value="Modifier">
</form>
</body>
</html>