<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - My Info</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --surface-dark: #1c262a;
            --border-dark: #283539;
            --text-secondary: #9db2b9;
        }
        body {
            font-family: 'Lexend', 'Noto Sans KR', sans-serif;
            background: var(--bg-dark);
            color: #fff;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .navbar {
            background: #0f1a1f;
            border-bottom: 1px solid var(--border-dark);
        }
        .nav-link {
            color: var(--text-secondary) !important;
            font-weight: 600;
        }
        .nav-link.active, .nav-link:hover {
            color: var(--color-primary) !important;
        }
        .card-dark {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .text-secondary-custom { color: var(--text-secondary); }
        .stat-box {
            background: #111a1f;
            border: 1px solid var(--border-dark);
        }
        .table-dark-custom tbody tr:hover { background: #1f2c32; }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${sessionScope.user}" />
<c:set var="postCount" value="${requestScope.postCount}" />
<c:if test="${empty postCount}">
    <c:set var="postCount" value="0" />
</c:if>
<c:set var="scrapCount" value="${requestScope.scrapCount}" />
<c:if test="${empty scrapCount}">
    <c:set var="scrapCount" value="0" />
</c:if>
<div class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg px-3">
        <div class="container-lg">
            <div class="d-flex align-items-center gap-2 text-white fw-bold fs-5">
                <span class="material-symbols-outlined text-primary">hub</span>
                Hanpick
            </div>
            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navMenu">
                <ul class="navbar-nav gap-lg-4 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="${ctx}/list">모집 공고</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${ctx}/auth/profile">마이페이지</a></li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <a class="btn btn-outline-light btn-sm" href="${ctx}/auth/logout">로그아웃</a>
                    <div class="rounded-circle overflow-hidden border border-primary" style="width:36px; height:36px; background-image:url('https://lh3.googleusercontent.com/aida-public/AB6AXuDZYBzOPspzvkU4hh9S7LGo0Zmi6kkAF4BjRJTR3YwztNDkVOPENdEPP2ag8CtzUFB1qI6uWtwDe3VP8xDDrKUpRMt1vT8QvZRpUd4cEkmyiW8LGh-KXKZtxYOWuXzAA79TrQ9H0VR1NyWPMAcim413PIJaTSAuQiK16EWmmp3zgwnAKu3F79ZR6SlHrUXFZuFL2-6yUi6GcPLiyBS5t8fl_4QkrdzjiIJMkWP4129YFrlW3zdkXPmJ_Fmgk_NHpoMm2bTb927QAjA3'); background-size:cover; background-position:center;"></div>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main -->
    <main class="flex-grow-1 py-4">
        <div class="container-lg">
            <div class="mb-3">
                <h1 class="fw-bold display-6 mb-1">내 정보</h1>
                <p class="text-secondary-custom mb-0">개인 정보를 확인하고 작성한 게시글을 관리하세요.</p>
            </div>

            <div class="row g-3">
                <!-- Profile summary -->
                <div class="col-12">
                    <div class="card-dark rounded-4 p-4 d-flex flex-column flex-md-row align-items-center gap-4">
                        <div class="position-relative">
                            <div class="rounded-circle border border-dark" style="width:110px; height:110px; background-image:url('https://lh3.googleusercontent.com/aida-public/AB6AXuAU70ovlKq4y_Kpv1S-WwABhhnLlfEH-3aUJy3BNfKrriBuxarpMSWlYcCvdu7z3bhsNG5MMHz1WnekOC5Vxqc45mMcbUupwJfZtdoQ-FpPBf5_5st0BQF4eFBUG62p5Cw9p-kJNO2GmK8-0JrJyxggyCHIB7HuKgFscY2C290kWH4G8yqSlPZiAA4PKoaVQz0DIK9qnXaGqrR1ZdpsgwQFusdMx6ZYQv9hdqu7wkA3sLtIk9A0xQVJ-5y0Mfhu7WM0wN2VYMJFEDzU'); background-size:cover; background-position:center;"></div>
                            <button class="btn btn-sm btn-dark position-absolute bottom-0 end-0 border border-dark"><span class="material-symbols-outlined">photo_camera</span></button>
                        </div>
                        <div class="flex-grow-1 text-center text-md-start">
                            <div class="d-flex flex-wrap align-items-center gap-2 justify-content-center justify-content-md-start mb-1">
                                <h2 class="fw-bold mb-0"><c:out value="${user.name}" default="이름 미등록"/></h2>
                                <span class="badge bg-primary bg-opacity-25 text-primary fw-bold">재학생</span>
                            </div>
                            <div class="text-secondary-custom">
                                <c:choose>
                                    <c:when test="${not empty user.email}">
                                        <c:out value="${user.email}"/>
                                    </c:when>
                                    <c:otherwise>
                                        이메일 미등록
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${not empty user.loginId}">
                                    · <c:out value="${user.loginId}"/>
                                </c:if>
                            </div>
                            <div class="d-flex gap-2 mt-3">
                                <div class="stat-box rounded-3 px-3 py-2 text-center">
                                    <div class="text-secondary-custom small">게시글</div>
                                    <div class="fw-bold text-primary fs-5"><c:out value="${postCount}"/></div>
                                </div>
                                <div class="stat-box rounded-3 px-3 py-2 text-center">
                                    <div class="text-secondary-custom small">스크랩</div>
                                    <div class="fw-bold text-primary fs-5"><c:out value="${scrapCount}"/></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Settings -->
                <div class="col-lg-5">
                    <div class="card-dark rounded-4 p-4 h-100">
                        <div class="d-flex align-items-center gap-2 mb-3 pb-2 border-bottom border-dark">
                            <span class="material-symbols-outlined text-primary">manage_accounts</span>
                            <h6 class="fw-bold mb-0">계정 정보 수정</h6>
                        </div>
                        <form class="d-flex flex-column gap-3">
                            <div>
                                <label class="form-label text-secondary-custom small">이름</label>
                                <input type="text" class="form-control" value="${empty user.name ? '' : user.name}" placeholder="이름을 입력하세요">
                            </div>
                            <div>
                                <label class="form-label text-secondary-custom small">이메일</label>
                                <input type="email" class="form-control text-secondary-custom" value="${empty user.email ? '이메일 미등록' : user.email}" disabled>
                            </div>
                            <div class="border-top border-dark my-2"></div>
                            <div>
                                <label class="form-label text-secondary-custom small">새 비밀번호</label>
                                <input type="password" class="form-control" placeholder="변경할 비밀번호를 입력하세요">
                            </div>
                            <div>
                                <label class="form-label text-secondary-custom small">비밀번호 확인</label>
                                <input type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요">
                            </div>
                            <button type="button" class="btn btn-primary fw-bold text-dark mt-2">변경사항 저장</button>
                        </form>
                    </div>
                </div>

                <!-- Posts list -->
                <div class="col-lg-7">
                    <div class="card-dark rounded-4 p-4 h-100 d-flex flex-column">
                        <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom border-dark">
                            <div class="d-flex align-items-center gap-2">
                                <span class="material-symbols-outlined text-primary">history_edu</span>
                                <h6 class="fw-bold mb-0">내가 쓴 글</h6>
                            </div>
                            <a href="${ctx}/posts/manage" class="text-primary small text-decoration-none fw-bold">전체보기</a>
                        </div>
                        <div class="d-flex flex-column gap-2 flex-grow-1">
                            <c:choose>
                                <c:when test="${not empty posts}">
                                    <c:forEach var="post" items="${posts}">
                                        <c:set var="statusLower" value="${empty post.status ? '' : fn:toLowerCase(post.status)}" />
                                        <c:set var="statusLabel" value="${empty post.status ? '상태 미지정' : post.status}" />
                                        <c:choose>
                                            <c:when test="${fn:contains(statusLower, 'open') or fn:contains(statusLower, '모집')}">
                                                <c:set var="statusLabel" value="모집중" />
                                            </c:when>
                                            <c:when test="${fn:contains(statusLower, 'close') or fn:contains(statusLower, '마감')}">
                                                <c:set var="statusLabel" value="마감" />
                                            </c:when>
                                        </c:choose>
                                        <div class="d-flex flex-column flex-sm-row justify-content-between gap-3 p-3 rounded-3 bg-dark bg-opacity-25 border border-dark">
                                            <div class="flex-grow-1">
                                                <div class="d-flex align-items-center gap-2 mb-1">
                                                    <span class="badge bg-warning text-dark"><c:out value="${post.category}" default="카테고리"/></span>
                                                    <span class="badge bg-dark text-secondary-custom border border-dark"><c:out value="${statusLabel}"/></span>
                                                </div>
                                                <div class="fw-semibold">
                                                    <c:out value="${post.title}" default="제목 없음"/>
                                                </div>
                                                <div class="d-flex gap-3 text-secondary-custom small mt-1">
                                                    <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span><c:out value="${post.viewCount}" default="0"/></span>
                                                    <c:if test="${not empty post.deadline}">
                                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">event</span><c:out value="${post.deadline}"/></span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <a class="btn btn-sm btn-dark text-secondary-custom border-dark" href="${ctx}/posts/detail?id=${post.id}">
                                                    <span class="material-symbols-outlined">visibility</span>
                                                </a>
                                                <form action="${ctx}/posts/delete" method="post" class="m-0">
                                                    <input type="hidden" name="id" value="${post.id}">
                                                    <button type="submit" class="btn btn-sm btn-dark text-danger border-dark">
                                                        <span class="material-symbols-outlined">delete</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="d-flex flex-column align-items-center justify-content-center text-secondary-custom py-4 border border-dark rounded-3 bg-dark bg-opacity-25">
                                        <span class="material-symbols-outlined mb-2 text-primary">draft</span>
                                        아직 작성한 게시글이 없습니다.
                                        <div class="d-flex gap-2 mt-3">
                                            <a class="btn btn-primary text-dark fw-bold" href="${ctx}/posts/new">첫 글 작성하기</a>
                                            <a class="btn btn-outline-light border-dark" href="${ctx}/posts/manage">내 글 관리로 이동</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="py-4 border-top border-dark" style="background:#0f1a1f;">
        <div class="container-lg d-flex flex-column flex-md-row justify-content-between align-items-center gap-2">
            <div class="text-secondary-custom small">© 2024 Hanpick. All rights reserved.</div>
            <div class="d-flex gap-3">
                <a class="text-secondary-custom small text-decoration-none" href="#">이용약관</a>
                <a class="text-secondary-custom small text-decoration-none" href="#">개인정보처리방침</a>
                <button class="btn btn-link text-danger text-decoration-none p-0 small">회원탈퇴</button>
            </div>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
