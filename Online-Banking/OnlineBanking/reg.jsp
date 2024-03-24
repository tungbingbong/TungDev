<%@page language="java" import="java.sql.*;" %>

<%
String n,p,add,city,gen,email;
String acn,mob;
int age,x;
Connection cn;
PreparedStatement pst;
try
{
	n=request.getParameter("n1");
	age=Integer.parseInt(request.getParameter("n2"));
	add=request.getParameter("n3");
	city=request.getParameter("n4");
	email=request.getParameter("n5");
	mob=request.getParameter("n6");
	acn=request.getParameter("n7");	
	p=request.getParameter("n8");
	
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	cn=DriverManager.getConnection("jdbc:odbc:test");
	pst=cn.prepareStatement("insert into reg values (?,?,?,?,?,?,?,?)");
	
	pst.setString(1,n);
	pst.setInt(2,age);
	pst.setString(3,add);
	pst.setString(4,city);
	pst.setString(5,email);
	pst.setString(6,mob);
	pst.setString(7,acn);
	pst.setString(8,p);

	x=pst.executeUpdate();
	if(x==1)
	{
		out.println("succesfully updated");
		cn.close();
	}
	else
	{
		out.println("sorry,try again");
	}
}

catch(Exception ev)
{
	out.println("check..."+ev.getMessage());
}
%>