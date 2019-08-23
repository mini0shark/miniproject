<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainpage</title>

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

.menu {
	background: #fff;
	margin-top: 150px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}

.goods {
	display: grid;
	grid-template-columns: 350px 350px 350px 350px;
	width: 1500px;
	margin: 0 13px;
	margin-top: 50px;
	text-align: center;
}

.good {
	width: 200px;
	float: left;
	padding: 20px;
	text-align: center;
	background-color: white;
}

.category {
	height: 300px;
	width: 250px;
	float: left;
}

.category a {
	color: white;
	text-decoration: none;
	display: block;
	cursor: pointer;
	text-transform: uppercase;
	font-size: 12px;
	font-weight: 500;
	letter-spacing: 0.2em;
	padding: 10px;
	margin: 0 0px;
	background: #000;
}

.category a:hover {
	background: white;
	color: black;
}

.category:after {
	content: '.';
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}

ul {
	list-style: none;
	padding-left: 0px;
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
	border: 3px solid #CC0000;
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
	background: #CC0000;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

.sch_smit:hover {
	background: #CC0000;
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
		<nav> <span class="search"> <input type='text'
			class='input_text' />
		</span>
		<button type='submit' class='sch_smit'>검색</button>
		<a class="login"
			href="http://117.17.143.71:8080/miniproject/user/signin">로그인</a> <a
			class="join" href="http://117.17.143.71:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr color=black>
	</div>

	<!-- 여기 ajex 로 바꿔서 카테고리를 get으로 넘겨주세요
				product/search.jsp 파일로 넘어가서 출력할 겁니다.
				(http://117.17.143.71:8080/miniproject/product/search?category=garment 이런식-->
	<div class="category">
		<nav>
		<ul id='categoryList'>
			<li class='1'><a href="#" name='garment'>의류</a></li>

			<li class='2'><a href="#" name="beauty">뷰티</a></li>

			<li class='3'><a href="#" name="furniture">가구</a></li>

			<li class='4'><a href="#" name="electro">가전</a></li>

			<li class='5'><a href="#" name="accessory">악세사리</a></li>

			<li class='6'><a href="#" name="sports">스포츠</a></li>

			<li class='7'><a href="#" name="carAccessories">자동차용품</a></li>

			<li class='8'><a href="#" name="ticket">공연/티켓</a></li>

			<li class='9'><a href="#" name="books">도서</a></li>




		</ul>
		</nav>
	</div>

	<div class="goods"></div>

	<script type="text/javascript">
				var items = document.querySelectorAll('#categoryList li');
				for(var i = 0; i<items.length ; i++){
					items[i].addEventListener('click', function(){
						const category = this.childNodes[0].name;
						console.log(category);
						const categoryRequest = new XMLHttpRequest();
						categoryRequest.addEventListener('load', function(){
							const productListJson = this.responseText;
							showList(productListJson);
						});
						categoryRequest.open('get', 'http://117.17.143.71:8080/miniproject/api/product/search?pCategory='+category);
						categoryRequest.send();
					});
				}

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
						showList(productListJson);
					});
					initProductListRequest.open('get','http://117.17.143.71:8080/miniproject/api/product/initproduct');
					initProductListRequest.send();
				}
				const searchText = document.querySelector(".input_text");
				const searchButton = document.querySelector(".sch_smit");
				searchButton.addEventListener('click', clickSearch);
				searchText.addEventListener('keyup', function(){
					if(window.event.keyCode==13)
						clickSearch();
				});
				function clickSearch(){
					const searchRequest = new XMLHttpRequest();
					searchRequest.addEventListener('load', function(){
						const productListJson = this.responseText;
						console.log(productListJson);
						showList(productListJson);
					});
					searchRequest.open('get', 'http://117.17.143.71:8080/miniproject/api/product/search?pName='+searchText.value);
					searchRequest.send();
				}





				function showList(jsonList){
					const list = document.querySelector('.goods');
					const jsonData = JSON.parse(jsonList);
					const size = Object.keys(jsonData).length;
					list.innerHTML="";
					for(var i = 0; i<size; i++){

						const img = document.createElement('img');
						const h3 = document.createElement('h3');
						const p = document.createElement('p');
						const nav = document.createElement('nav');
						img.src = jsonData[i].pImg;
						img.alt=jsonData[i].pNo;
						img.width=180;
						img.height=200;
						h3.appendChild(document.createTextNode(jsonData[i].pName));
						p.appendChild(document.createTextNode(numberFormat(jsonData[i].pPrice)+"원"));
						nav.setAttribute('class', 'good');
						nav.appendChild(img);
						nav.appendChild(h3);
						nav.appendChild(p);
						list.appendChild(nav);
						img.addEventListener('click', function(event){
							const checkProductRequest = new XMLHttpRequest();
							checkProductRequest.addEventListener('load', function(){
								if(this.responseText==='true')
								location.href = "http://117.17.143.71:8080/miniproject/product/productview?pNo="+img.alt;
								else
								alert("해당제품이 존재하지 않습니다. 정상적인 경로로 접근하세요");
							});
							checkProductRequest.open('get','http://117.17.143.71:8080/miniproject/api/product/checkproduct?pNo='+img.alt);
							checkProductRequest.send();
						});
						h3.addEventListener('click', function(event){
							const checkProductRequest = new XMLHttpRequest();
							checkProductRequest.addEventListener('load', function(){
								if(this.responseText==='true')
								location.href = "http://117.17.143.71:8080/miniproject/product/productview?pNo="+img.alt;
								else
								alert("해당제품이 존재하지 않습니다. 정상적인 경로로 접근하세요");
							});
							checkProductRequest.open('get','http://117.17.143.71:8080/miniproject/api/product/checkproduct?pNo='+img.alt);
							checkProductRequest.send();
						});
						function changecolor1(){
							h3.style.color='#CC0000';
						}
						function changecolor2(){
							h3.style.color='black';
						}
						h3.addEventListener('mouseover',changecolor1);
						h3.addEventListener('mouseout',changecolor2)
					}
				}
				function numberFormat(inputNumber) {
					   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					}

				</script>

</body>
</html>
