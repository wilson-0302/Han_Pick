<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>로그인 - Hanpick</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --surface-dark: #1c2427;
            --border-dark: #283539;
            --text-secondary: #9db2b9;
        }
        body {
            font-family: 'Lexend', 'Noto Sans KR', sans-serif;
            background: var(--bg-dark);
            color: #fff;
            overflow-x: hidden;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .navbar {
            background: #0f1a1f;
            border-bottom: 1px solid var(--border-dark);
        }
        .nav-link {
            color: #fff !important;
            font-weight: 600;
        }
        .nav-link:hover, .nav-link:focus {
            color: var(--color-primary) !important;
        }
        .btn-primary {
            background: var(--color-primary);
            border-color: var(--color-primary);
            color: #0a1115;
            font-weight: 700;
        }
        .btn-primary:hover {
            background: #23a9d5;
            border-color: #23a9d5;
        }
        .btn-outline-light {
            border-color: var(--border-dark);
            background: var(--surface-dark);
            color: #fff;
            font-weight: 700;
        }
        .btn-outline-light:hover {
            background: #2a363a;
            color: #fff;
        }
        .card-dark {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .text-secondary-custom {
            color: var(--text-secondary);
        }
        .form-control {
            background: var(--bg-dark);
            border: 1px solid var(--border-dark);
            color: #fff;
        }
        .form-control:focus {
            border-color: var(--color-primary);
            box-shadow: 0 0 0 0.2rem rgba(43, 189, 238, 0.15);
            background: var(--bg-dark);
            color: #fff;
        }
        .form-check-input {
            background-color: var(--bg-dark);
            border: 1px solid var(--border-dark);
        }
        .form-check-input:checked {
            background-color: var(--color-primary);
            border-color: var(--color-primary);
        }
        .footer {
            border-top: 1px solid var(--border-dark);
            background: #0f1a1f;
        }
        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
        }
        .input-with-icon {
            padding-left: 42px;
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-lg">
        <div class="d-flex align-items-center text-white fw-bold fs-5" role="button" onclick="window.location.href='${ctx}/'">
            <span class="material-symbols-outlined me-2 fs-3 text-primary">school</span>
            Hanpick
        </div>
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navMenu">
            <ul class="navbar-nav me-3 mb-2 mb-lg-0 gap-lg-4">
                <li class="nav-item"><a class="nav-link" href="${ctx}/">소개</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/list">기능</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/">문의하기</a></li>
            </ul>
            <a class="btn btn-primary px-3" href="${ctx}/auth/signup">회원가입</a>
        </div>
    </div>
</nav>

<main class="d-flex flex-column min-vh-100">
    <div class="container-lg flex-grow-1 d-flex align-items-center justify-content-center py-5">
        <div class="w-100" style="max-width: 460px;">
            <div class="card card-dark rounded-4 p-4 p-md-5 shadow-lg">
                <div class="text-center mb-4">
                    <h1 class="h3 fw-bold text-white mb-2">로그인</h1>
                    <p class="mb-0 text-secondary-custom small">Hanpick 서비스 이용을 위해 로그인해주세요.</p>
                </div>
<%--                <form method="post" action="${ctx}/auth/login_ok" class="d-flex flex-column gap-3">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="email" class="form-label fw-semibold text-white small">아이디 또는 이메일</label>--%>
<%--                        <div class="position-relative">--%>
<%--                            <span class="material-symbols-outlined input-icon">person</span>--%>
<%--                            <input type="text" class="form-control input-with-icon" id="email" name="email" placeholder="학번 또는 이메일 입력">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <div class="d-flex justify-content-between align-items-end">--%>
<%--                            <label for="password" class="form-label fw-semibold text-white small mb-1">비밀번호</label>--%>
<%--                        </div>--%>
<%--                        <div class="position-relative">--%>
<%--                            <span class="material-symbols-outlined input-icon">lock</span>--%>
<%--                            <input type="password" class="form-control input-with-icon" id="password" name="password" placeholder="비밀번호 입력">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="d-flex justify-content-between align-items-center">--%>
<%--                        <div class="form-check">--%>
<%--                            <input class="form-check-input" type="checkbox" id="remember">--%>
<%--                            <label class="form-check-label text-secondary-custom small" for="remember">로그인 상태 유지</label>--%>
<%--                        </div>--%>
<%--                        <a class="text-primary small text-decoration-none" href="#">비밀번호 찾기</a>--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold shadow-sm">로그인</button>--%>
<%--                </form>--%>
                <form method="post" action="${ctx}/auth/login_ok" class="d-flex flex-column gap-3">

                    <!-- 로그인 실패 메시지 -->
                    <c:if test="${not empty param.msg}">
                        <div class="alert alert-danger small text-center mb-2">
                                ${param.msg}
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="loginId" class="form-label fw-semibold text-white small">
                            아이디
                        </label>
                        <div class="position-relative">
                            <span class="material-symbols-outlined input-icon">person</span>
                            <input type="text"
                                   class="form-control input-with-icon"
                                   id="loginId"
                                   name="loginId"
                                   placeholder="아이디 입력">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label fw-semibold text-white small mb-1">
                            비밀번호
                        </label>
                        <div class="position-relative">
                            <span class="material-symbols-outlined input-icon">lock</span>
                            <input type="password"
                                   class="form-control input-with-icon"
                                   id="password"
                                   name="password"
                                   placeholder="비밀번호 입력">
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember">
                            <label class="form-check-label text-secondary-custom small" for="remember">
                                로그인 상태 유지
                            </label>
                        </div>
                        <a class="text-primary small text-decoration-none" href="#">
                            비밀번호 찾기
                        </a>
                    </div>

                    <button type="submit"
                            class="btn btn-primary w-100 py-2 fw-bold shadow-sm">
                        로그인
                    </button>
                </form>
                <div class="text-center mt-4 text-secondary-custom">
                    <span class="small">아직 계정이 없으신가요?</span>
                    <a class="text-primary fw-bold text-decoration-none ms-1" href="${ctx}/auth/signup">회원가입</a>
                </div>
            </div>
            <div class="text-center mt-4">
                <p class="text-secondary-custom small mb-0">
                    도움이 필요하신가요? <a class="text-decoration-underline text-white" href="#">고객센터 문의하기</a>
                </p>
            </div>
        </div>
    </div>
</main>

<footer class="footer py-4">
    <div class="container-lg d-flex flex-column flex-md-row justify-content-between align-items-center gap-2 text-center text-md-start">
        <div class="d-flex align-items-center gap-2 text-secondary-custom">
            <span class="fw-bold small">Hanpick</span>
            <span class="small">© 2024 All rights reserved.</span>
        </div>
        <div class="d-flex gap-3">
            <a class="text-secondary-custom text-decoration-none small" href="#">이용약관</a>
            <a class="text-secondary-custom text-decoration-none small" href="#">개인정보처리방침</a>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
