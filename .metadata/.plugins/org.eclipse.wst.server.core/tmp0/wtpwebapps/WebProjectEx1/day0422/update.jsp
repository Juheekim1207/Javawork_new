<%@page import="mysql.data.GuestDao"%>
<%@page import="mysql.data.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이터 읽기
	String num = request.getParameter("num");
	String writer = request.getParameter("writer");
	String avata = request.getParameter("avata");
	String content = request.getParameter("content");

	//dto에 넣기
	GuestDto dto = new GuestDto(); 
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setAvata(avata);
	dto.setContent(content);
	
	//dao 선언
	GuestDao dao = new GuestDao();
	
	//insert 메서드 호출
	dao.guestUpdate(dto);

%>