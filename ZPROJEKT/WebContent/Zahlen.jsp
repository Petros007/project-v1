<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int maxNum = 17; %>
<table>
	<tr>
		<td>
			<h2>Hier kommen 
				<% out.print(maxNum);%>,
				tats&auml;chlich
				<%= maxNum %>,
				Zahlen in einer Tabelle
			</h2>
		</td>
		<td>
			<h2>und hier in einer Liste</h2>
		</td>
	</tr>
	<tr>
		<td>
			<table>
<% for(int index = 1; index <= maxNum; index++){ %>
				<tr>
					<td>
						<%= (index == 1)?"erst":"dann" %>
						kommt die
					</td>
					<td>
						<%= index %>
					</td>
				</tr>
<% } %>
			</table>
		</td>
		<td>
			<ul>
<% for(int index = 1; index <= maxNum; index++){
//	String woertle = (index ==1)?"erst":"dann";
	out.println("<li>" +
				((index ==1)?"erst":"dann") +
				" kommt die " + index + "</li>"
			);
} %>
<% for(int index = 1; index <= maxNum; index++){
	out.println("<li>dann kommt die " + index + "</li>");
} %>
<%= "===================" %>
<% for(int index = 1; index <= maxNum; index++){ %>
	<li>dann kommt noch die <%= index %> </li>
<% } %>

<% for(int index = 1; index <= maxNum; index++){ %>
	<li>
		<%= (index == 1)?"erst":"dann" %>
		kommt noch die
		<%= index %>
	</li>
<% } %>
			</ul>
		</td>
	</tr>
</table>
</body>
</html>