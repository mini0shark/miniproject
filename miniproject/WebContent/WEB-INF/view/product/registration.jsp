<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
        <title>Insert title here</title>
        http://localhost:8080/miniproject/api/product/registration 페이지
        <br>
        확인?
      </head>
      <body>
        <form name="productInformation">
          <input type="text" id="pName" placeholder="상품명"/>
          <input type="number" id="pPrice" />
          <input type="text" id="pInfo" placeholder="제품 설명"/>
          <input type="text" id="pLoc" placeholder="거래 위치"/>
          <input type="text" id="pCategory" placeholder="상품 분류"/>
          <button type="button" id="submit_btn" >상품 등록</button>
          <button type="button" id="cancel_btn">취소</button>
        </form>
      </body>
      <script type="text/javascript">
        const p_name = document.querySelector("#pName");
        const p_price = document.querySelector("#pPrice");
        const p_info = document.querySelector("#pInfo");
        const p_loc = document.querySelector("#pLoc");
        const p_category = document.querySelector("#pCategory");
        const submit_btn = document.querySelector("#submit_btn");


        const req = new XMLHttpRequest();
        submit_btn.addEventListener('click', function(){
          req.addEventListener('load', function(){
        	  alert(this.responseText+"왜 안되지??")
          });
          req.open('post', 'http://localhost:8080/miniproject/api/product/register');
          req.setRequestHeader("Content-Type","application/json;charset=utf-8");
          req.send(JSON.stringify(
        		  {"product":{
                "pName":p_name.value,
                "pPrice":p_price.value,
                "pInfo":p_info.value,
                "pLoc":p_loc.value,
                "pCategory":p_category.value
              }}));
       });

      </script>
    </html>
