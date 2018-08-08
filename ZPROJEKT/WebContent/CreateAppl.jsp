<%@page import="java.awt.SystemColor"%>
<%@page import="b.CreateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="gib" class="b.CreateBean" scope="session" />

	<%
		String TName = request.getParameter("TName");
		String spalte = request.getParameter("spalte");
		String erzeugen = request.getParameter("erzeugen");
		String speichern = request.getParameter("speichern");

		if (TName == null)
			TName = "";
		if (spalte == null)
			spalte = "";
		if (erzeugen == null)
			erzeugen = "";
		if (speichern == null)
			speichern = "";

		
		
		
		
		
		if (!erzeugen.equals("")) {
			int p = Integer.parseInt(spalte);
			gib.setSpalte(p);
			response.sendRedirect("./Create2.jsp");
		} else if (!speichern.equals("")) {
			 int p = gib.getSpalte();
			String[] pA = new String[p];
			for (int i = 1; i <= gib.getSpalte(); i++) {
				gib.setRequest(request.getParameter("SpalteN" + i));
				pA[i - 1] = request.getParameter("SpalteN" + i);
				System.out.println(pA[i - 1]);
			} 
			gib.getArray();
			
			response.sendRedirect("./Create3.jsp");
		} else {
			response.sendRedirect("./Create1.jsp");
		}
	%>





</body>
</html>