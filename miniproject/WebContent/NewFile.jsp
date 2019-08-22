<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
       <div id='a'>
             <ul>
                 <li>하나</li>
             </ul>
             <ul>
                 <li>두울</li>
             </ul>
       </div>
       <input type='button' onclick='plusFun();' value='추가' />

 

       <script type='text/javascript'>
             // "추가" 버튼 클릭시 실행 되는 함수 입니다.
             function plusFun() {
                 //plusUl 변수에 createElement 를 사용해 생성할 엘리먼트를 담습니다.
                 var plusUl = document.createElement('ul');
                 // 추가할 plusUl 엘리먼트 안의 내용을 정해줍니다. ( 꼭 정해야 하는건 아닙니다. )
                 plusUl.innerHTML =  "<li>세엣</li>";   
                 // appendChild 로 이전에 정의한 plusUl 변수의 내용을 실제 추가합니다.
                 document.getElementById('a').appendChild(plusUl);
             } 
       </script>
</body>
</html>