<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<br>
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
	
	#productDiv {
		width: 800px;
		margin: 0 auto;
		padding: 20px;
	}
</style>
</head>
<body>
	<header>
		<h1>
			<a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a>
		</h1>
	</header>
	
	<div class="menu">
		<nav>
			<span class="search">
				<input type='text' class='input_text' />
			</span>
				<a class="login" href="http://localhost:8080/miniproject/user/signin"></a>
				<a class="join" href="http://localhost:8080/miniproject/user/signup"></a>
		</nav>
		<hr color=black>
	</div>
	
	<form id="form" name="productInformation" enctype="multipart/form-data"	method="post">
		<br><br>
		<div id="productDiv">
			<hr>
			<label for="pCategory">상품 분류    </label>
			<select name="pCategory" id="pCategory">
				<option value="">--카테고리--</option>
				<option value="garment">의류</option>
				<option value="beauty">뷰티</option>
				<option value="furniture">가구</option>
				<option value="electro">가전</option>
				<option value="accessory">악세사리</option>
				<option value="sports">스포츠</option>
				<option value="carAccessories">자동차용품</option>
				<option value="ticket">티켓</option>
				<option value="books">책</option>
			</select>
			<hr>
			<label for="pName">상품명    </label>
			<input type="text" id="pName" name="pName" placeholder="상품명" />
			<hr>
			<label for="pPrice">상품 가격    </label>
			<input type="number" name="pPrice" id="pPrice" />
			<hr>
			<label for="upload">대표 이미지    </label>
			<input type="file" id="upload" name="upload" />
			<hr>
			<label for="pLoc">거래 위치    </label>
			<input type="text" id="pLoc" name="pLoc" placeholder="거래 위치" />
			<hr>
		</div>
			<center>
			<textarea name="pInfo" id="pInfo"></textarea>
			
			<script>
				CKEDITOR.replace('pInfo', {
					width : '1000px',
					height : '400px',
					margin : '0 auto',
					filebrowserUploadUrl : '../api/product/imageupload'
				});
			</script>
			<br><br>
			<button type="button" id="submit_btn">상품 등록</button>
			<button type="button" id="cancel_btn">취소</button>
			</center>
	</form>
</body>
<script type="text/javascript">
	const p_name = document.querySelector("#pName");
	const p_price = document.querySelector("#pPrice");
	const p_img = document.querySelector("#pImg");
	const p_info = document.querySelector("#pInfo");
	const p_loc = document.querySelector("#pLoc");
	const p_category = document.querySelector("#pCategory");
	const submit_btn = document.querySelector("#submit_btn");
	const upload = document.querySelector("#upload");
	const req = new XMLHttpRequest();

	submit_btn.addEventListener('click', function() {
		CKEDITOR.instances.pInfo.updateElement();
		req.addEventListener('load', function() {
			alert(this.responseText);
		});
		const formid = document.querySelector("#form");
		const formData = new FormData(formid);
		req.open('post',
				'http://localhost:8080/miniproject/api/product/registration');
		req.send(formData);
	});
</script>
</html>