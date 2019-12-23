/**
 * 
 */
function inputCheck(){
	//alert(document.regFrm.id.value);
	//var a=document.getElementById('regFrm');
	
	if(document.regFrm.id.value=""){
		alert("아이디를 입력해주세요");
		document.regFrm.id.focus();
		return ;
	}
	if(document.regFrm.pw.value=""){
		alert("패스워드를 입력해주세요");
		document.regFrm.pw.focus();
		return ;
	}
	document.regFrm.submit();
	//document.form.submit();
	//document.forms[0].submit();
	//alert(document.forms[0]);
}
function win_close(){
	self.close();
}
