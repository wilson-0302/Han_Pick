<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - 내 글 관리</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --surface-dark: #16262c;
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
            background: rgba(16, 29, 34, 0.95);
            border-bottom: 1px solid var(--border-dark);
            backdrop-filter: blur(8px);
        }
        .nav-link { color: #fff !important; font-weight: 600; }
        .nav-link.active, .nav-link:hover { color: var(--color-primary) !important; }
        .card-surface {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .text-secondary-custom { color: var(--text-secondary); }
        .chip {
            background: #1c2a30;
            border: 1px solid transparent;
            color: #dce5ea;
        }
        .chip:hover {
            border-color: rgba(43, 189, 238, 0.4);
            color: #fff;
        }
        .manage-card {
            border: 1px solid var(--border-dark);
            transition: border-color 0.2s ease, transform 0.2s ease;
        }
        .manage-card:hover {
            border-color: var(--color-primary);
            transform: translateY(-2px);
        }
        .badge-open {
            background: rgba(25, 135, 84, 0.15);
            color: #63d1a4;
            border: 1px solid rgba(25, 135, 84, 0.35);
        }
        .badge-closed {
            background: rgba(220, 53, 69, 0.1);
            color: #f1929d;
            border: 1px solid rgba(220, 53, 69, 0.35);
        }
        .floating-btn {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: var(--color-primary);
            color: #0a1115;
            box-shadow: 0 12px 24px rgba(43, 189, 238, 0.35);
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="totalPosts" value="${fn:length(posts)}" />
<c:set var="openCount" value="0" />
<c:set var="closedCount" value="0" />
<c:forEach var="p" items="${posts}">
    <c:set var="statusLower" value="${empty p.status ? '' : fn:toLowerCase(p.status)}" />
    <c:choose>
        <c:when test="${fn:contains(statusLower, 'open') or fn:contains(statusLower, '모집')}">
            <c:set var="openCount" value="${openCount + 1}" />
        </c:when>
        <c:when test="${fn:contains(statusLower, 'close') or fn:contains(statusLower, '마감')}">
            <c:set var="closedCount" value="${closedCount + 1}" />
        </c:when>
    </c:choose>
</c:forEach>

<div class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
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
                    <li class="nav-item"><a class="nav-link" href="${ctx}/">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="${ctx}/list">모집 공고</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${ctx}/posts/manage">내 글 관리</a></li>
                </ul>
                <div class="d-flex align-items-center gap-2">
                    <button class="btn btn-outline-light border-0 px-3" type="button">
                        <span class="material-symbols-outlined">notifications</span>
                    </button>
                    <a class="btn btn-outline-light border-0 px-3" href="${ctx}/auth/profile" aria-label="프로필">
                        <span class="material-symbols-outlined">account_circle</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main -->
    <main class="flex-grow-1 py-4">
        <div class="container-lg d-flex flex-column gap-4">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3">
                <div>
                    <p class="text-secondary-custom small mb-1">작성한 게시글 현황</p>
                    <h1 class="fw-bold display-6 mb-0">내 글 관리</h1>
                </div>
                <div class="d-flex gap-2">
                    <a class="btn btn-outline-light border-0 text-secondary-custom" href="${ctx}/list">모집 공고 보기</a>
                    <a class="btn btn-primary fw-bold text-dark" href="${ctx}/posts/new">새 글 작성</a>
                </div>
            </div>

            <!-- Stats -->
            <div class="row g-3">
                <div class="col-12 col-sm-4">
                    <div class="card-surface rounded-4 p-3 h-100 d-flex flex-column gap-1">
                        <div class="text-secondary-custom small">전체 게시글</div>
                        <div class="d-flex align-items-end gap-2">
                            <div class="display-6 fw-bold text-white">${totalPosts}</div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card-surface rounded-4 p-3 h-100 d-flex flex-column gap-1">
                        <div class="text-secondary-custom small d-flex align-items-center gap-1">
                            <span class="material-symbols-outlined text-success" style="font-size:18px;">campaign</span>
                            모집중
                        </div>
                        <div class="display-6 fw-bold text-white">${openCount}</div>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card-surface rounded-4 p-3 h-100 d-flex flex-column gap-1">
                        <div class="text-secondary-custom small d-flex align-items-center gap-1">
                            <span class="material-symbols-outlined text-danger" style="font-size:18px;">event_busy</span>
                            마감됨
                        </div>
                        <div class="display-6 fw-bold text-white">${closedCount}</div>
                    </div>
                </div>
            </div>

            <!-- Filters -->
            <div class="card-surface rounded-4 p-3 d-flex flex-wrap gap-2 align-items-center">
                <button class="btn btn-sm chip rounded-pill px-3 text-white border border-primary bg-opacity-10">전체</button>
                <button class="btn btn-sm chip rounded-pill px-3">모집중</button>
                <button class="btn btn-sm chip rounded-pill px-3">마감</button>
                <button class="btn btn-sm chip rounded-pill px-3">동아리</button>
                <button class="btn btn-sm chip rounded-pill px-3">공모전</button>
                <button class="btn btn-sm chip rounded-pill px-3">스터디</button>
                <button class="btn btn-sm chip rounded-pill px-3">프로젝트</button>
            </div>

            <!-- Posts list -->
            <div class="d-flex flex-column gap-3">
                <c:if test="${empty posts}">
                    <div class="card-surface rounded-4 p-4 text-center text-secondary-custom">
                        아직 작성한 게시글이 없습니다. 첫 게시글을 등록해보세요.
                    </div>
                </c:if>

                <c:forEach var="post" items="${posts}">
                    <c:set var="statusLower" value="${empty post.status ? '' : fn:toLowerCase(post.status)}" />
                    <c:set var="statusLabel" value="${empty post.status ? '상태 미지정' : post.status}" />
                    <c:set var="statusClass" value="badge bg-secondary" />
                    <c:choose>
                        <c:when test="${fn:contains(statusLower, 'open') or fn:contains(statusLower, '모집')}">
                            <c:set var="statusLabel" value="모집중" />
                            <c:set var="statusClass" value="badge badge-open" />
                        </c:when>
                        <c:when test="${fn:contains(statusLower, 'close') or fn:contains(statusLower, '마감')}">
                            <c:set var="statusLabel" value="마감" />
                            <c:set var="statusClass" value="badge badge-closed" />
                        </c:when>
                    </c:choose>

                    <c:set var="excerpt" value="${post.content}" />
                    <c:if test="${empty excerpt}">
                        <c:set var="excerpt" value="내용이 없습니다." />
                    </c:if>
                    <c:if test="${not empty excerpt and fn:length(excerpt) > 120}">
                        <c:set var="excerpt" value="${fn:substring(excerpt, 0, 120)}..." />
                    </c:if>

                    <div class="card-surface manage-card rounded-4 p-4">
                        <div class="d-flex flex-column flex-md-row justify-content-between gap-3">
                            <div class="d-flex flex-wrap gap-2 align-items-center">
                                <span class="${statusClass} px-2 py-1 fw-semibold">${statusLabel}</span>
                                <span class="badge bg-dark border border-secondary text-secondary">
                                    <c:out value="${post.category}"/>
                                </span>
                                <span class="text-secondary-custom small d-flex align-items-center gap-1">
                                    <span class="material-symbols-outlined" style="font-size:16px;">visibility</span>
                                    <c:out value="${post.viewCount}"/>
                                </span>
                                <c:if test="${not empty post.deadline}">
                                    <span class="badge bg-primary bg-opacity-25 text-primary">
                                        마감일 <c:out value="${post.deadline}"/>
                                    </span>
                                </c:if>
                            </div>
                            <div class="d-flex gap-2 align-items-center">
                                <a class="btn btn-outline-light btn-sm border-dark text-secondary-custom" href="${ctx}/posts/detail?id=${post.id}">
                                    <span class="material-symbols-outlined" style="font-size:18px;">visibility</span>
                                    상세보기
                                </a>
                                <a class="btn btn-dark btn-sm border-dark text-secondary-custom" href="${ctx}/posts/edit?id=${post.id}">
                                    <span class="material-symbols-outlined" style="font-size:18px;">edit</span>
                                    수정
                                </a>
                                <form action="${ctx}/posts/delete" method="post" class="m-0">
                                    <input type="hidden" name="id" value="${post.id}">
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <span class="material-symbols-outlined" style="font-size:18px;">delete</span>
                                        삭제
                                    </button>
                                </form>
                            </div>
                        </div>
                        <h5 class="fw-bold text-white mt-3 mb-2"><c:out value="${post.title}"/></h5>
                        <p class="text-secondary-custom small mb-3"><c:out value="${excerpt}"/></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="text-secondary-custom small">
                                작성자 <c:out value="${post.authorId}"/>
                                <c:if test="${not empty post.deadline}">
                                    • 마감 <c:out value="${post.deadline}"/>
                                </c:if>
                            </div>
                            <div class="d-flex gap-2 align-items-center">
                                <a class="btn btn-dark btn-sm border-dark text-secondary-custom" href="${ctx}/posts/detail?id=${post.id}">
                                    수정/조회
                                </a>
                                <a class="btn btn-outline-light btn-sm border-dark" href="${ctx}/posts/new">
                                    새 글 작성
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <!-- Floating Action Button -->
    <div class="position-fixed bottom-0 end-0 m-4">
        <a class="floating-btn border-0 d-flex align-items-center justify-content-center text-decoration-none" href="${ctx}/posts/new" aria-label="게시글 작성">
            <span class="material-symbols-outlined">edit</span>
        </a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
