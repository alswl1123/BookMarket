<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%-- <%@ page import = "java.util.ArrayList" %> --%>
<%-- <%@ page import = "dto.Book" %> --%>
<%-- <%@ page import = "dao.BookRepository" %> --%> <!-- dao 가 싱글턴이라 객체 생성 안 함 -->
<!--<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />-->

<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>도서 목록</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서목록</h1>
			<p class="col-md-8 fs-4">BookList</p>
		</div>
	</div>
	<%--<%
		BookRepository dao=BookRepository.getInstance();
		ArrayList<Book> listOfBooks=dao.getAllBooks();
	%>--%>
	
	<!-- 커넥션 처리 -->
	<%@ include file="dbconn.jsp" %>
	
	<div class="row align-items-md-stretch text-center">
	
	<%--<%
		for(int i=0; i<listOfBooks.size(); i++) {
			Book book=listOfBooks.get(i);
	--%>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = "SELECT * FROM book";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
	%>
	
	<!-- 이 부분 수정됨 -->
	<div class="col-md-4">
		<div class="h-100 p-2">
			<img src="./resources/images/<%=rs.getString("b_filename") %>" style="width:250; height:350" />
			<h5><b><%=rs.getString("b_name") %></b></h5>
			<p> <%=rs.getString("b_author") %>
			<br><%=rs.getString("b_publisher") %> | <%=rs.getString("b_unitPrice") %>원
			<p><%=rs.getString("b_description").substring(0,60) %>...
			<p><%=rs.getString("b_unitPrice") %>원
			<p><a href="./book.jsp?id=<%= rs.getString("b_id") %>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
		</div>
		<%
		}
		if (rs!=null)
			rs.close();
		if (pstmt!=null)
			pstmt.close();
		if (conn!=null)
			conn.close();
		%>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>