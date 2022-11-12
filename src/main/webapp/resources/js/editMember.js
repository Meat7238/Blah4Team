function test(str, num) {
	if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				/*     		 window.location.href =path+'/admin/edit/delete?num='+ e.user_num; */
			location.href = str + '/admin/edit/delete?num=' + num;
			alert("삭제완료했습니다.");
	} else { //취소
		return false;
	  }
	}
	
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}