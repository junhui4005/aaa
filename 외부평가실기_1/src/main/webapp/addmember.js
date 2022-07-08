function joincheck(){
	if(document.join.custname.value==""){
		alert("회원이름을 입력해주세요");
		document.join.custname.focus();
		return false;
	}
	if(document.join.address.value==""){
		alert("회원주소를 입력해주세요");
		document.join.address.focus();
		return false;
	}
	if(document.join.phone.value==""){
		alert("회원번호를 입력해주세요");
		document.join.phone.focus();
		return false;
	}
	if(document.join.joindate.value==""){
		alert("가입일을 입력해주세요");
		document.join.joindate.focus();
		return false;
	}
	if(document.join.grade.value==""){
		alert("회원등급를 입력해주세요");
		document.join.grade.focus();
		return false;
	}
	if(document.join.city.value==""){
		alert("도시코드를 입력해주세요");
		document.join.city.focus();
		return false;
	}
	
	alert("회원등록이 완료되었습니다.");
	document.join.submit();
}

