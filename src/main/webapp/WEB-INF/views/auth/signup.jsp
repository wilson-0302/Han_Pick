<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
</head>
<body>

<h1>회원가입</h1>

<div class="error">
    <c:if test="${param.msg == 'empty_field'}">
        모든 항목을 입력해주세요.
    </c:if>

    <c:if test="${param.msg == 'password_confirm_fail'}">
        비밀번호가 일치하지 않습니다.
    </c:if>

    <c:if test="${param.msg == 'already_in_use'}">
        이미 사용 중인 아이디입니다.
    </c:if>
</div>

<div>${param.msg}</div>
<form method="post" action="signup_ok">
    사용자 ID : <input type="text" name="loginId" /><br />
    비밀번호 : <input type="password" name="password" /><br />
    비밀번호 확인 : <input type="password" name="passwordConfirm" /><br />
    이름 : <input type="text" name="name" /><br />
    이메일 : <input type="email" name="email" /><br />
    <input type="submit" value="회원가입" />
</form>

<br/>

<!-- 로그인으로 돌아가기 -->
<form method="get" action="login">
    <input type="submit" value="로그인으로 돌아가기" />
</form>

</body>
</html>
