function inputCheck() {
	
	if(document.memberForm.member_id.value==""){
		alert("아이디를 입력해주세요");
		document.memberForm.member_id.focus();
		return ;
	}
	
	if(document.memberForm.member_password.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.memberForm.member_password.focus();
		return ;
	}
	
	if(document.memberForm.member_nickname.value==""){
		alert("닉네임을 확인해 주세요.");
		document.memberForm.member_nickname.focus();
		return ;
	}
	
	if(document.memberForm.member_email.value==""){
		alert("이메일을 입력해 주세요.");
		document.memberForm.member_email.focus();
		return ;
	}
	

	
   document.memberForm.submit();
}