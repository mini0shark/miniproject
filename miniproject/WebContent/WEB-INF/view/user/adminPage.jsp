<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
<head>
<title>관리자 페이지</title>
<style>
header {
	background: #fff;
	height: 150px;
	width: 100%;
	position: fixed;
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
	margin-top: 20px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}
</style>

<!-- 초기화 -->
<style>
* {
	margin: 0;
	padding: 0;
}

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
</style>
</head>







<header id="main_header">
	<div id="title">
		<h1>
			<a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a>
		</h1>
	</div>
</header>

<div class="menu">
	<nav>
		<span class="search">
			<input type='text' class='input_text' />
		</span>
		<a class="home" href="http://localhost:8080/miniproject/">메인</a>
		<a class="logout" href="http://localhost:8080/miniproject/">로그아웃</a>
	</nav>
</div>

<hr style="border: 1px solid black;">

<div id="content">
	<aside id="main_aside">
		<input id="first" type="radio" name="tab" checked="checked" /> <input
			id="second" type="radio" name="tab" /> <input id="third"
			type="radio" name="tab" />

		<section class="buttons">
			<label for="first"><b>회원 관리</b></label> <label for="second"><b>상품
					관리</b></label> <label for="third"><b>블랙리스트</b></label>
		</section>

		<!-- 회원 관리 탭 -->
		<article class="main_article">
			<h1>회원 관리</h1><hr><br>
			<div class="bodytexts">
				<div style="border: 1px solid black; paddding: 10px; height: 100px;">asdfasdf</div>
			</div>
		</article>

		<!-- 상품 관리 탭 -->
		<article class="main_article">
			<h1>상품 관리</h1>
			<div class="bodytexts">내용 삽입</div>
		</article>

		<!-- 블랙리스트 탭 -->
		<article class="main_article">
			<h1>블랙리스트</h1>
			<div class="bodytexts">내용 삽입</div>
		</article>
	</aside>
</div>

</div>
</body>
</html>