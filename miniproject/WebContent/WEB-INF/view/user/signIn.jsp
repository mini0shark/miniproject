<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/loginForm.css">
</head>
<body>
 <form name="loginInfo" method="post" action="loginCheck.jsp">
	<table>
		<tr>
			<td bgcolor="skyblue">아이디</td>
			<td><input type="text" name="id" maxlength="100"></td>
        </tr> 
        <tr>
        	<td bgcolor="skyblue">비밀번호</td>
        	<td><input type="password" name="password" maxlength="100"></td>
        </tr> 
	</table>
            <br>
            <input type="submit" value="로그인"/>
            <input type="button" value="취소" onclick="mainpage.jsp" />
            <input type="checkbox"/>
</form>

<% 
 	String msg = request.getParameter("msg");
 
 	if(msg != null && msg.equals("0")) {
        out.println("비밀번호를 확인해 주세요.");
     }
 	else if(msg != null && msg.equals("-1")){   
        out.println("아이디를 확인해 주세요.");
     }
%>    

</body>
</html>