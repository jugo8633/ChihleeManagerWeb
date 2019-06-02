
<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<html>
<body>
	<h2>Hello World!</h2>

	<%
		out.println("hello");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/chihlee?characterEncoding=UTF-8";
			Connection con = DriverManager.getConnection(url, "chihlee", "Chihlee123!");
			if (con.isClosed()) {
				out.println("連線 MySQL 失敗!!");
			} else {
				out.println("連線 MySQL 成功!!");
				String query = "select * from course";

				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
				out.println("Records for Database");
				while (rs.next()) {
					out.println(rs.getLong("id"));
					out.println(rs.getString(1));
					out.println(rs.getString(2));
				}
				rs.close();
				st.close();
			}
			con.close();
		} catch (Exception sExec) {
			out.println("SQL錯誤:" + sExec.toString());
		}

		
	%>
</body>
</html>
