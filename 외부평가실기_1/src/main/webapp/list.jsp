<%@page import="dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>
	<%@include file="menu.jsp"%>
		<%Dao dao = new Dao();
		ArrayList<MemberDto>list = dao.getmemberlist();
		%>
		<div>
	<table>
		<tr>
			<th>회원번호</th><th>회원성명</th>
			<th>전화번호</th><th>주소</th>
			<th>가입일자</th><th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% for(MemberDto dto : list){
			String grade = "직원";
		if(dto.getGrade().equals("A")){grade="VIP";}
		else if(dto.getGrade().equals("B")){grade="일반";}
		%>
		<tr>
			<td><a href="update.jsp?custno=<%=dto.getCustno()%>"><%=dto.getCustno()%></a></td>
			<td><%=dto.getCustname()%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getAddress()%></td>
			<td><%=dto.getJoindate()%></td>
			<td><%=grade%></td>
			<td><%=dto.getCity()%></td>
		</tr>
		<%} %>
	</table>
	</div>
		<%@include file="footer.jsp"%>
</body>
</html>