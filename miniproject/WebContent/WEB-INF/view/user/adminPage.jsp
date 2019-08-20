<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관리자 페이지</title>
<style>
body {
	font-family: 'Poiret One', cursive;
	background-image: url('sm3.jpg');
	background-size: 70%;
	background-position: center -10%;
	background-repeat;
}
</style>
<!-- 초기화 -->
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Poiret One', cursive;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

img {
	border: 0;
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

#main_header>#title {
	position: absolute;
	left: -100px;
	top: 30px;
}
</style>

<!-- 타이틀 -->
<style>
#title {
	font-family: 'Poiret One', cursive;
	color: #393839;
	font-size: 150%;
	text-align: center;
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
<!-- 본문 -->
<style>
.main_article {
	margin-bottom: 10px;
	padding: 20px;
	border: 10px solid #0A82FF;
	background-color: #ffffff;
	color: black;
	opacity: 0.9;
	font-family: 'Poiret One', cursive;
	height: auto;
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

/* 네 번째 탭 */
input:nth-of-type(4) {
	display: none;
}

input:nth-of-type(4) ~ article:nth-of-type(4) {
	display: none;
}

input:nth-of-type(4):checked ~ article:nth-of-type(4) {
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
	border: 1px solid #0A82FF;
	/* 색상 지정*/
	background: #0A82FF;
	color: white;
}

label {
	border-radius: 10px 10px 0 0;
}

input:nth-of-type(1):checked ~ section.buttons>label:nth-of-type(1) {
	background: white;
	color: #0A82FF;
}

input:nth-of-type(2):checked ~ section.buttons>label:nth-of-type(2) {
	background: white;
	color: #0A82FF;
}

input:nth-of-type(3):checked ~ section.buttons>label:nth-of-type(3) {
	background: white;
	color: #0A82FF;
}

input:nth-of-type(4):checked ~ section.buttons>label:nth-of-type(4) {
	background: white;
	color: #0A82FF;
}
</style>

<!-- 내가 만든 사이드2 -->
<style>
.enter {
	overflow: hidden;
	padding: 10px;
	border: 1px dotted #0A82FF;
	margin: 1px;
	background-color: white;
}

.enter2 {
	text-align: center;
}

.enter3 {
	text-align: center;
	border: 1px solid #ffffff;
	background-color: white;
	position: absolute;
	bottom: 0px;
	width: 180px;
}

.bodytexts {
	font-family: 'Dotum', cursive;
	font-size: 12px;
}

.top {
	overflow: hidden;
	padding: 10px; border 1px solid #0A82FF;
	backgrund-color: #0A82FF;
	text-align: center;
}
</style>

<!-- 목록 -->
<style>
.item {
	overflow: hidden;
	padding: 10px;
	border: 1px solid black;
	border-top: none;
	background-color: white;
}

.thumbnail {
	float: left;
}

.description {
	float: left;
	margin-left: 10px;
	font-family: 'Dotum', cursive;
	font-size: 14px;
}

.description>strong {
	display: block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tab_item {
	overflow: hidden;
	width: 760px;
	margin: 0 auto;
}
</style>
<!-- 푸터 -->
<style>
#main_footer {
	position: absolute;
	right: -5px;
	width: 180px;
	height: 90px;
	background:
		url("http://cfile23.uf.tistory.com/image/227668385692351B34D823");
	margin-top: 40px;
	-webkit-transition: 2s steps(16);
	transition: 2s steps(16);
}

#main_footer:hover {
	background-position: -2000px 0;
}
</style>
</head>







<header id="main_header">
    <div id="title">
        <h1>
            <b>Chinsa.</b>
        </h1>
    </div>
</header>


<div id="content">
	<aside id="main_aside">
        <input id="first" type="radio" name="tab" checked="checked" />
        <input id="second" type="radio"	name="tab" />
        <input id="third" type="radio" name="tab" />

        <section class="buttons">
            <label for="first"><b>회원 관리</b></label>
            <label for="second"><b>상품 관리</b></label>
            <label for="third"><b>블랙리스트</b></label>
        </section>
    
        <article class="main_article">
            <h1>회원 관리</h1>
            <div class="bodytexts">
               내용 삽입
            </div>
        </article>

        <article class="main_article">
            <h1>상품 관리</h1>
            <div class="bodytexts">
               내용 삽입
            </div>
        </article>

        <article class="main_article">
            <h1>블랙리스트</h1>
            <div class="bodytexts">
               내용 삽입
            </div>
        </article>
    </aside>
</div>

</div>
</body>
</html>