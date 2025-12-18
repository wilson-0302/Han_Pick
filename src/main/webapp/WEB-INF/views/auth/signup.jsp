<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - 회원가입</title>
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
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-lg">
        <a class="d-flex align-items-center text-white fw-bold fs-5 text-decoration-none" href="${ctx}/">
            <span class="material-symbols-outlined me-2 fs-3 text-primary">school</span>
            Hanpick
        </a>
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navMenu">
            <ul class="navbar-nav me-3 mb-2 mb-lg-0 gap-lg-4">
                <li class="nav-item"><a class="nav-link" href="${ctx}/">소개</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/list">기능</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/list">팀 찾기</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/">문의하기</a></li>
            </ul>
            <a class="btn btn-outline-light px-3" href="${ctx}/auth/login">로그인</a>
        </div>
    </div>
</nav>

<main class="d-flex flex-column min-vh-100">
    <div class="container-lg flex-grow-1 d-flex justify-content-center align-items-center py-5">
        <div class="w-100 position-relative" style="max-width: 520px;">
            <div class="position-absolute top-0 end-0 translate-middle bg-info opacity-10 rounded-circle" style="width: 160px; height: 160px; filter: blur(40px);"></div>
            <div class="card card-dark rounded-4 p-4 p-md-5 shadow-lg position-relative">
                <div class="text-center mb-4">
                    <h1 class="h3 fw-bold text-white mb-3">회원가입</h1>
                    <p class="text-secondary-custom mb-0 small">Hanpick의 회원이 되어 다양한 학내 모집 정보를 확인하고 참여하세요.</p>
                </div>
                <c:if test="${not empty param.msg}">
                    <div class="alert alert-danger py-2 small text-center mb-3" role="alert">
                        <c:choose>
                            <c:when test="${param.msg == 'empty_field'}">모든 항목을 입력해주세요.</c:when>
                            <c:when test="${param.msg == 'password_confirm_fail'}">비밀번호가 일치하지 않습니다.</c:when>
                            <c:when test="${param.msg == 'already_in_use'}">이미 사용 중인 아이디입니다.</c:when>
                            <c:otherwise>${param.msg}</c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
<%--                <form class="d-flex flex-column gap-3" method="post" action="signup_ok">--%>
<%--                    <div>--%>
<%--                        <label for="loginId" class="form-label fw-semibold text-white small">아이디</label>--%>
<%--                        <input type="text" class="form-control" id="loginId" name="loginId" placeholder="영문, 숫자 포함 6~12자" required>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="email" class="form-label fw-semibold text-white small">이메일</label>--%>
<%--                        <div class="position-relative">--%>
<%--                            <input type="email" class="form-control pe-5" id="email" name="email" placeholder="example@handong.edu" required>--%>
<%--                            <span class="material-symbols-outlined position-absolute top-50 end-0 translate-middle-y me-3 text-primary" style="font-size: 20px;">mail</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="password" class="form-label fw-semibold text-white small">비밀번호</label>--%>
<%--                        <input type="password" class="form-control" id="password" name="password" placeholder="8자 이상 입력해주세요" required>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <label for="passwordConfirm" class="form-label fw-semibold text-white small">비밀번호 확인</label>--%>
<%--                        <input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 한번 더 입력해주세요" required>--%>
<%--                    </div>--%>
<%--                    <div class="d-flex align-items-start gap-2 p-3 rounded-3" style="background: rgba(16,29,34,0.6); border: 1px solid var(--border-dark);">--%>
<%--                        <div class="form-check mt-1">--%>
<%--                            <input class="form-check-input" type="checkbox" id="privacy" required>--%>
<%--                        </div>--%>
<%--                        <label class="small text-secondary-custom mb-0" for="privacy">--%>
<%--                            <span class="text-white fw-bold">필수 동의</span><br>--%>
<%--                            <a class="text-primary text-decoration-none" href="#">서비스 이용약관</a> 및 <a class="text-primary text-decoration-none" href="#">개인정보 처리방침</a>에 동의합니다.--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                    <button class="btn btn-primary w-100 py-2 fw-bold" type="submit">가입 완료</button>--%>
<%--                </form>--%>
                <form class="d-flex flex-column gap-3"
                      method="post"
                      action="${ctx}/auth/signup_ok">

                    <!-- 🔴 기존 기능 에러 메시지 유지 -->
                    <c:if test="${not empty param.msg}">
                        <div class="alert alert-danger py-2 small text-center mb-3" role="alert">
                            <c:choose>
                                <c:when test="${param.msg == 'empty_field'}">모든 항목을 입력해주세요.</c:when>
                                <c:when test="${param.msg == 'password_confirm_fail'}">비밀번호가 일치하지 않습니다.</c:when>
                                <c:when test="${param.msg == 'already_in_use'}">이미 사용 중인 아이디입니다.</c:when>
                                <c:otherwise>${param.msg}</c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

                    <!-- 아이디 -->
                    <div>
                        <label for="loginId" class="form-label fw-semibold text-white small">아이디</label>
                        <input type="text"
                               class="form-control"
                               id="loginId"
                               name="loginId"
                               placeholder="영문, 숫자 포함 6~12자">
                    </div>

                    <!-- 이름 (⭐ 기능상 반드시 필요) -->
                    <div>
                        <label for="name" class="form-label fw-semibold text-white small">이름</label>
                        <input type="text"
                               class="form-control"
                               id="name"
                               name="name"
                               placeholder="이름을 입력해주세요">
                    </div>

                    <!-- 이메일 -->
                    <div>
                        <label for="email" class="form-label fw-semibold text-white small">이메일</label>
                        <input type="email"
                               class="form-control"
                               id="email"
                               name="email"
                               placeholder="example@handong.edu">
                    </div>

                    <!-- 비밀번호 -->
                    <div>
                        <label for="password" class="form-label fw-semibold text-white small">비밀번호</label>
                        <input type="password"
                               class="form-control"
                               id="password"
                               name="password"
                               placeholder="8자 이상 입력해주세요">
                    </div>

                    <!-- 비밀번호 확인 -->
                    <div>
                        <label for="passwordConfirm" class="form-label fw-semibold text-white small">비밀번호 확인</label>
                        <input type="password"
                               class="form-control"
                               id="passwordConfirm"
                               name="passwordConfirm"
                               placeholder="비밀번호를 한번 더 입력해주세요">
                    </div>

                    <!-- 약관 동의 (기능과 무관 → UI용) -->
                    <div class="d-flex align-items-start gap-2 p-3 rounded-3"
                         style="background: rgba(16,29,34,0.6); border: 1px solid var(--border-dark);">
                        <div class="form-check mt-1">
                            <input class="form-check-input" type="checkbox" id="privacy" required>
                        </div>
                        <label class="small text-secondary-custom mb-0" for="privacy">
                            <span class="text-white fw-bold">필수 동의</span><br>
                            서비스 이용약관 및 개인정보 처리방침에 동의합니다.
                        </label>
                    </div>

                    <button class="btn btn-primary w-100 py-2 fw-bold" type="submit">
                        가입 완료
                    </button>
                </form>
                <div class="text-center mt-4">
                    <span class="text-secondary-custom small">이미 계정이 있으신가요?</span>
                            <a class="text-primary fw-bold text-decoration-none ms-1" href="${ctx}/auth/login">로그인하기</a>
                    </div>
                </div>
            </div>
    </div>
</main>

<footer class="footer py-5 mt-auto">
    <div class="container-lg">
        <div class="row gy-4">
            <div class="col-md-4">
                <div class="d-flex align-items-center text-white fw-bold mb-2">
                    <span class="material-symbols-outlined me-2 text-primary">school</span>
                    Hanpick
                </div>
                <p class="text-secondary-custom mb-0 small">한동대학교 학생들을 위한<br>통합 모집 및 정보 플랫폼</p>
            </div>
            <div class="col-md-4 d-flex gap-5">
                <div>
                    <h6 class="text-white fw-bold small">서비스</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">기능 소개</a></li>
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">팀 찾기</a></li>
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">프로젝트</a></li>
                    </ul>
                </div>
                <div>
                    <h6 class="text-white fw-bold small">지원</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">자주 묻는 질문</a></li>
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">문의하기</a></li>
                        <li><a class="text-secondary-custom text-decoration-none small" href="#">이용약관</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <h6 class="text-white fw-bold small">Contact</h6>
                <a class="text-secondary-custom text-decoration-none small" href="mailto:support@handongpick.com">support@handongpick.com</a>
            </div>
        </div>
        <div class="border-top border-dark mt-4 pt-3 text-secondary-custom small">
            © 2024 Hanpick. All rights reserved.
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
