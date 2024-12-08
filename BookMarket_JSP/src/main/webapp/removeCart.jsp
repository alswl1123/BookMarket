<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<html>
<head>
<meta charset="UTF-8">
<title>remove Cart</title>
</head>
<body>
	<%
	String id = request.getParameter("id"); //controller 의 전처리에 해당하는 부분
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}

	BookRepository dao = BookRepository.getInstance();

	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoBookId.jsp");
	}

	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for (int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
	%>

</body>
</html>