<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
<head>
<title>마이 페이지</title>
<style>
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

.menu {
	background: #fff;
	margin-top: 150px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}

a.logout:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.logout:visited {
	color: #CC0000;
	text-decoration: none;
}

a.logout:hover {
	color: black;
	text-decoration: none;
}

a.home:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.home:visited {
	color: #CC0000;
	text-decoration: none;
}

a.home:hover {
	color: black;
	text-decoration: none;
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

.search {
	display: inline-block;
	width: 366px;
	height: 34px;
	border: 3px solid white;
	background: white;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 40px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: white;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

.sch_smit:hover {
	background: white;
}
</style>

<!-- 초기화 -->
<style>
li {
	list-style: none;
}

a {
	text-decoration: none;
}

div::selection {
	background: gray;
	color: purple;
}
</style>

<!-- 헤더 -->
<style>
#main_header {
	/* 중앙 정렬*/
	width: 960px;
	margin: 0 auto;
	/* 절대 좌표 */
	height: 160px;
	position: relative;
}
</style>

<!-- 타이틀 -->
<style>
#title {
	color: #393839;
	font-size: 150%;
	text-align: center;
}
</style>

<style>
.main_article {
	margin-bottom: 10px;
	padding: 20px;
	border: 10px solid black;
	background-color: #ffffff;
	color: black;
	opacity: 0.9;
	height: auto;
}
</style>

<!-- 콘텐츠 -->
<style>
#content {
	/* 중앙 정렬 */
	width: 1000px;
	margin: 0 auto;
	position: relative;
	/* 수평 레이아웃 구성 */
	overflow: hidden;
}

#content>#main_aside {
	width: 980px;
	float: left;
	position: relative;
	left: 0px;
	margin: 10px auto;
}

#content>.main_section {
	width: 640px;
	float: left;
}

.main_aside {
	background: white;
	width: 200px;
	position: absolute;
	right: 0px;
}

#main_aside>ul>li {
	transition: background .9s ease-in-out;
	transition-property: background-color;
	transition-duration: 1s; /* 1000밀리초와 같다 */
	transition-timing-function: linear;
	transition-delay: .5s; /* 500밀리초 */
	background: white;
}

#main_aside>ul>li:hover {
	background: #0A82FF;
}
</style>

<!-- 사이드 -->
<style>

/* 첫 번째 탭 */
input:nth-of-type(1) {
	display: none;
}

input:nth-of-type(1) ~ article:nth-of-type(1) {
	display: none;
}

input:nth-of-type(1):checked ~ article:nth-of-type(1) {
	display: block;
}

/* 두 번째 탭 */
input:nth-of-type(2) {
	display: none;
}

input:nth-of-type(2) ~ article:nth-of-type(2) {
	display: none;
}

input:nth-of-type(2):checked ~ article:nth-of-type(2) {
	display: block;
}

/* 탭 모양 구성 */
section.buttons {
	overflow: hidden;
}

section.buttons>label {
	/* 수평 정렬 */
	display: block;
	float: left;
	/* 크기 및 글자 위치 지정*/
	width: 200px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	/* 테두리 지정 */
	box-sizing: border-box;
	border: 1px solid black; /* #0A82FF */
	/* 색상 지정*/
	background: white;
	color: black;
}

label {
	border-radius: 10px 10px 0 0;
}

input:nth-of-type(1):checked ~ section.buttons>label:nth-of-type(1) {
	background: black;
	color: white;
}

input:nth-of-type(2):checked ~ section.buttons>label:nth-of-type(2) {
	background: black;
	color: white;
}

</style>

<style>
.bodytexts {
	font-family: 'Dotum', cursive;
	font-size: 12px;
}

ul.mylist li {
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	border-bottom: 5px solid #efefef;
	font-size: 12px;
}

table {
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	border-bottom: 5px solid #efefef;
	font-size: 12px;
}

#upgrade, #black, #back, .delete {
	float: right;
}
</style>
</head>





<body>
	

	<header>
		<h1>
			<a class="head" href="http://117.17.143.71:8080/miniproject/">Chinsa.</a>
		</h1>
	</header>
	<div class="menu">
		<nav>
		<span class="search">
				<input type='text' class='input_text'/>
		</span>
				<a class="login" href="http://117.17.143.71:8080/miniproject/user/signin">로그인</a>
				<a class="join" href="http://117.17.143.71:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr style="border: 1px solid black;">
	</div>
	
	<form>
		<div id ="box">
			
			<br>
			<center>
				<button id="edit" type="button">회원정보수정</button>
				<button id="out" type="button">회원탈퇴</button>
				<button id="regi" type="button">상품등록</button>
			</center>
		</div>
	</form>


	<div id="content">
		<aside id="main_aside">
			<input id="first" type="radio" name="tab" checked="checked" />
			<input id="second" type="radio" name="tab" />

			<section class="buttons">
				<label for="first"><b>구매 내역</b></label>
				<label for="second"><b>판매 내역</b></label>
			</section>

			<article class="main_article">
				<h1>구매 내역</h1>
				<div class="bodytexts">
					<br> <br>
					<table style="width: 80%" id="buyTable">
						<tr>
							<td>구매번호</td>
							<td>상품명</td>
							<td>판매자</td>
							<td>거래상태</td>
							<td>가격</td>
							<td>요청날짜</td>
						</tr>
					</table>
				</div>
	</article>

			<article class="main_article">
				<h1>판매 내역</h1>
				<div class="bodytexts">
					<br> <br>
					<table style="width: 80%" id="sellTable">
						<tr>
							<td>구매번호</td>
							<td>상품명</td>
							<td>구매자</td>
							<td>거래상태</td>
							<td>가격</td>
							<td>요청날짜</td>
							<button class="delete" type="button">삭제</button>
						</tr>
					</table>
				</div>
	</article>
	</aside>
	</div>
	</form>	
	
	<script type="text/javascript">
		const btn = document.querySelector("#edit");
		const btn2 = document.querySelector("#out");
		const btn3 = document.querySelector("#regi");
		const buyTable = document.querySelector("#buyTable");
		const sellTable = document.querySelector("#sellTable");
		
		btn.addEventListener('click', function() {
			location.href = "../user/update";
		});

		btn2.addEventListener('click', function() {
			location.href= "../";
		});
		
		btn3.addEventListener('click', function() {
			location.href= "http://117.17.143.71:8080/miniproject/product/registration";
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
					login.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/logout");
					login.innerHTML= "로그아웃";
					join.setAttribute('href', "http://117.17.143.71:8080/miniproject/user/mypage");
					join.innerHTML="마이페이지";
				}
				else{
					alert("로그인이 필요한 서비스 입니다.");
					location.href= "http://117.17.143.71:8080/miniproject/user/signin";
				}

			});
			req.open('post', "http://117.17.143.71:8080/miniproject/api/user/checkLogin");
			req.send();
		}
		getTable();
		function getTable(){
			
			const req1 = new XMLHttpRequest();
			req1.addEventListener('load', function(){
				var json = JSON.parse(this.responseText);
				const size = Object.keys(json).length;
				for(i=0; i<size; i++){
					const tr = document.createElement('tr');
					let td = new Array(6);
					for(j=0; j<6; j++)
						td[j] = document.createElement('td');
					td[0].appendChild(document.createTextNode(json[i].bNo));
					td[1].appendChild(document.createTextNode(json[i].bName));
					td[2].appendChild(document.createTextNode(json[i].bSeller));
					td[3].appendChild(document.createTextNode(json[i].bState));
					td[4].appendChild(document.createTextNode(json[i].bPrice));
					td[5].appendChild(document.createTextNode(json[i].bTime));
					for(j=0; j<6; j++){
						tr.appendChild(td[j]);
					}
					const button = document.createElement('button');
					button.type = 'button';
					button.class = 'delete';
					button.value = json[i].bPno;
					button.appendChild(document.createTextNode("취소"));
					button.addEventListener('click', function(){
						const req2 = new XMLHttpRequest();
						const button = event.target;
						req2.addEventListener('load', function(){
							if(this.responseText==='success'){
								alert('취소 완료헀습니다.');
								button.parentNode.remove();
							}
							else{
								alert("삭제할 수 없습니다.");
							}
						});
						req2.open('post', 'http://117.17.143.71:8080/miniproject/api/buylist/delete');
						req2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
						var pNo = event.target.value*= 1;
						req2.send(JSON.stringify({
							"pNo":pNo
						}));
					});
					tr.appendChild(button);
					buyTable.appendChild(tr);
				}
			});
			req1.open("get", "http://117.17.143.71:8080/miniproject/api/buylist/getdata?bBuyer="+"${user.uId}");
			req1.send();
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			const req4 = new XMLHttpRequest();
			req4.addEventListener('load', function(){
				var json = JSON.parse(this.responseText);
				const size = Object.keys(json).length;
				for(i=0; i<size; i++){
					const tr = document.createElement('tr');
					let td = new Array(6);
					for(j=0; j<6; j++)
						td[j] = document.createElement('td');
					td[0].appendChild(document.createTextNode(json[i].sNo));
					td[1].appendChild(document.createTextNode(json[i].sName));
					td[2].appendChild(document.createTextNode(json[i].sSeller));
					td[3].appendChild(document.createTextNode(json[i].sState));
					td[4].appendChild(document.createTextNode(json[i].sPrice));
					td[5].appendChild(document.createTextNode(json[i].sTime));
					for(j=0; j<6; j++){
						tr.appendChild(td[j]);
					}
					const button = document.createElement('button');
					const button2 = document.createElement('button');
					button.type = 'button';
					button.class = 'delete';
					button.value = json[i].sPno;
					button.appendChild(document.createTextNode("판매완료"));
					button.addEventListener('click', function(){
						const req3 = new XMLHttpRequest();
						const button = event.target;
						req3.addEventListener('load', function(){
							if(this.responseText==='success'){
								alert('판매 확정했습니다.');
								//button.parentNode.remove();
							}
							else{
								alert("판매 확정을 못합니다.");
							}
						});
						req3.open('post', 'http://117.17.143.71:8080/miniproject/api/selllist/update');
						req3.setRequestHeader("Content-Type","application/json;charset=UTF-8");
						var pNo = event.target.value*= 1;
						req3.send(JSON.stringify({
							"pNo":pNo
						}));
					});

					button2.value = json[i].sPno;
					button2.appendChild(document.createTextNode("취소"));
					button2.addEventListener('click', function(){
						const req3 = new XMLHttpRequest();
						const button = event.target;
						req3.addEventListener('load', function(){
							if(this.responseText==='success'){
								alert('취소 완료헀습니다.');
								button.parentNode.remove();
							}
							else{
								alert("삭제할 수 없습니다."+this.responseText);
							}
						});
						req3.open('post', 'http://117.17.143.71:8080/miniproject/api/selllist/delete');
						req3.setRequestHeader("Content-Type","application/json;charset=UTF-8");
						var pNo = event.target.value*= 1;
						req3.send(JSON.stringify({
							"pNo":pNo
						}));
					});
					tr.appendChild(button);
					tr.appendChild(button2);
					sellTable.appendChild(tr);
				}
			});
			req4.open("get", "http://117.17.143.71:8080/miniproject/api/selllist/getdata?sSeller="+"${user.uId}");
			req4.send();
		}
		
		
	</script>
</body>
</html>