$(function() {
	function errDisplay(val){
		val.stop();
		val.animate({opacity: '0'}, 'fast');
		val.animate({opacity: '1'}, 'fast');
	}
	function idcheck() {
		var id = $("#regiid").val();
		var idcheck = $("#regiidcheck");
		if(id.length < 5 || id.length > 20){
			idcheck.html("<font color=red>아이디는 5자 이상, 20자 이하여야합니다.</font>");
			errDisplay(idcheck);
			return false;
		}
		idcheck.html("");
		$.ajax({
			url: "/prac/member/check",
			data: {id:id},
			success:function(res){
				idcheck.html(res);
			}
		})
		return true;
	}
	function pwcheck() {
		var pw = $("#regipw").val();
		var pwr = $("#regipwr").val();
		var pwcheck = $("#regipwrcheck");
		if(pwr.length < 8){
			_pwcheck = $("#regipwcheck");
			if(pw.length < 8){
				_pwcheck.html("<font color=red>비밀번호는 8자 이상이어야 합니다.</font>");
				errDisplay(_pwcheck);
				return;
			}
			else{
				_pwcheck.html("");
			}
		}
		if(pw == pwr){
			pwcheck.html("<font color=green>비밀번호가 일치합니다.</font>");
			return true;
		}else{
			pwcheck.html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
			errDisplay(pwcheck);
			return false;
		}
	}
	function namecheck() {
		var name = $("#reginame").val();
		var namecheck = $("#reginamecheck");
		if(name.length > 0){
			namecheck.html("");
			return true;
		}else{
			namecheck.html("<font color=red>이름은 공백으로 할 수 없습니다.</font>");
			errDisplay(namecheck);
			return false;
		}
	}
	$("#regiid").focusout(function() {
		idcheck();
	})
	$("#regipw").focusout(function() {
		pwcheck();
	})
	$("#regipwr").focusout(function() {
		pwcheck();
	})
	$("#reginame").focusout(function() {
		namecheck();
	})
	$("#backbtn").click(function() {
		window.history.back();
	})
	
	$("#regiform").submit(function(){
		if(idcheck() && pwcheck() && namecheck()){
			return true;
		}
		else return false;
	});
})