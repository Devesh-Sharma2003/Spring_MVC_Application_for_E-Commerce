<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.prj.pojo.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Update Product</title>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-9 offset-1 ">
				<h1 class="text-center mb-3">Change the product detail</h1>

				<form action="${pageContext.request.contextPath}/data" method="post">
					<h3>Product ID: ${pro.id}</h3>
					<br>
					<input type="hidden" value="${pro.id}" name="id">
					<div class="form-group">
						<label for="exampleInputEmail1">Product Name</label> <input
							type="text" class="form-control" value="${pro.name}" name="name">
					</div>

					<div class="form-group">
						<label for="example">Product Description</label>
						<textarea class="form-control" value="${pro.description}"
							name="description" rows="5"></textarea>
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Product Price</label> <input
							type="Number" class="form-control" name="price"
							value="${pro.price}">
					</div>

					<div class="container text-center">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>




	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>