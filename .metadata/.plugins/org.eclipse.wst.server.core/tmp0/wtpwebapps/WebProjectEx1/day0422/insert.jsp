<%@page import="mysql.data.GuestDao"%>
<%@page import="mysql.data.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이터 읽기
	String writer = request.getParameter("writer");
	String pass = request.getParameter("pass");
	String avata = request.getParameter("avata");
	String content = request.getParameter("content");

	//dto에 넣기
	GuestDto dto = new GuestDto(writer,avata,content,pass); //생성자로 넣으면 setter할 필요 없음
	
	//dao 선언
	GuestDao dao = new GuestDao();
	
	//insert 메서드 호출
	dao.guestInsert(dto);

%>