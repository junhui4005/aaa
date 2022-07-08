<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
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
	<% Dao dao = new Dao();
		int mno= (dao.get마지막번호()+1);
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String joindate = formatter.format(date);
	%>
	<form name="join" action="joincontroller.jsp" method="post">
	<table>
		<tr>
			<td>회원번호</td>
			<td><input type="text" name="custno" id="custno" value="<%=mno%>"></td>
			
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" id="custname" ></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" id="phone" ></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" id="address" ></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" id="joindate"  value="<%=joindate%>"></td>
		</tr>
		<tr>
			<td>고객등급(A=VIP,B=일반,C=직원)</td>
			<td><input type="text" name="grade" id="grade" ></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" id="city" ></td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" onclick="joincheck()">등록</button><button type="button" onclick="location.href='list.jsp'">조회</button></td>
		</tr>
	</table>
	</form>
	<%@include file="footer.jsp"%>
	
	<script type="text/javascript" src="addmember.js"></script>
</body>
</html>