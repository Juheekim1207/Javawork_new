<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@page import="mysql.data.ShopDao"%>
<%@page import="mysql.data.ShopDto"%>

<%
	//데이터 읽기
	String sangpum = request.getParameter("sangpum");
	String color = request.getParameter("color");
	String ipgoday = request.getParameter("ipgoday");
	String photo = request.getParameter("photo");
	int cnt = Integer.parseInt(request.getParameter("cnt"));
	int price;
	
	try {
		price = Integer.parseInt(request.getParameter("price"));
		
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		price = 0; //숫자가 아닐경우 0으로 표시
	} 

	//dto에 넣기
	ShopDto dto = new ShopDto();
	dto.setSangpum(sangpum);
	dto.setColor(color);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setCnt(cnt);
	dto.setIpgoday(ipgoday);
	
	//dao 선언
	ShopDao dao = new ShopDao();
	
	//insert 메서드 호출
	dao.shopInsert(dto);


%>















