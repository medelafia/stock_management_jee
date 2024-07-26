<%@page import="java.util.Optional"%>
<%@page import="java.lang.StackWalker.Option"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Optional<Cookie> username = Arrays.stream(request.getCookies())
	.filter(c-> c.getName().equals("username"))
	.findAny() ; 
	if(username.isPresent()) {
	 	response.sendRedirect("index.jsp") ; 
	}
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <title>Log in</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		img {
			width : 500px  ; 
			height : 500px ; 
		}
	</style>
</head>
<body>
<div>
    <div class="row w-100 h-100">
   		<div class="col-sm-6 d-flex align-items-center justify-content-center bg-light">
   			<img alt="" src="./images/stock.png" >
   		</div>
   		<div class="col-sm-6 d-flex align-items-center justify-content-center flex-column">
   			<h2 class="text-capitalize">login</h2>
   			<form action="login-servlet" class="w-75" method="POST">
  			   <% if(request.getParameter("error") != null ){ %>
      				<div class="alert alert-danger w-75 my-3 alert-dismissible">
      					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
           				<strong>error!</strong><%=request.getParameter("error") %>
       				</div>
       			<% } ;  %>
   				<div class="form-group my-2 w-100">
   					<label for="username">username</label>
   					<input type="text" placeholder="enter your username" class="form-control w-100" name="username"/>
   				</div>
    			<div class="form-group my-2">
    				<label for="password">password</label>
   					<input type="password" placeholder="enter your password" class="form-control w-100" name="password"/>
   				</div>
   				<button class="btn btn-dark mt-3 w-100"> login </button>
   			</form>
   		</div>
   	</div>

</div>

<script>
</script>
</body>
</html>
