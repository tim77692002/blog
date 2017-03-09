<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

h1 {
	text-decoration: blink;
	color: fuchsia;
	text-align: center;
	margin: auto;
}

table {
	width: auto;
	margin: auto;
}

table th {
	background-color: black;
	color: orange;
}

table tr:nth-child(even) {
	background-color: #dfe;
}

table tr:nth-child(odd) {
	background-color: #f1f1c1;
}

table, th, td {
	border: 1px solid red;
	border-collapse: collapse;
	text-align: center;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>TeamForm</title>
<script type="text/javascript">
	function input(f) {
		if (f.name.value == "") {
			alert("이름이 없음");
			f.name.focus();
			return false;
		}

		if (f.gender[0].checked == false && f.gender[1].checked == false) {
			alert("성별 체크가 안됨");
			f.gender[0].focus();
			return false;
		}

		if (f.phone.value == "") {
			alert("전화번호가 없음");
			f.phone.focus();
			return false;
		}

		if (f.zipcode.value == "") {
			alert("우편번호가 없음");
			f.zipcode.focus();
			return false;
		}

		if (f.address1.value == "") {
			alert("주소가 없음");
			f.address1.focus();
			return false;
		}

		if (f.address2.value == "") {
			alert("상세주소가 없음");
			f.address2.focus();
			return false;
		}

		var cnt = 0;
		for (var i = 0; i < f.skill.length; i++) {
			if (f.skill[i].checked) {
				cnt += 1;
			}
		}

		if (cnt == 0) {
			alert("보유기술이 없음");
			f.skill[0].focus();
			return false;
		}

		if (f.hobby.selectedIndex == 0) {
			alert("취미가 없음");
			f.hobby.focus();
			return false;
		}
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>
<body>
	<form name="frm" action="create" method="post" onsubmit="return input(this)" enctype="multipart/form-data">
		<h1>팀 정보 생성</h1>
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" placeholder="이름">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label for="g1"> <input id="g1" type="radio" name="gender" value="남">남
					</label> <label for="g2"> <input id="g2" type="radio" name="gender" value="여">여
					</label>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone" placeholder="전화번호">
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="zipcode" size="7" maxlength="5" id="sample6_postcode" placeholder="우편번호"> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address1" size="45" id="sample6_address" placeholder="주소"><br> <input type="text" name="address2" size="45" id="sample6_address2" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td>보유기술</td>
				<td>
					<label for="s1"> <input id="s1" type="checkbox" name="skill" value="Java">Java
					</label> <label for="s2"> <input id="s2" type="checkbox" name="skill" value="Jsp">JSP
					</label> <label for="s3"> <input id="s3" type="checkbox" name="skill" value="MVC">MVC
					</label> <label for="s4"> <input id="s4" type="checkbox" name="skill" value="Spring">Spring
					</label> <label for="s5"> <input id="s5" type="checkbox" name="skill" value="jQuery">jQuery
					</label>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<select name="hobby">
						<option>취미를 선택하세요</option>
						<option value="기술서적읽기">기술서적읽기</option>
						<option value="영화보기">영화보기</option>
						<option value="모바일게임">모바일게임</option>
						<option value="보드게임">보드게임</option>
						<option value="축구">축구</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<input type="file" name="fileMF" accept=".gif,.jpg,.png"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록"> <input type="reset" value="다시입력">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>