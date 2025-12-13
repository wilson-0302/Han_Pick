<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%-- TODO: Implement login form and validation messages --%>
        <!DOCTYPE html>
        <html>

        <head>
            <title>로그인</title>
        </head>
        <div>${param.msg}</div>
        <body>
            <h1>로그인</h1>
            <form method="post" action="login_ok">
                사용자 ID : <input type="text" name="loginId" /><br />
                암호 : <input type="password" name="password" /><br />
                <input type="submit" value="login" />
            </form>

            <br/>

            <!-- 회원가입 이동 버튼 -->
            <form method="get" action="signup">
                <input type="submit" value="회원가입" />
            </form>
            <%--<form method="post" action="/auth/login">--%>
                <%-- &lt;%&ndash; TODO: 아이디/비밀번호 입력 필드와 에러 표시 &ndash;%&gt;--%>
                    <%--< /form>--%>
        </body>

        </html>