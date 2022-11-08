<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWirte</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	//유효성 검사
	function AllChk() {
		if (!titleChk(ReviewWriteForm.title.value)) {
			return false;
		}
		if (!contentChk(ReviewWriteForm.content.value)) {
			return false;
		}
		return true;
	}

	function titleChk(chkValue) {
		var isTitleRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,100}$/;

		if (chkValue == "") {
			alert("제목을 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		if (!isTitleRegExp.test(chkValue)) {
			alert("제목을 2글자 이상 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		return true;
	}

	function contentChk(chkValue) {
		var isContentRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,1000}$/;

		if (chkValue == "") {
			alert("내용을 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
		if (!isContentRegExp.test(chkValue)) {
			alert("내용을 2글자 이상 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
	}// 유효성검사 끝

	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e) {// 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
</head>
<body>

	<c:import url="../main/header.jsp" />

	<aside>
		<div class="aside_wrap">
		<div class="honbab">
			<span>REVIEW</span>
		</div>
			<div class="text">
				<span>리뷰</span>
				<div>글쓰세요</div>
				<div>
				글은 알아서 쓰세요
				설명같은 짧은 글임
				</div>
			</div>
		</div>
		<div class="innerfooter">
			<c:import url="../main/footer.jsp" />
		</div>
	</aside>

	<main>
		<div class="main_wrap">
			<form name="ReviewWriteForm" action="${contextPath}/review/reviewWrite" enctype="multipart/form-data" method="post" onsubmit="AllChk()">
				<!-- input 작성자id(세션), 글쓴이nick(세션), 제목, 게시글내용, 이미지 -->
				<!-- other 조회수(controller), 게시글번호(sql-seq), 작성일자(sql-default), 좋아요(content-button),-->
				<ul>
					<li>
						<span class="index_kr">작성자</span> 
						<input type="hidden" value="${loginUser}" name="id">
						<input type="text" name="nickname">
					</li>
					<hr />
					<div class="line"></div>

					<li>
						<span class="index_kr">제목</span>
						<input type="text" placeholder="제목 작성" name="title" />
					</li>
					<hr />
					<div class="line"></div>
					
					<li class="content">
						<span class="index_kr">내용</span>
						<textarea maxlength="999" name="content"></textarea>
					</li>
					
					<hr />
					<div class="line"></div>
					
					<li class="upload_file">
						<span class="index_kr">사진 첨부</span> 
						<input type="file" name="image_file_name" onchange="readURL(this)">
						<img src="#" id="preview" width="100px">
					</li>
					<hr />
					<div class="line"></div>
				</ul>
				<input type="submit" value="저장" /> 
				<input type="button" value="목록" onclick="location.href='${contextPath}/challengeAllList'">
			</form>
		</div>
	</main>


<!-- 	<b>글쓴이-session</b>
	<br>
	<input type="text" name="nickname">
	<br>
	<b>제 목-not null</b>
	<br>
	<input type="text" name="title">
	<br>
	<br>
	<b>내 용 -not null[네이버 텍스트에디터]</b>
	<br>
	<textarea cols="20" rows="5" name="content"></textarea>
	<br>
	<b>파일 첨부</b>
	<br>
	<input type="file" name="image_file_name" onchange="readURL(this)">
	<b>이미지 미리보기</b>
	<img src="#" id=preview width="100px" height="100px">
	<br>
	<br>
	<input type="submit" value="작성완료"> -->
</body>
</html>