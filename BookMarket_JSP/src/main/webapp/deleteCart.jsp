<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dto.Book"%>
<%@ page import = "dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Cart</title>
</head>
<body>
<%
	String id=request.getParameter("cartId");
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	session.invalidate(); //=로그아웃
	response.sendRedirect("cart.jsp");
%>

</body>
</html>