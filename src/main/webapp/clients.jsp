<%@page import="java.util.Arrays"%>
<%@page import="java.util.Optional"%>
<%@page import="com.med.gestion_de_stock_jee.entities.Client"%>
<%@page import="java.util.List"%>
<%@page import="com.med.gestion_de_stock_jee.repositories.RepoClient"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>


<%
    RepoClient repoClient = new RepoClient() ; 
	List<Client> clients = repoClient.trouverToutesClients() ; 
	Optional<Cookie> username = Arrays.stream(request.getCookies())
	.filter(c-> c.getName().equals("username"))
	.findAny() ;
	if(username.isEmpty()) {
	 	response.sendRedirect("login.jsp") ; 
	 	return ; 
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    <title>client management</title>
</head>
<body  class="d-flex align-items-center justify-content-center flex-column bg-dark w-100">
    <h1 class="text-center text-light my-3">product management</h1>
	<form action="Addclient.java" method="post" class="w-75 my-2">
    	<div class="form-group w-100" >
        	<label for="nom">Nom</label>
        	<input type="text" name="firstName" id="nom"  class="form-control w-100" placeholder="enter the first name">
    	</div>
    	<div  class="form-group my-3 w-100" >
        	<label for="prenom">Prenom</label>
        	<input type="text" name="lastName"  id="prenom" class="form-control w-100" placeholder="enter the last name">
    	</div>
	
    	<div  class="form-group my-3 w-100">
   		    <label for="phone">Tel</label>
        	<input type="text" name="phone" id="phone" class="form-control w-100" placeholder="enter the phone number">
    	</div>
    	<div  class="form-group my-3 w-100">
        	<label for="email">Email</label>
        	<input type="text" name="email" id="email" class="form-control w-100" placeholder="enter the email">
    	</div>
    	<div class="form-group my-3  w-100">
        	<label id="addr">Adresse</label></br>
        	<input type="text" name="adress" id="addr" class="form-control w-100" placeholder="enter the address">
    	</div>
    	<div  class="form-group mt-3 w-100 d-flex justify-content-end">
        	<input type="reset" value="Clear Form" class="btn btn-danger me-1 ">
        	<input type="submit" class="btn btn-success ms-1"
               name="submit" value="Add Client">
    	</div>
	</form>

	<table class="table  w-75 my-3 text-light table-dark">
		<thead>
			<tr>
        		<th>ID</th>
        		<th>Nom</th>
        		<th>Prenom</th>
        		<th>Email</th>
        		<th>Til</th>
        		<th>Adresse</th>
        		<th>Action</th>
    		</tr>
		</thead>
		
    	<tbody>
    	<%if(clients.size() == 0) {%>
    		<tr><td colspan="7">table vide</td></tr>
    	<%} %>
    	<% for(Client client : clients) {%>
    	<tr>
        	<td><%=client.getIdClient()%></td>
        	<td><%=client.getNom() %></td>
        	<td><%= client.getPrenom() %></td>
        	<td><%=client.getEmail() %></td>
        	<td><%=client.getTel() %></td>
        	<td><%=client.getAddresse() %></td>
        	<td>
        		
            	<a class="btn" href=<%="/delete-client-servlet?idClient="+client.getIdClient()%>>
            		<i id="delete" class="fa-solid fa-trash text-danger"></i>
            	</a>	
            	<a class="btn" href=<%= "/modifierClients.jsp?idClient="+client.getIdClient()%> >
                	<i  id="edit" class="fa-solid fa-pen text-success"></i>Edit
                </a>
            </td>

    	</tr>
	 	<% } %>
    	</tbody>
	</table>

</body>
</html>