<%@page import="java.util.NoSuchElementException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Optional"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
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
  <title>stock management</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" >
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
        height : 100vh ;
    }
    .block-icon {
    	font-size: 3rem ; 
    }
  </style>
</head>
<body>
	<div class="bg-dark">
		<div class="container d-flex align-items-center justify-content-between py-2"> 
			<h3 class="text-white text-capitalize">stock management</h3>
			<form action="logout" method="POST">
				<button class="btn"><i class="fa-solid fa-right-from-bracket text-danger"></i></button>
			</form>
		</div>
	</div>
	<div class="p-5">
		<div class="my-5 h3 text-capitalize">
			welcome back <span class="text-success"><%=username.get().getValue()%></span>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-6 col-lg-4 p-3">
				<div class="container rounded border d-flex align-items-center justify-content-center flex-column py-5">
					<i class="fa-brands fa-product-hunt block-icon text-primary"></i>
					<h4 class="mt-3">command management</h4>
					<a href="commands.jsp" class="btn"><i class="fa-solid fa-arrow-right text-primary"></i></a>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-4 p-3">
				<div class="container rounded border d-flex align-items-center justify-content-center flex-column py-5">
					<i class="fa-solid fa-cart-shopping block-icon text-success"></i>
					<h4 class="mt-3">product management</h4>
					<a href="products.jsp" class="btn" ><i class="fa-solid fa-arrow-right text-success"></i></a>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-4 p-3">
				<div class="container rounded border d-flex align-items-center justify-content-center flex-column py-5">
					<i class="fa-solid fa-users block-icon text-info"></i>
					<h4 class="mt-3">client management</h4>
					<a href="clients.jsp" class="btn" ><i class="fa-solid fa-arrow-right text-info"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>