<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/loginForm.css">
</head>
<body>
 <form name="loginInfo">
	<table>
		<tr>
			<td bgcolor="skyblue">아이디</td>
			<td><input type="text" name="uId" id="uId" maxlength="100" value="${storedId}"></td>
        </tr> 
        <tr>
        	<td bgcolor="skyblue">비밀번호</td>
        	<td><input type="password" name="uPwd" id="uPwd" maxlength="100"></td>
        </tr> 
	</table>
	
	<label for="checkStore">ID저장하기</label>
	<c:choose>
      <c:when test="${checked}">
         <input type="checkbox" name="checkStore" id="checkStore" checked/><br/>
      </c:when>
      <c:otherwise>
         <input type="checkbox" name="checkStore" id="checkStore"/><br/>
      </c:otherwise>
   </c:choose>
            <br>
            <button id="loginBtn" type="button">로그인</button>
            <input type="button" value="취소" onclick="mainpage.jsp" />         
</form>

<script type="text/javascript">
   const btn = document.querySelector("#loginBtn");
   const id = document.querySelector("#uId");
   const pwd = document.querySelector("#uPwd");
   const checkStore = document.querySelector("#checkStore");
   
   const req = new XMLHttpRequest();
   
   btn.addEventListener('click', function(){
      req.addEventListener('load', function(){
         console.log(this.responseText);
      });
      req.open('post', 'http://localhost:8080/miniproject/api/user/login');
      req.setRequestHeader("Content-Type","application/json;charset=utf-8");
      req.send(JSON.stringify(
    		  {
    			  "user":{
    				  "uId": id.value,
    				  "uPwd": pwd.value
    			  },
    			  "checkStore": checkStore.value
    		 }));
   });
</script>
</body>
</html>