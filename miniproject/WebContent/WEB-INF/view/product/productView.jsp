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
					<th>작성자: </th>
					<th>작성날짜:</th>
				</tr>
			</table>
			<table class="commentTable" id = "comment">
				<tr style="text-align: center;">
					<!-- 댓글 에리어, 수정 삭제 버튼 -->
					<td style="text-align: center;">댓글이다</td>
					<td style="text-align: center;">
						<button>삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<script type="text/javascript">
	const requestButton = document.querySelector('#requestButton');
	requestButton.addEventListener('click', function(){
		const checkpStateRequest = new XMLHttpRequest();
    const pNo = document.querySelector('#pNo').innerHTML;
		checkpStateRequest.addEventListener('load', function(){
			msg = this.responseText;
			if(msg==='ing'){
				const requestRequest = new XMLHttpRequest();
				requestRequest.addEventListener('load',function(){
					const result = this.responseText;
					var resultText = '';
					console.log('---')
					if(result==='true'){
						resultText = '요청에 성공했습니다. 거래 중 목록에서 확인하세요';
						location.href='';
					}
					else if(result ==='notLogin'){
						resultText = '로그인이 필요한 서비스 입니다.';
					}
					else{
						resultText = '알수 없는 원인으로 중지됐습니다.';
					}
					alert(resultText);
				});
				requestRequest.open('post', 'http://117.17.143.71:8080/miniproject/api/product/buyrequest');
				requestRequest.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
				requestRequest.send(JSON.stringify({"pNo":"${vo.pNo}"}));
			}
			else if(msg==='cancel')
				console.log('판매자가 상품을 내렸습니다.');
			else if(msg ==='sold')
				console.log('이미 판매된 상품입니다.');
		});
		checkpStateRequest.open('get', 'http://117.17.143.71:8080/miniproject/api/product/checkpstate?pNo=${vo.pNo}&method='+document.querySelector("#method").value);
		checkpStateRequest.send();
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

		const initProductListRequest = new XMLHttpRequest();
		initProductListRequest.addEventListener('load', function(){
			const productListJson = this.responseText;
		});
		initProductListRequest.open('get','http://117.17.143.71:8080/miniproject/api/product/initproduct');
		initProductListRequest.send();
	}
	
	
	function add(){
		
		const commentRegisterRequest = new XMLHttpRequest();
	    const textarea = document.querySelector("#textarea").value;
		commentRegisterRequest.addEventListener('load', function(){
			const table = document.querySelector('#comment');
		    const tr = document.createElement('tr');
		    const td = document.createElement('td');
		    const td2 = document.createElement('td');
		    const button = document.createElement('button');
		    document.querySelector("#textarea").value = '';
		    tr.appendChild(td);
		    td.appendChild(document.createTextNode(textarea));
		    td2.appendChild(button);
		    td.setAttribute('style','text-align: center;');
		    td2.setAttribute('style','text-align: center;');
		    tr.appendChild(td2);
		    button.innerHTML = "삭제";
		   	table.appendChild(tr);
		   	
		   	console.log(this.responseText);//==> 사용자 id 리턴
		});
		commentRegisterRequest.open('post','http://117.17.143.71:8080/miniproject/api/product/commentresister');
		commentRegisterRequest.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		commentRegisterRequest.send(JSON.stringify({
			"comment":textarea
		}));
		}
	
	</script>

</body>
</html>
