<%@page import="java.util.List"%>
<%@page import="com.prj.dao.ProductDao"%>
<%@page import="com.prj.pojo.Product"%>
<%@page isELIgnored="false" %>
<html>
<head>
<%@include file="./base.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">Welcome to Product App</h1>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Product Name</th>
							<th scope="col">Product Description</th>
							<th scope="col">Product Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>

					<tbody>
						<%
						List<Product> myList = (List<Product>) session.getAttribute("product");
						for (Product pr : myList) {
							int i = pr.getId();
							String n = pr.getName();
							String d = pr.getDescription();
							long p = pr.getPrice();
							out.println("<tr>");
							out.println("<th scope='row'>TECHNO"+ i + "</th>");
							out.println("<td scope='row'>" + n + "</td>");
							out.println("<td scope='row'>" + d + "</td>");
							out.println("<th scope='row'>&#8377;" + p + "</th>");
							out.println("<td><a href='delete/"+i+"'><i class='fa-solid fa-trash text-danger'></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href='update/"+i+"'><i class='fa-solid fa-pen text-primary'></i></a></td>");
							out.println("</tr>");
						}
						%>
					</tbody>
				</table>
				<form action="addProduct" method="post">
					<div class="text-center">
						<button type="submit" class="btn btn-success">Add Product</button>
					</div>
				</form>
			</div>
		</div>
	</div>



</body>
</html>
