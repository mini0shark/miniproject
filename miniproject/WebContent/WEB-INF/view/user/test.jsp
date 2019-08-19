<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button>추가</button>
<script type="text/javascript">
   const btn = document.querySelector("button");
   const req = new XMLHttpRequest();
   
   btn.addEventListener('click', function(){
      req.addEventListener('load', function(){
         console.log(this.responseText);
      });
      req.open('post', 'http://localhost:8080/springbank/user/add');
      req.setRequestHeader("Content-Type","application/json;charset=utf-8");
      req.send(JSON.stringify(
    		  {
    			  "id": "akakakak", "password": "0000", "name": "kkkk", "isAdmin": false}
    		  ));
   });
</script>
</body>
</html>