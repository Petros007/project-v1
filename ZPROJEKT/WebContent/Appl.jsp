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
	<jsp:useBean id="reg" class="b.RegistrierungBean" scope="session" />
	<jsp:useBean id="app" class="jdbc.AppInstallAccountTable" scope="session" />
<%
		String TName = request.getParameter("TName");
		String spalte = request.getParameter("spalte");
		String erzeugen = request.getParameter("erzeugen");
		String speichern = request.getParameter("speichern");
		String registrieren = request.getParameter("registrieren");
		String email = request.getParameter("email");
		String passwort = request.getParameter("passwort");
		String sqlC= "Create Table "+gib.getSpalte()+"."+gib.getTName()+"( ";
		
		if (TName == null)
			TName = "";
		if (spalte == null)
			spalte = "";
		if (erzeugen == null)
			erzeugen = "";
		if (speichern == null)
			speichern = "";
		if (registrieren == null)
			registrieren = "";
		if (email == null)
			email = "";
		if (passwort == null)
			passwort = "";
		
		
		if (!erzeugen.equals("")) {
			int p = Integer.parseInt(spalte);
			gib.setSpalte(p);
			gib.setTName(TName);
			response.sendRedirect("./Create2.jsp");
		} else if (!speichern.equals("")) {
			int p = gib.getSpalte();
			String[] pText = new String[p];
			String[] pTyp = new String[p];
			String[] pNull = new String[p];
			int pRadio;
			pRadio = Integer.parseInt(request.getParameter("pk"));

			for (int i = 1; i <= gib.getSpalte(); i++) {
				/* gib.setRequest(request.getParameter("SpalteN" + i));
				gib.setRequestDatenTyp(request.getParameter("typ"+i)); */
				pText[i - 1] = request.getParameter("SpalteN" + i);
				pTyp[i - 1] = request.getParameter("typ" + i);
				pNull[i - 1] = request.getParameter("notnull" + i);
				
				System.out.println(pText[i - 1]);System.out.println(pTyp[i - 1]);System.out.println(pNull[i - 1]);
				}
			System.out.println("pk:" + pText[pRadio - 1]);
			String a ="";
			for (int i = 1; i <= gib.getSpalte(); i++) {
				
				if(pNull[i-1]=="checkbox"){
				 a= "NOT NULL";
				 sqlC+= pText[i-1]+" "+pTyp[i-1]+a+",";
				}
				else {
					 a=" ";
					 sqlC+= pText[i-1]+" "+pTyp[i-1]+a+",";
				}
				
				
				
				}
				System.out.println(sqlC);
			
			response.sendRedirect("./Create3.jsp");
			
		} else if (!registrieren.equals("")) {
			
			reg.setEmail(email);
			reg.setPasswort(passwort);
			
		
			if(reg.registrierungcheck()){
				response.sendRedirect("./Create3.jsp");
			}else{	
				response.sendRedirect("./Registrierung.jsp");
			}
		}else {
			response.sendRedirect("./Login.jsp");
		}
	%>





</body>
</html>