<%@page import="Dao.Dao"%>
<%@page import="dto.MemberDto"%>
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
	<% int custno = Integer.parseInt(request.getParameter("custno"));
	Dao dao = new Dao();
		MemberDto memberDto = dao.memberDto(custno);
	%>
	<form name="update" action="updatecontroller.jsp" method="post">
	<table>
		<tr>
			<td>회원번호</td>
			<td><input type="text" name="custno" id="custno" value="<%=memberDto.getCustno()%>" readonly></td>
			
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" id="custname" value="<%=memberDto.getCustname()%>"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" id="phone" value="<%=memberDto.getPhone()%>"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" id="address" value="<%=memberDto.getAddress()%>"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" id="joindate"  value="<%=memberDto.getJoindate()%>"></td>
		</tr>
		<tr>
			<td>고객등급(A=VIP,B=일반,C=직원)</td>
			<td><input type="text" name="grade" id="grade" value="<%=memberDto.getGrade()%>"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" id="city" value="<%=memberDto.getCity()%>"></td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" onclick="updatecheck()">등록</button><button type="button" onclick="location.href='list.jsp'">조회</button></td>
		</tr>
	</table>
	</form>
<%@include file="footer.jsp"%>
	<script type="text/javascript" src="updatemember.js"></script>
</body>
</html>