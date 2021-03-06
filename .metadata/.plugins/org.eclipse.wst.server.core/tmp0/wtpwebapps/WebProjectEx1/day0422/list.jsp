<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.data.GuestDto"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="mysql.data.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>

<%
	//json 배열타입으로 나오도록 코딩
	//dao 에서 list 가져오기
	//json형태로 변환
	//날짜를 년월일 시분까지 나오기
	GuestDao dao = new GuestDao();
	List<GuestDto> list = dao.getAllGuest();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	JSONArray arr = new JSONArray();
	for(GuestDto dto:list)
	{
		JSONObject ob = new JSONObject();
		ob.put("num", dto.getNum());
		ob.put("writer", dto.getWriter());
		ob.put("avata", dto.getAvata());
		ob.put("content", dto.getContent());
		ob.put("writeday",sdf.format(dto.getWriteday()));
		
		//arr추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>