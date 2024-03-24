<% @page language="java" import="java.sql.*" %>

    <%
Connection cn;
PreparedStatement pst;
ResultSet rs;
String n,p;
try
{
	n=request.getParameter("n1");
	p=request.getParameter("n2");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	cn=DriverManager.getConnection("jdbc:odbc:bank");
	pst=cn.prepareStatement("select name from login where USERNAME=? and PASSWORD=?");
	pst.setString(1,n);
	pst.setString(2,p);
	rs=pst.executeQuery();

	if(rs.next())
	{
		n=rs.getString(1);
		response.sendRedirect("my.html");
	}
	else
	{
		response.sendRedirect("login.html");
	}
}
catch(Exception ev)
{
	out.println("check error..."+ev.getMessage());
}
%>