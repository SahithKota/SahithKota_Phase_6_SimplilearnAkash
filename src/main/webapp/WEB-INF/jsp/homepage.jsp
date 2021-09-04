<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Medicare</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Medicare</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/login">User Login</a></li>
					<li><a href="/register">User Registration</a></li>
					<li><a href="/adminlogin">Admin Login</a></li>
					<li><a href="/contact">Contact</a></li>
					<li><a href="/login">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

<c:choose>
<c:when test="${mode=='MODE_WELCOME' }">
	<div class="container">
	               <h2>Medicare</h2>
                   <img src="C:\Users\DELL\MEDICARE.jpg" alt="Trulli" width="500" height="333">
	</div>
	</c:when>
<c:when test="${mode=='MODE_CONTACT' }">
	<div class="container">
	                <div class="form-group">
						<label class="control-label col-md-3">Medicare is a company that supplies medicines and a couple of other healthcare essentials at an affordable price. It was established in 2012 in Delhi, India.</label>
					</div>
		            <div class="form-group">
						<label class="control-label col-md-3">Phone Number: 9991192229</label>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email: medicareservices@gmail.com</label>
					</div>
	</div>
	</c:when>
<c:when test="${mode=='MODE_LOGIN'}">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
					</form>
					</div>
					</c:when>

<c:when test="${mode=='MODE_ADMINLOGIN'}">
			<div class="container text-center">
				<h3>Admin Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-admin">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Admin</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="adname" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="adpass"/>
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
					</form>
					</div>
					</c:when>

					
		<c:when test="${mode=='MODE_HOME' }">
	<div class="container" id="homediv">
		<div class="jumbotron text-center">
			<h1>Shopping page</h1>
		</div>
	</div>

	<div class="container text-centered">			
		<form action="/search-product"><input type="text" name="uproduct"><input type="submit" value="Search"></form><br/>
		<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Brand</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Buy</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr>
									<td>${product.id}</td>
									<td>${product.color}</td>
									<td>${product.company}</td>
									<td>${product.name}</td>
									<td>${product.price}</td>
									<td><a href="/buy-product?id=${product.id }&name=${product.name}&comp=${product.company}&price=${product.price}"><span
											class="glyphicon glyphicon-shopping-cart"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			<c:when test="${mode=='MODE_REGISTER' }">
			<div class="container text-center">
				<h3>User Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_PURCHASE' }">
			<div class="container text-center">
				<h3>Product Summary</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
					<input type="hidden" name="id" value="${product.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>:
						<div class="col-md-7">
							<label class="form-control"> ${product.color}</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Brand</label>:
						<div class="col-md-7">
							<label class="form-control"> ${product.company}</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Quantity</label>:
						<div class="col-md-7">
							<label class="form-control"> ${product.name}</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Price</label>:
						<div class="col-md-7">
							<label class="form-control"> ${product.price}</label>
						</div>
					</div>
					<div class="form-group ">
						<h1>Thank you for Purchasing</h1>
					</div>
				</form>
			</div>

		</c:when>
		</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>