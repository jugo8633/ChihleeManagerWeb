<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>致理科技大學-後端語料管理平台</title>
</head>
<body>
	<img alt="loading" src="img/loading_page.gif"
		style="display: block; margin: auto;">
</body>
</html>

<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.util.*,java.io.*,java.net.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String strTeacher = request.getParameter("teacher");
	String strPicName = request.getParameter("picName");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/chihlee?characterEncoding=UTF-8";
		Connection con = DriverManager.getConnection(url, "chihlee", "Chihlee123!");
		if (con.isClosed()) {
			out.println("連線 MySQL 失敗!!");
		} else {
			//out.println("連線 MySQL 成功!!");
			String query = "INSERT INTO teacher (teacher, picName) VALUES ('" + strTeacher + "','" + strPicName
					+ "')";
			//out.println(query);
			Statement st = con.createStatement();
			st.executeUpdate(query);
			st.close();
			response.sendRedirect("index.jsp");
		}
		con.close();
	} catch (Exception e) {
		out.println("SQL錯誤:" + e.toString());
	}
%>