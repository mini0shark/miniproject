<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
        <title>Insert title here</title>
        <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
        http://localhost:8080/miniproject/api/product/registration 페이지
        결과값이 registerErr, registerSuccess, loginNeeded로 나옴
        <br>
        확인?
      </head>
      <body>
        <form  id = "form" name="productInformation" enctype="multipart/form-data" method="post">
          <label for="pName">상품명</label>
          <input type="text" id="pName" name="pName" placeholder="상품명"/><br/>
          <label for="pPrice">상품가격</label>
          <input type="number" name="pPrice" id="pPrice" /><br/>
          <label for="upload">대표 이미지</label>
          	<input type="file" id="upload" name="upload"/><br/>
          <label for="pInfo">상품 정보</label>
          <textarea name="pInfo" id="pInfo"></textarea>
          <script>
          	CKEDITOR.replace('pInfo',{
          		//width: '100%'
          		//height: '400px',
          		filebrowserUploadUrl: '../api/product/imageupload'
          	});
          </script>
          <input type="text" id="pLoc" name="pLoc" placeholder="거래 위치"/><br/>
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
		<button type="button" id="submit_btn">상품 등록</button>
          <button type="button" id="cancel_btn">취소</button>
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
        
        submit_btn.addEventListener('click', function(){
       	  CKEDITOR.instances.pInfo.updateElement();
          req.addEventListener('load', function(){
        	  alert(this.responseText);
          });
          const formId = document.querySelector("#form");
          const formData = new FormData(formId);
          req.open('post', 'http://localhost:8080/miniproject/api/product/registration');
          req.send(formData);
       });
      </script>
    </html>