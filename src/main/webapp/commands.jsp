<%@page import="java.awt.PageAttributes.OrientationRequestedType"%>
<%@page import="com.med.gestion_de_stock_jee.entities.Client"%>
<%@page import="com.med.gestion_de_stock_jee.entities.Commande"%>
<%@page import="com.med.gestion_de_stock_jee.repositories.RepoClient"%>
<%@page import="com.med.gestion_de_stock_jee.repositories.RepoCommande"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import = "java.io.*" %>
<%@ page import ="java.util.*" %>
<%
    RepoCommande repoCommande = new RepoCommande() ; 
	RepoClient repoClient = new RepoClient() ; 
	List<Commande> commandes = repoCommande.trouverToutesCommandes() ; 
	List<Client> clients = repoClient.trouverToutesClients() ; 
	Commande commande = null ; 
	if(request.getParameter("edit") != null) {
		commande = repoCommande.trouverCommandeAvecId(Integer.parseInt(request.getParameter("commandId"))) ; 
	}
	Optional<Cookie> username = Arrays.stream(request.getCookies())
	.filter(c-> c.getName().equals("username"))
	.findAny() ;
	if(username.isEmpty()) {
	 	response.sendRedirect("login.jsp") ; 
	 	return ; 
	}
%>
<html>
  <head>
    <title>commands management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="d-flex align-items-center justify-content-center flex-column bg-dark">
  	<% if(request.getParameter("error") != null ){ %>
  		<div class="alert alert-danger w-75 my-3 alert-dismissible">
  			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        	<strong>error!</strong><%=request.getParameter("error") %>
    	</div>
    <% } ;  %>
    <% if(request.getParameter("message") != null){ %>
    	<div class="alert alert-success w-75 my-3 alert-dismissible">
  			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        	<strong>success! </strong> <%=request.getParameter("message") %>
    	</div>
    <% };  %>

    <h1 class="text-center text-light my-3">command management</h1>
    <form action=<%= (request.getParameter("edit") != null ) ? "edit-command-servlet?commandId="+request.getParameter("commandId") : "add-command-servlet" %> method="post" class="w-75 my-2">
    		<% if(request.getParameter("edit") != null) {%>
    			<div class="form-group my-3">
    				<input type="text" class="form-control" name="id" value=<%= request.getParameter("commandId")%> disabled>
    			</div>
    		<%}; %>
            <div class="form-group my-3">
                <select class="form-select" name="status">
                    <option value="pending payment" <%if(request.getParameter("edit") != null){if(commande.getEtat() == "pending payment"){ %>selected<%}} %>>pending payment</option>
                    <option value="failed" <%if(request.getParameter("edit") != null){if(commande.getEtat() == "failed"){ %>selected<%}} %>>failed</option>
                    <option value="on hold" <%if(request.getParameter("edit") != null){if(commande.getEtat() == "on hold"){ %>selected<%}} %>>on hold</option>
                </select>
            </div>
            <div class="form-group my-3">
                <input type="date" class="form-control" placeholder="command date" name="date" value=<%= (request.getParameter("edit") != null) ? commande.getDate() : ""%> <%if(request.getParameter("edit") != null){ %>disabled<%}%>> 
            </div>
            <div class="form-group my-3">
            	<select class="form-select" name="clientId" <%if(request.getParameter("edit") != null){%> disabled <% }%> >
            		<%for(Client client : clients){%>
            			<option value=<%=client.getIdClient() %> <%if(request.getParameter("edit") != null){if(commande.getIdClient() == client.getIdClient()){ %>selected<%}} %> >
            				<%=client.getIdClient() %>
            			</option>
            		<%};%>
            	</select>
            </div>
            <button type="submit" class="btn btn-primary my-3 w-100"><%=request.getParameter("edit")!=null ? "edit" : "add"%> command</button>
    </form>
    <%if( request.getParameter("edit") != null ){ %>
    	<div class="my-2">
    		<h4 class="text-white">command products list</h4>
    		<table class="table table-dark">
    			<thead>
    				<tr>
    					<td>product id</td>
    					<td>product name</td>
    					<td>qte</td>
    				</tr> 
    			</thead>
    		</table>
    	</div>
    <%} %>
    <table class="table w-75 my-3 text-light table-dark">
            <thead>
                <tr>
                    <th>command id</th>
                    <th>command status</th>
                    <th>command date</th>
                    <th>client id</th>
                    <th>actions</th>
                </tr>
            </thead>
            <tbody>
                <%if(commandes.size() == 0){ %>
                    <tr>
                        <td colspan="5">no items</td>
                    </tr>
                <% } %>
				<% for(Commande commande1 : commandes){ %>
				<tr>
					<td><%= commande1.getIdCommande() %></td>
					<td><%= commande1.getEtat() %></td>
					<td><%= commande1.getDate() %></td>
					<td><%= commande1.getIdClient() %></td>
					<td>
					    <a class="btn mx-1 btn-danger text-white" href=<%="/delete-command-servlet?commandId="+commande1.getIdCommande()%>>
					        <i class="fa-solid fa-trash"></i>
					    </a>
					    <a class="btn btn-primary mx-1 text-white" href=<%="/commands.jsp?commandId="+commande1.getIdCommande()+"&edit="%>>
					        <i class="fa-solid fa-pen-to-square"></i>
					    </a>
					</td>
				</tr>
				<%}%>
            </tbody>
    </table>
  </body>
</html>
