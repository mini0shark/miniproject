<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
검색페이지
<!-- http://localhost:8080/miniproject/api/product/search?category=garment 식으로  ajex로 productDTO
리스트 json으로 받아오기
  이거 이미지경로
  값은 orderby=DESC or ASC
  pCategory, pName, pLoc, pSeller 아직 4가지 있음
  -->
 <!-- json배열로 productDTO내용 넘어갈 거입 -->
 <!-- [{"pNo":18,"pName":"asdf","pPrice":11231,"pInfo":"<p>dsfasd</p>\n","pLoc":"123","pImg":"임시로 저장 이거 나중에 바꿔야함!!!!!","pSeller":"beom","pState":"ing","pCategory":"garment","pTime":"2019-08-20 14:10:11.0"},
 {"pNo":19,"pName":"asdf","pPrice":11231,"pInfo":"<p>가</p>\n\n<p>나</p>\n\n<p>다라</p>\n\n<p>마바사</p>\n\n<p>아자차카타</p>\n","pLoc":"123","pImg":"임시로 저장 이거 나중에 바꿔야함!!!!!","pSeller":"beom","pState":"ing","pCategory":"garment","pTime":"2019-08-20 14:10:34.0"},
 {"pNo":20,"pName":"asdf333","pPrice":1232,"pInfo":"<p>가ㅁㄴㄴ</p>\n\n<p>나ㅇㅇㅇㅇ</p>\n\n<p>ㅇ</p>\n","pLoc":"ㄴㅇㄻㄴㅇㄹ","pImg":"임시로 저장 이거 나중에 바꿔야함!!!!!","pSeller":"beom","pState":"ing","pCategory":"garment","pTime":"2019-08-20 14:10:51.0"},
 {"pNo":21,"pName":"ㄹㄴㅇㅇㅇㅇㅇㅇ","pPrice":11123,"pInfo":"<p>가ㅁㄴㄴ</p>\n\n<p>나ㅇㅇㅇㅇㅁㄴㅇㄹ</p>\n\n<p>ㅇ</p>\n","pLoc":"ㅇㄻㄴ","pImg":"임시로 저장 이거 나중에 바꿔야함!!!!!","pSeller":"beom","pState":"ing","pCategory":"garment","pTime":"2019-08-20 14:11:31.0"}]
 이런식 -->

</body>
</html>