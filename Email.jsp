<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
/*-------------------------------FUNCTION FOR EMAIL----------------------------*/

public void send_mail(String email)
{
	final String username = "clinicare.appointemnt@gmail.com";
	final String password = "infoclinicare";

	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
	  new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	  });

		try {

			Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("test@hellokeralites.com"));
		message.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse(email));
		message.setSubject("Appointment Info");
		message.setText("Hi "+"Vishnu"+",\n\n"+
		"Your Appointment has been booked for 10:00am.\n\n"
		+"\nPlease report in the clinic 10 mins before the Appointment time: \n\n"
		+"Thanks For using CliniCare\n"
		+"The Team Busy Bees!");
                  
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
		throw new RuntimeException(e);
	}

	
}

%>
<%
		send_mail("vishnunambiar08@gmail.com,vikas9142@gmail.com");
	
%>

<h1><center>Thank You for Using Clinicare.in</center></h1>
</body>
</html>