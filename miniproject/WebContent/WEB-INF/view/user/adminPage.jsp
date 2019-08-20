<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>modern Hayeon</title>
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
		<b>JYP Entertainment</b>
	</h1>
	<h2>LEE HA YEON</h2>
</div>
<footer id="main_footer">
<div class="enter3">
	<a
		href="file:///C:/Users/gotca/Desktop/%EB%B3%B4%EB%82%B4%EC%A3%BC%EA%B8%B0/modern2.html#">Main
		Home Move</a>
</div>
</footer> </header>


<div id="content">
	<aside id="main_aside"> <input id="first" type="radio"
		name="tab" checked="checked" /> <input id="second" type="radio"
		name="tab" /> <input id="third" type="radio" name="tab" /> <input
		id="fourth" type="radio" name="tab" /> <section class="buttons">
	<label for="first"><b>TWICE</b></label> <label for="second"><b>WONDER
			GIRLS</b></label> <label for="third"><b>MISS A</b></label> <label for="fourth"><b>A
			YEON BAEK</b></label> </section> <article class="main_article"> </br>
	<h1 class="bodytexts"">멤버소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		트와이스(TWICE)는 대한민국의 지효, 나연, 정연,모모,사나,미나,다현,채영,쯔위로 구성된 9인조 걸그룹으로, JYP
		엔터테인먼트 소속이다. 팀명의 의미는 "눈으로 한 번, 귀로 한 번 감동을 준다"는 뜻을 담고 있다. 2015년 5월 5일부터
		7월 7일까지 진행된 서바이벌 프로그램 Mnet 《SIXTEEN》을 통해 9명의 최종 멤버들이 선발되었으며, 2015년 10월
		19일 타이틀곡 "OOH-AHH하게" 뮤직비디오와 음원을 공개하고, 20일 첫 번째 EP 앨범 《THE STORY
		BEGINS》 발매와 동시에 데뷔 쇼케이스로 데뷔하였다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">앨범소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		"컬러팝" 이라는 새로운 음악 장르로 많은 사랑을 받았던 “트와이스”가 이번에는 “Future Electro Pop” 이라는
		새로운 음악 장르를 선보인다. 이번 타이틀곡 “LIKEY“는 기존의 “컬러팝”보다 더욱 세련되고 POP 적인 요소가 많이
		가미된 “Future Electro Pop” 댄스 곡으로서 데뷔 때부터 함께 해온 '블랙아이드필승' 프로듀서가
		“TWICE”만을 위해 야심 차게 만든 히든 트랙이다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">뮤비</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div>
		<iframe width="584" height="270"
			src="https://www.youtube.com/embed/V2hlQkVJZhE" frameborder="0"
			gesture="media" allow="encrypted-media" allowfullscreen></iframe>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">기사 : 트와이스, 모든 노래 뮤직비디오 유튜브 1억뷰 돌파</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		트와이스의 인기가 고공 행진 중이다. 3일 소속사 JYP엔터테인먼트에 따르면 지난달 30일 공개된 트와이스의 첫 정규 앨범
		'트와이스타그램'(Twicetagram) 타이틀곡 '라이키'는 이날 오후 5시 43분 유튜브 조회수 1억건... <a
			href="hhttp://www.kukinews.com/news/article.html?no=506231">ARTICLE
			이동</a></br>
		</br>
	</div>
	<hr />
	<hr />
	</br>
	</br>
	</article> <article class="main_article"> </br>
	<h1 class="bodytexts"">멤버소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		원더걸스(Wonder Girls)는 대한민국의 4인조 걸 그룹으로, 소속사는 JYP 엔터테인먼트였다. 박진영이 프로듀싱을 맡은
		그룹으로, 2001년 오디션을 통해 선발된 선예를 필두로 현아, 소희, 선미, 예은을 차례대로 멤버로 발탁해 5인조로 데뷔하게
		된다. 2007년 2월 13일 싱글 〈The Wonder Begins〉 을 발매하면서 데뷔했다. 같은 해 7월 멤버 현아가
		건강상 문제로 탈퇴했고, 유빈이 새로운 멤버로 합류했다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">앨범소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		타이틀곡 'Why So Lonely'는 원더걸스의 첫 자작 타이틀곡으로, 데뷔 이래 9년 동안 박진영이 만든 노래로 타이틀곡을
		삼아온 원더걸스가 박진영의 품을 떠나 진정한 아티스트로써 성장해 내놓은 값진 결과물이다. 'Why So Lonely'는
		원더걸스가 처음 시도하는 레게팝 장르의 곡으로, 중독성 있는 기타 리프와 다채로운 리듬의 변화에 따른 분위기의 전환이 매력적인
		노래다. '너도 나만큼 빠져야 하는데', '너만 멋져 내 마음만 다쳐' 등 연인 사이에 느끼는 시니컬한 내용을 사랑스럽고 위트
		있는 가사로 표현해냈다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">뮤비</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div>
		<iframe width="584" height="270"
			src="https://www.youtube.com/embed/PYGODWJgR-c" frameborder="0"
			gesture="media" allow="encrypted-media" allowfullscreen></iframe>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">기사 : 원더걸스 ‘Why So Lonely’ 아이튠즈 차트서도
		1위…세계적인 인기</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		그룹 원더걸스의 신곡 'Why So Lonely'가 전세계 아이튠즈 차트에서도 1위를 거머쥐었다. 원더걸스는 지난 5일 싱글
		앨범 'Why So Lonely'를 발매, 동명의 타이틀곡 'Why So Lonely'가 6일 오전 9시 기준 베트남, 태국,
		필리핀 등 아이튠즈 앨범 차트 1위를 차지했다.... <a
			href="http://www.asiatoday.co.kr/view.php?key=20160706001106092">ARTICLE
			이동</a></br>
		</br>
	</div>
	<hr />
	<hr />
	</br>
	</br>
	</article> <article class="main_article"> </br>
	<h1 class="bodytexts"">멤버소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		미쓰에이(miss A)는 다국적 2인조 걸 그룹이다. 소속사는 JYP 엔터테인먼트이다. 미쓰에이라는 이름은 "모든 면에서
		A클래스급 실력을 지닌 뒤 아시아 최고가 되겠다"는 의미를 갖고 있다. 2010년 7월 1일 첫 번째 싱글 "Bad But
		Good"을 발매해 데뷔했다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">앨범소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		"다름남자 말고 너"는 썸은 끝났다. 여자들의 적극적인 사랑방식을 대변해주는 곡. 당당했던 miss A답게 직설적으로 ‘너’를
		지칭하면서 다른 남자가 아닌 자신이 원하는 남자를 말한다. 자신이 원하는 남자와 하는 사랑은 뻔한 방식이 아니라고 말하는 곡.
		씨스타의 ‘Touch my body’를 프로듀싱했던 블랙아이드 필승의 곡으로 대중적인 힙합과 트랩 리듬이 인상적인 곡이다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">뮤비</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div>
		<iframe width="584" height="270"
			src="https://www.youtube.com/embed/zO9RzrhYR-I" frameborder="0"
			gesture="media" allow="encrypted-media" allowfullscreen></iframe>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">기사 : 미쓰에이 다른 남자 말고 너, 뮤비 조회수 2천만 돌파 '대박'</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		걸그룹 미쓰에이 다른 남자 말고 너 뮤직비디오가 조회수 2천만 건을 돌파했다. 미쓰에이 다른 남자 말고 너 뮤직비디오는 4일
		2000만 고지를 넘어선 뒤 오후 4시 현재 2천7만 건의 조회수를 기록 중이다... <a
			href="http://www.kyeonggi.com/news/articleView.html?idxno=974544">ARTICLE
			이동</a></br>
		</br>
	</div>
	<hr />
	<hr />
	</br>
	</br>
	</article> <article class="main_article"> </br>
	<h1 class="bodytexts"">멤버소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		백아연은 대한민국의 가수이다. 2011년 《K팝 스타》에 참가해 3위를 하였으며, 2012년 5월 JYP 엔터테인먼트와 계약을
		맺었다. 2012년 9월 10일 첫 번째 EP 음반 I'm Baek을 발매하며 데뷔했다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">앨범소개</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		이번 STATION의 곡은 백아연과 웬디의 듀엣곡으로, 두 사람의 보이스에 피아노 선율과 소규모 오케스트라가 잘 어우러진
		발라드 곡이다. 가사에는 동화 ‘성냥팔이 소녀’를 재해석하여, 내면의 외로움을 감추고 살아가는 현대인들에게 사랑을 호소하는
		내용을 담았다. </br>
		</br>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">뮤비</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div>
		<iframe width="584" height="270"
			src="https://www.youtube.com/embed/wfRVbaBQiF8" frameborder="0"
			gesture="media" allow="encrypted-media" allowfullscreen></iframe>
	</div>
	<hr />
	<hr />
	</br>

	<h1 class="bodytexts"">기사 : 백아연, 웬디와 함께 음원 발매…'JYP와 SM의 매력보이스
		두사람'</h1>
	</br>
	<hr />
	<hr />
	</br>
	<div class="bodytexts">
		30일 백아연은 자신의 인스타그램에 “티저영상 오늘 오후 6시 정식음원 발매 내일 오후 6시 #백아연 X #웬디 #성냥팔이소녀
		#TheLittleMatchGirl”라는 글과 함께 사진 한 장을 게재했다.... <a
			href="http://news.topstarnews.net/detail.php?number=332006">ARTICLE
			이동</a></br>
		</br>
	</div>
	<hr />
	<hr />
	</br>
	</br>
	</article> </aside>
</div>

</div>
</br>

</body>
</html>