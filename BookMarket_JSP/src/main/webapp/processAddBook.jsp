<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>processAddBook</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String save = request.getServletContext().getRealPath("images");
	MultipartRequest multi = new MultipartRequest(request,save,5*1024*1024,"utf-8", new DefaultFileRenamePolicy()); 

	//전달만 받는 변수
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Enumeration files=multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName=multi.getFilesystemName("fname"); //문자열이 들어가야 함

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
	
	newBook.setFilename(fileName);
	
	dao.addBook(newBook); //객체 넘김
	
	response.sendRedirect("books.jsp");


%>

</body>
</html>