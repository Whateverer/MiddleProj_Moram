/**
 * 
 */

//모람지기인지 체크
function jigiChk1(mrNo) {
	jigiChk = null;
	$.ajax({
		url : '/Moram/MoramjigiChk.do',
		type : 'get',
		async : false,
		data : {
		"mem_id" : memId,
		"mr_no" : mrNo
		},
		dataType : 'json',
		success : function(res){
			//모람지기면 1, 아니면 0반환
			jigiChk = res;
			
		},
		error : function(xhr){
			alert(xhr.status);
		}
	});
	return jigiChk;
}

//모라미인지 체크
function memChk1(moramNo){
	memChk = null;
	$.ajax({
		url : '/Moram/MoramMemChk.do',
		type : 'get',
		async : false,
		data : {"mem_id" : memId,
				"mr_no" : moramNo
			},
		dataType : 'json',
		success : function(res){
			//alert(res);
			memChk = res;
			//memChk가 0이면 미가입, 1이면 가입된 모라미
		},
		error : function(xhr){
			alert(xhr.status);
		}	
	});
	return memChk;
	
}

//모람 가입
function moramJoin(moramNo){
	$.ajax({
		url: '/Moram/MoramJoin.do',
		type : 'get',
		dataType : 'json',
		async : false,
		data : {"mem_id" : memId,
			"mr_no" : moramNo},
		success : function(res){
			if(res == null){
				alert("가입실패");
			}else{
				alert("모람에 가입했습니다.");
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

//모람 탈퇴
function moramExit(moramNo){
	$.ajax({
		url : '/Moram/MoramBan.do',
			type: 'post',
			data : {"mem_id" : memId,
				"mr_no" : moramNo
			},
			async : false,
			success : function(res){
				if(res == 1){
				alert("회원 탈퇴했습니다.")
			}else{
				alert("탈퇴실패");
			}
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType : 'json'
		
	});
}

//관심모람 설정
/*function insertPrefer() {
	$.ajax({
		url: "/Moram/MrPreferInsert.do",
		type: 'post',
		data: {"mem_id": mem_id,
			   "mr_no" : mrNo
		},
		success: function(res) {
			alert("관심모람 설정 완료");
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}*/

//모람 관심설정 되어있는지 체크
function chkMoramPrefer(mrNo) {
	$.ajax({
		url: "/Moram/ChkMoramPrefer.do",
		type: "post",
		data: {
			"mr_no" : mrNo,
			'mem_id' : memId
		},
		async : false,
		success: function(res) {
			if(res == 1){
				$("#mrPrefer").addClass("btn-danger");
			}else {
				$("#mrPrefer").removeClass("btn-danger");
			}
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

//모람 관심체크했을 때
function MoramPrefer(mrNo){
	$.ajax({
		url: "/Moram/MoramPrefer.do",
		type: "post",
		data: {"mem_id" : memId,
			  "mr_no" : mrNo
		},
		success: function(res) {
			$("#mrPrefer").addClass("btn-danger");
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

//모람 관심해제했을 때
function MoramNotPrefer(mrNo){
	$.ajax({
		url: "/Moram/MoramNotPrefer.do",
		type: "post",
		data: {"mem_id" : memId,
			  "mr_no" : mrNo
		},
		success: function(res) {
			$("#mrPrefer").removeClass("btn-danger");
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

// 해당 모람 사진들 가져오기
function imagesList(){
	$.ajax({
		url: "/Moram/ImagesList.do",
		type: 'post',
		data: {"mr_no" : mrNo},
		success: function(res) {
			ilist = '';
			$.each(res, function(i, v) {
				ilist += '<div class="mrimg" imgboardNo="'+v.board_no+'">';
				ilist += '<img src="/Moram/images/imageView.do?folderNm=board/'+mrNo+'/'+v.board_no+'&fileNm='+v.attach_name+'"><br>';
				ilist += '</div>';
			})
			$('#mralbum_container').html(ilist);
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	});
}

//모람 이미지 수정
function moramImgUpdate(){
	$.ajax({
		url: "/Moram/fileUpload.do",
		type: "post",
		data:{'fileNM' : 'class',
			   'folderNm' : mrNo
			   }, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

//모람 소개 수정
function moramInfoUpdate(mrNo){
	$.ajax({
		url: "/Moram/MoramInfoUpdate.do",
		type: "post",
		data: {
			"mr_no" : mrNo,
			"mr_info": newInfo
		},
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
	
}
