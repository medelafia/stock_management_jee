<%@page import="com.med.gestion_de_stock_jee.entities.Fournisseur"%>
<%@page import="com.med.gestion_de_stock_jee.repositories.RepoFournisseur"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import = "java.io.*" %>
<%@ page import ="com.med.gestion_de_stock_jee.repositories.RepoProduit" %>
<%@ page import ="com.med.gestion_de_stock_jee.entities.Produit" %>
<%@ page import ="java.util.*" %>
<%
    RepoProduit repoProduit = new RepoProduit() ;
    RepoFournisseur repoFournisseur = new RepoFournisseur() ; 
    List<Produit> products = repoProduit.trouverToutesProduits() ;
    List<Fournisseur> fournisseurs = repoFournisseur.trouverToutesFournisseurs() ;
    Produit product = null ; 
    if(request.getParameter("edit") != null) {
    	product = repoProduit.getProduitAvecId(Integer.parseInt(request.getParameter("productId"))) ; 
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
    <title>product management</title>
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
    	
    <h1 class="text-center text-light my-3">product management</h1>
    <form action=<%= (request.getParameter("edit") != null ) ? "edit-product-servlet?productId="+request.getParameter("productId") : "add-product-servlet" %> method="post" class="w-75 my-2">
    		<% if(request.getParameter("edit") != null) {%>
    			<div class="form-group my-3">
    				<input type="text" class="form-control" name="id" value=<%= request.getParameter("productId")%> disabled>
    			</div>
    		<%}; %>
            <div class="form-group my-3">
                <input type="text" class="form-control" placeholder="product name" name="name" value=<%= (request.getParameter("edit")!=null) ? product.getNom() : "" %> >
            </div>
            <div class="form-group my-3">
                <input type="text" class="form-control" placeholder="product description" name="description" value=<%= (request.getParameter("edit")!=null) ? product.getDescription() : "" %>>
            </div>
            <div class="form-group my-3">
                <input type="text" class="form-control" placeholder="product price" name="price" value=<%= (request.getParameter("edit")!=null) ? product.getPrix() : "" %>>
            </div>
            <div class="form-group my-3">
                <input type="number" class="form-control" placeholder="product count" name="count" value=<%= (request.getParameter("edit")!=null) ? product.getQte() : "" %>>
            </div>
            <div class="form-group my-3">
            	<select class="form-select" name="provider">
            		<%for(Fournisseur f : fournisseurs){%>
            			<option value=<%=f.getIdFournisseur() %> >
            				<%=f.getIdFournisseur() %>
            			</option>
            		<%};%>
            	</select>
            </div>
            <button type="submit" class="btn btn-primary my-3 w-100">add product</button>
    </form>
    <table class="table w-75 my-3 text-light table-dark">
            <thead>
                <tr>
                    <th>product id</th>
                    <th>product name</th>
                    <th>product description</th>
                    <th>product price</th>
                    <th>product count</th>
                    <th>product provider</th>
                    <th>actions</th>
                </tr>
            </thead>
            <tbody>
				<% for(Produit product1 : products){ %>
				<tr>
					<td><%= product1.getIdP() %></td>
					<td><%= product1.getNom() %></td>
					<td><%= product1.getDescription() %></td>
					<td><%= product1.getPrix() %></td>
					<td><%= product1.getQte() %></td>
					<td><%= product1.getIdFournisseur() %></td>
					<td class="d-flex">
					    <a class="btn mx-1 btn-danger text-white" href=<%="/delete-product-servlet?productId="+product1.getIdP()%>>
					        <i class="fa-solid fa-trash"></i>
					    </a>
					    <a class="btn btn-primary mx-1 text-white" href=<%="/products.jsp?productId="+product1.getIdP()+"&edit="%>>
					        <i class="fa-solid fa-pen-to-square"></i>
					    </a>
					</td>
				</tr>
				<%}%>
            </tbody>
    </table>
  </body>
</html>
