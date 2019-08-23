<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>제품 상세 페이지</title>
<style>
body {

}

header {
	background: #fff;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1;
	text-align: center;
	color: #CC0000;
	font-size: 20px;
	font-weight: bolder;
	letter-spacing: 0.2em;
}

a.head:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.head:visited {
	color: #CC0000;
	text-decoration: none;
}

a.login:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.login:visited {
	color: #CC0000;
	text-decoration: none;
}

a.login:hover {
	color: black;
	text-decoration: none;
}

a.join:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.join:visited {
	color: #CC0000;
	text-decoration: none;
}

a.join:hover {
	color: black;
	text-decoration: none;
}

.menu {
	background: #fff;
	margin-top: 150px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}

#pInfo {
	border: 1px solid black;
	margin: 0 auto;
	width: 1000px;
}

.commentTable {
	margin: 0 auto;
	width: 1000px;
	border: 1px solid black;
}

  .commentTh-th-1 {
    width: 200px;
    text-align: center;
  }

  .commentTh-th-2 {
    width: 500px;
    text-align: center;
  }
</style>
</head>
<script type="text/javascript">

</script>
<body>
	<header>
	<h1>
		<a class="head" href="http://117.17.143.71:8080/miniproject/">Chinsa.</a>
	</h1>
	</header>


	<div class="menu">
		<nav> <a class="login"
			href="http://117.17.143.71:8080/miniproject/user/signin">로그인</a> <a
			class="join" href="http://117.17.143.71:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr color=black>
	</div>

	<br>
	<br>
	<div>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/mini0shark/miniproject.git
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td><img src="${vo.pImg}" width="340px" height="300" /></td>
				<td>
					<table style="height: 300px; width: 400px;">
						<tr align="center">
							<td><font id="pNo">상품명</font></td>
							<td>${vo.pName}</td>
						</tr>
						<tr align="center">
							<td>가격</td>
							<td>${vo.pPrice}</td>
						</tr>
						<tr align="center">
							<td>판매자</td>
							<td>${vo.pSeller}/${user.uName}</td>
						</tr>
						<tr align="center">
							<td>전화번호</td>
							<td>${user.uPhone}</td>
						</tr><tr align="center">
							<td>E-mail</td>
							<td>${user.uEmail}</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<form name="form1" method="post" action="">
									<input type="hidden" name="productId" value=""> <select
										name="method" id="method">
										<option value="">--구매방법--</option>
										<option value="direct">직거래</option>
										<option value="delivery">택배거래</option>
									</select>
									<button type="button" id="requestButton">구매 요청</button>
								</form>
							</td>
						</tr>
						<tr>
							<a href="#?pSeller=${vo.pSeller}">판매자의 판매목록</a>
						</tr>
					</table>
			</tr>
			<tr>
				<td style="text-align: center;">
					<button type="button" onclick="add()">등록</button>
				</td>
			</tr>
		</table>
		<br>
		<br> <br>
		<div id="pInfo">${vo.pInfo}</div>
		<br> <br>
		<h1 align=center>Comment</h1>
		<hr style="border: 2px solid black; width: 1000px;">

		<!-- 댓글창 만들기 -->
		<!-- 댓글창 만들 때 필요한 것, 댓글 번호(삭제나 수정시 필요), 글 번호(해당 글의 댓글만 가져올 때 필요)
	, 작성날짜(댓글 정렬), 작성자의 이름 -->
		<div>
			<table class="commentTable">
				<tr>
					<th style="text-align: center; width: 980px; height: 20px;"></th>
				</tr>
				<tr>
					<td style="text-align: center; width: 980px; height: 50px;">
						<input type="text" style="width: 980px; height: 50px;" id = "textarea">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<button type="button" onclick="add()">등록</button>
					</td>
				</tr>
			</table>
			<br>

			<!-- 여기는 해당 글 번호에 존재하는 모든 댓글들을 가져와 출력 -->
			<!-- 작성자 이름, 작성 날짜 -->
			<table class="commentTable">
				<tr style="text-align: center;">
					<th class = "commentTh-th-1">번호</th>
					<th class = "commentTh-th-1">작성자 </th>
					<th class = "commentTh-th-2" width="500px">댓글</th>
					<th class = "commentTh-th-1">시간</th>
					<th class = "commentTh-th-1">/</th>
				</tr>
			</table>
			<table class="commentTable" id = "comment">
				<tr style="text-align: center;">
					<th class = "commentTh-th-1"></th>
					<th class = "commentTh-th-1"></th>
					<th class = "commentTh-th-2" width="500px"></th>
					<th class = "commentTh-th-1"></th>
					<th class = "commentTh-th-1"></th>
				</tr>
			</table>
		</div>
	</div>

	<script type="text/javascript">
	const requestButton = document.querySelector('#requestButton');
	requestButton.addEventListener('click', function(){
		const buyRequest = new XMLHttpRequest();
		buyRequest.addEventListener('load', function(){
			msg = this.responseText;
			if(msg==='success'){
				alert('구매요청이 완료되었습니다.');
			}
			else if(msg==='fail')
				alert('구매요청에 실패하였습니다.(DB Error)');
			else if(msg ==='notIng')
				alert('판매대기중인 상품이 아닙니다.');
			else if(msg === 'notLogin'){
				alert('로그인이 필요합니다.');
				location.href='../user/signin';
			}
		});
		buyRequest.open('post', 'http://117.17.143.71:8080/miniproject/api/buylist/add');
		buyRequest.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		buyRequest.send(JSON.stringify({"pNo":${vo.pNo} }));
	});

	init();
	function init(){
		const login = document.querySelector('.login');
		const join = document.querySelector('.join');
		var loginState = true;
		const req = new XMLHttpRequest();
		req.addEventListener('load', function(){
			var hasStoredId = this.responseText;
			if(hasStoredId==="true")
			loginState = true;
			else
			loginState = false;

			if(loginState){
				login.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/logout?id="+hasStoredId);
				login.innerHTML= "로그아웃";
				join.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/mypage");
				join.innerHTML="마이페이지";
			}
			else{
				login.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/signin");
				login.innerHTML= "로그인";
				join.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/signup");
				join.innerHTML="회원가입";
			}

		});
		req.open('post', "http://117.17.143.71:8080/miniproject/api/user/checkLogin");
		req.send();

		const commentRequest = new XMLHttpRequest();
		commentRequest.addEventListener('load', function(){
			showList(this.responseText);
		});
		commentRequest.open('get', 'http://117.17.143.71:8080/miniproject/api/comment/load?pNo=${vo.pNo}');
		commentRequest.send();
	}


	function showList(jsonList){
		const jsonData = JSON.parse(jsonList);
		const size = Object.keys(jsonData).length;
		for(var i = 0; i<size; i++){
			jsonData[i].pName
			createComment(jsonData[i].cNo, jsonData[i].cUid, jsonData[i].cContent, jsonData[i].cTime);
		}
	}




	function add(){

		const commentRegisterRequest = new XMLHttpRequest();
	    const comment = document.querySelector('#textarea').value;
		commentRegisterRequest.addEventListener('load', function(){
		    document.querySelector("#textarea").value = '';
			const jsonData = JSON.parse(this.responseText);
			;
			createComment(jsonData.cNo, jsonData.cUid, jsonData.cContent, jsonData.cTime);
		});
		commentRegisterRequest.open('post','http://117.17.143.71:8080/miniproject/api/comment/commentresister');
		commentRegisterRequest.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		commentRegisterRequest.send(JSON.stringify({
			"comment":comment,
			"pNo":"${vo.pNo}"
		}));
		}
	function createComment(cNo, writer, comment, time){
		const table = document.querySelector('#comment');
	    const tr = document.createElement('tr');
	    const cNoTd = document.createElement('td');
	    const writeTd = document.createElement('td');
	    const commentTd = document.createElement('td');
	    const timeTd = document.createElement('td');
	    const button = document.createElement('button');
	    const buttonTd = document.createElement('td');
	    button.innerHTML = "삭제";


	    button.addEventListener('click', function(){
	    	const deleteCommentRequest = new XMLHttpRequest();
	    	deleteCommentRequest.addEventListener('load', function(){
	    		const result = this.responseText;
	    		var resultMsg = '';
	    		if(result === 'deleted'){
		    		button.parentNode.parentNode.remove();
		    		resultMsg = '삭제되었습니다.';
	    		}
	    		else{
	    			resultMsg = '정상적으로 삭제되지 뭇했습니다.';
	    		}
    			alert(resultMsg);
	    	});
	    	deleteCommentRequest.open('delete', 'http://117.17.143.71:8080/miniproject/api/comment/deletecomment');
	    	deleteCommentRequest.setRequestHeader("Content-Type","application/json;charset=UTF-8");
	    	deleteCommentRequest.send(JSON.stringify({
	    		"cNo":cNo
	    	}));
	    });

	    cNoTd.appendChild(document.createTextNode(cNo));
	    writeTd.appendChild(document.createTextNode(writer));
	    commentTd.appendChild(document.createTextNode(comment));
	    timeTd.appendChild(document.createTextNode(time));
	    buttonTd.appendChild(button);
	    cNoTd.setAttribute('style','text-align: center;');
	    writeTd.setAttribute('style','text-align: center;');
	    commentTd.setAttribute('style','text-align: center; word-break:break-all;');
	    commentTd.setAttribute('width', "500px");
	    timeTd.setAttribute('style','text-align: center;');
	   	buttonTd.setAttribute('style','text-align: center;');

	   	tr.appendChild(cNoTd);
	    tr.appendChild(writeTd);
	    tr.appendChild(commentTd);
	    tr.appendChild(timeTd);
	    tr.appendChild(buttonTd);
	   	table.appendChild(tr);
	}

	</script>

</body>
</html>
