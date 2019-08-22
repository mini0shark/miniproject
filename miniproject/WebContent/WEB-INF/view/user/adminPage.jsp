<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
<head>
<title>관리자 페이지</title>
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

/* 세 번째 탭 */
input:nth-of-type(3) {
	display: none;
}

input:nth-of-type(3) ~ article:nth-of-type(3) {
	display: none;
}

input:nth-of-type(3):checked ~ article:nth-of-type(3) {
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
	background: black;
	color: white;
}

label {
	border-radius: 10px 10px 0 0;
}

input:nth-of-type(1):checked ~ section.buttons>label:nth-of-type(1) {
	background: white;
	color: black;
}

input:nth-of-type(2):checked ~ section.buttons>label:nth-of-type(2) {
	background: white;
	color: black;
}

input:nth-of-type(3):checked ~ section.buttons>label:nth-of-type(3) {
	background: white;
	color: black;
}

input:nth-of-type(4):checked ~ section.buttons>label:nth-of-type(4) {
	background: white;
	color: black;
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

#upgrade, #black, #back, #out {
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
			<span class="search"> <input type='text' class='input_text' />
			</span> <a class="home" href="http://117.17.143.71:8080/miniproject/">메인</a> <a
				class="logout" href="http://117.17.143.71:8080/miniproject/">로그아웃</a>
		</nav>
		<hr color=black>
	</div>


	<div id="content">
		<aside id="main_aside">
			<input id="first" type="radio" name="tab" checked="checked" />
			<input id="second" type="radio" name="tab" />
			<input id="third" type="radio" name="tab" />

			<section class="buttons">
				<label for="first"><b>회원 관리</b></label>
				<label for="second"><b>상품 관리</b></label>
				<label for="third" id="black2"><b>블랙리스트</b></label>
			</section>

			<article class="main_article">
				<h1>회원 관리</h1>
				<div class="bodytexts">
					<br>
					<h2>회원 목록</h2>
					<br>
					<ul class="mylist">
						<li>회원1
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
						<li>회원2
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
						<li>회원3
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
						<li>회원4
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
						<li>회원5
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
						<li>회원6
							<button id="upgrade" type="button">등업</button>
							<button id="black" type="button">블랙</button>
						</li>
					</ul>
				</div>
			</article>


			<article class="main_article">
				<h1>상품 관리</h1>
				<div class="bodytexts">
					<br> <br>
					<table style="width: 80%">
						<tr>
							<td>번호</td>
							<td>상품명</td>
							<td>가격</td>
							<td>등록일</td>
							<button id="back" type="button">복귀</button>
							<button id="out" type="button">삭제</button>
						</tr>
					</table>
				</div>
	</article>


	<article class="main_article">
		<h1>블랙리스트</h1>
		<div class="bodytexts">
			<br>
			<h2>회원목록</h2>
			<br>
			<ul class="mylist">
				<li>회원1
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
				<li>회원2
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
				<li>회원3
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
				<li>회원4
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
				<li>회원5
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
				<li>회원6
					<button id="back" type="button">복귀</button>
					<button id="out" type="button">탈퇴</button>
				</li>
			</ul>
		</div>
	</article>
	</aside>
	</div>

</body>
</html>