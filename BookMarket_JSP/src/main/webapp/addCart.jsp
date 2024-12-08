<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book"%>
<%@ page import = "dao.BookRepository" %>
<html>
<head>

<title>Add Cart</title>
</head>
<body>
<%
	//전처리 부분
	String id=request.getParameter("id"); //controller 의 전처리에 해당하는 부분
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return; //변수의 유효성 검사(파라미터 없어? 돌아가)
	}
	
	//모델 부분
	BookRepository dao = BookRepository.getInstance(); //객체 생성
	
	Book book = dao.getBookById(id); //이거 주세요
	if(book==null) {
		response.sendRedirect("exceptionNoBookId.jsp"); //그런 제품 없다
	} //제품 유효성 검사
	
	ArrayList<Book> goodsList=dao.getAllBooks();
	Book goods=new Book(); //복사본 DTO 생성
	for(int i=0; i<goodsList.size(); i++) {
		goods=goodsList.get(i); //옮겨담음
		if(goods.getBookId().equals(id)) { //해당 제품 맞는지 확인
			break;
		}
	} 
	
	ArrayList<Book> list=(ArrayList<Book>)session.getAttribute("cartlist");
	if(list==null) {
		list=new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}//첫 방문(카트 생성)
	
	int cnt=0;
	Book goodsQnt = new Book();
	for(int i=0; i<list.size(); i++) {
		goodsQnt=list.get(i);
		if(goodsQnt.getBookId().equals(id)) {
			cnt++;
			int orderQuantity=goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt==0) {
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("book.jsp?id=" + id);
%>

</body>
</html>