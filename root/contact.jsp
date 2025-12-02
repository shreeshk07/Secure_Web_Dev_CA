<%@ page import="java.sql.*" %>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@ include file="/dbconnection.jspf" %>
<jsp:include page="/header.jsp"/>

<%
String username = (String) session.getAttribute("username");
String usertype = (String) session.getAttribute("usertype");
String anticsrf = null;

String comments = (String) request.getParameter("comments");

if (request.getMethod().equals("POST") && comments != null) {

	anticsrf = request.getParameter("anticsrf");
	if (anticsrf != null && anticsrf.equals(request.getSession().getAttribute("anticsrf"))) {

	// Secure
	comments = StringEscapeUtils.escapeHtml4(comments);

		PreparedStatement stmt = conn.prepareStatement("INSERT INTO Comments (name, comment) VALUES (?, ?)");
		ResultSet rs = null;
		try {
			stmt.setString(1, username);
			stmt.setString(2, comments);
			stmt.execute();

			if (username == null) {
				username = "Guest user";
			}

			out.println("<br/><p style=\"color:green\">Thank you for your feedback:</p><br/>");
			out.println("<br/><center><table border=\"1\" width=\"80%\" class=\"border\">");
			out.println("<tr><td>" + comments + "</td></tr>");
			out.println("</table></center><br/>");

			return;

		} catch (SQLException e) {
			out.println("System error.<br/><br/>" + e);
		} catch (Exception e) {
			out.println("System error.<br/><br/>" + e);
		} finally {
			stmt.close();
		}
	} else {
		out.println("<br/><p style=\"color:red\">There was a problem with your feedback, please try again.</p><br/>");
	}
}
// Generate and store a new token
anticsrf = "" + Math.random();
request.getSession().setAttribute("anticsrf", anticsrf);


if (usertype != null && usertype.endsWith("ADMIN")) {
	// Display all of the messages
	ResultSet rs = null;
	PreparedStatement  stmt2 = conn.prepareStatement("SELECT * FROM Comments");
	try {
		rs = stmt2.executeQuery();
		out.println("<br/><center><table border=\"1\" width=\"80%\" class=\"border\">");
		out.println("<tr><th>User</th><th>Comment</th></tr>");
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + StringEscapeUtils.escapeHtml4(rs.getString("name")) +
           "</td><td>" + StringEscapeUtils.escapeHtml4(rs.getString("comment")) + "</td>");  //Secure
			out.println("</tr>");
		}
		out.println("</table></center><br/>");
	} catch (Exception e) {
		if ("true".equals(request.getParameter("debug"))) {
			conn.createStatement().execute("UPDATE Score SET status = 1 WHERE task = 'HIDDEN_DEBUG'");
			out.println("DEBUG System error: " + e + "<br/><br/>");
		} else {
			out.println("System error.");
		}
	} finally {
		stmt2.close();
	}

} else {
	// Display the message form
%>
<h3>Contact Us</h3>
Please send us your feedback: <br/><br/>
<form method="POST">
	<input type="hidden" id="user" name="user" value="<%=username%>"/>
	<input type="hidden" id="anticsrf" name="anticsrf" value="<%=anticsrf%>"></input>
	<center>
	<table>
	<tr>
		<td><textarea id="comments" name="comments" cols=80 rows=8></textarea></td>
	</tr>
	<tr>
		<td><input id="submit" type="submit" value="Submit"></input></td>
	</tr>
	</table>
	</center>
</form>

<%
}

%>

<jsp:include page="/footer.jsp"/>


