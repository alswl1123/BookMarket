<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<html>
<head>
<title>processAddBook</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	//전달만 받는 변수
	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");

	Integer price;
	
	if (unitPrice.isEmpty()) {
		price=0;
	} else {
		price=Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()) {
		stock=0;
	} else {
		stock=Long.valueOf(unitsInStock);
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book newBook = new Book(); //DTO 생성
	//묶음 처리(Book 객체에 넣음)
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setCondition(condition);
	
	newBook.setUnitsInStock(stock);
	newBook.setUnitPrice(price);
	
	dao.addBook(newBook); //객체 넘김
	
	response.sendRedirect("books.jsp");


%>

</body>
</html>