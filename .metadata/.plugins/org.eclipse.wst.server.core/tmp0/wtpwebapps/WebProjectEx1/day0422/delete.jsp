<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="mysql.data.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>

<%
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	//dao선언
	GuestDao dao = new GuestDao();
	boolean b = dao.isEqualPass(num, pass);
	if(b) {
		//비번이 맞을 경우 삭제
		dao.guestDelete(num);
	}
	JSONObject ob = new JSONObject();
	ob.put("result",String.valueOf(b));
%>

<%=ob.toString()%>