<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<html>
<head>
<title>Delete Book</title>
</head>
<body>
<%
	String bookId = request.getParameter("id");

	PreparedStatement pstmt=null; //교재에 이 부분 누락되어 있어서 추가함1
	ResultSet rs = null; //교재에 이 부분 누락되어 있어서 추가함2
	String sql = "SELECT * FROM book";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()) {
		sql="DELETE FROM book WHERE b_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 도서가 없습니다");
	
	if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=delete");
%>

</body>
</html>