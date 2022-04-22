/**
 * 
 */

function myMoramList() {
	$.ajax({
		url: "/Moram/MyMoramList.do",
		type: 'post',
		data: {"mem_id": mem_id},
		success: function(res) {
			$('#mymoram_container').empty();
			mlist = "";
			$.each(res, function(i, v) {
				mlist += '<div class="mrinfo" mrNo="'+v.mr_no+'">';
				mlist += '<img src="/Moram/images/imageView.do?folderNm=moram&fileNm='+v.mr_image+'"><br><br>';
				//mlist += '<img src="/Moram/images/moram/'+v.mr_no+'.jpg"><br>';
				mlist += v.mr_name;
				mlist += '</div>';
			})
			$('#mymoram_container').append(mlist);
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}



//선택한 카테고리 모람 출력 - sel

function selCatMoramList(selCatNo){
	$.ajax({
		url: "/Moram/SelCatMoramList.do",
		type: 'post',
		data: {"subject_no": selCatNo},
		success: function(res) {
			mlist = "";
			$.each(res, function(i, v) {
				mlist += '<div class="mrinfo" mrNo="'+v.mr_no+'">';
				mlist += '<img src="/Moram/images/imageView.do?folderNm=moram&fileNm='+v.mr_image+'"><br><br>';
				//mlist += '<img src="/Moram/images/moram/'+v.mr_no+'.jpg"><br>';
				mlist += v.mr_name;
				mlist += '</div>';
			})
			$('#samemoram_container').html(mlist);
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	});
}

//회원가입시 선택한 카테고리, 같은 지역 모람 출력 - same

function sameCatMoramList(){
	$.ajax({
		url: "/Moram/SameCatMoramList.do",
		type: 'post',
		data: {"mem_id": mem_id},
		success: function(res) {
			mlist = "";
			$.each(res, function(i, v) {
				
				mlist += '<div class="mrinfo" mrNo="'+v.mr_no+'">';
				mlist += '<img src="/Moram/images/imageView.do?folderNm=moram&fileNm='+v.mr_image+'"><br><br>';
				//mlist += '<img src="/Moram/images/moram/'+v.mr_no+'.jpg"><br>';
				mlist += v.mr_name;
				mlist += '</div>';
			})
			$('#samemoram_container').html(mlist);
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	});
}









