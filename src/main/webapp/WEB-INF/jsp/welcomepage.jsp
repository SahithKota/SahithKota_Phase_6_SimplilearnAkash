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
			<a href="/welcome" class="navbar-brand">Medicare Admin Page</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				    <li><a href="/password-change">Password change</a></li>
				    <li><a href="/show-users">All Signed-up Users</a></li>
					<li><a href="/show-purchases">Purchase Report</a></li>					
					<li><a href="/show-products">All Products</a></li>
					<li><a href="/login">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
<c:when test="${mode=='MODE_ADMIN' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome</h1>
					<h1>Please select an option</h1>
				</div>
			</div>

		</c:when>
		<c:when test="${mode=='MODE_PASSWORD'}">
			<div class="container text-center" id="tasksDiv">
				<h3>Change Password</h3>
				<hr>
				<form action="/change-pass">
				Enter new password: <input type="text" name="adminpass"><br/><br/>
				<input type="submit" value="Submit">
				</form>		        
			</div>
		</c:when>
	<c:when test="${mode=='All_ITEMS'}">
	<div class="container text-centered">
	<h3>All Products in the cart</h3>
		<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Brand</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Delete</th>
								<th>Edit</th>
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
									<td><a href="/delete-product?id=${product.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-product?id=${product.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			<c:when test="${mode=='PRODUCT_UPDATE' }">
			<div class="container text-center">
				<h3>Update Product</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
					<input type="hidden" name="id" value="${product.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${product.color}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Brand</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${product.company}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Quantity</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${product.name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Price</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${product.price}" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>
			
			<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
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
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>
		
			<c:when test="${mode=='All_PURCHASE' }">
	<div class="container text-centered">
	<h3>Purchase Report</h3>
		<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Customer</th>
								<th>Company</th>								
								<th>Item Name</th>
								<th>Date of purchase</th>
								<th>Price</th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="purchase" items="${purchases}">
								<tr>
									<td>${purchase.id}</td>
									<td>${purchase.customer}</td>
									<td>${purchase.company}</td>
									<td>${purchase.name}</td>
									<td>${purchase.date}</td>
									<td>${purchase.price}</td>									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			
		<c:when test="${mode=='ALL_USERS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>All Signed up Users</h3>
				<hr>
				<form action="/search-user"><input type="text" name="uname"><input type="submit" value="Search"></form><br/>
		        <div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Age</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.age}</td>
									<td><a href="/delete-user?id=${user.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
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
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>

		
	</c:choose>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>