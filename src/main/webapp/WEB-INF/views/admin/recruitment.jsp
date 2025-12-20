<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>모집 정보 - Hanpick Admin</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;700&family=Noto+Sans:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --card-dark: #283539;
            --border-dark: #283539;
            --text-secondary: #9db2b9;
        }
        body {
            font-family: 'Lexend', 'Noto Sans', sans-serif;
            background: var(--bg-dark);
            color: #fff;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .sidebar {
            width: 240px;
            background: var(--bg-dark);
            border-right: 1px solid var(--border-dark);
        }
        .sidebar .nav-link {
            color: var(--text-secondary);
            border-radius: 10px;
        }
        .sidebar .nav-link.active, .sidebar .nav-link:hover {
            background: #344248;
            color: #fff;
        }
        .topbar {
            background: var(--bg-dark);
            border-bottom: 1px solid var(--border-dark);
        }
        .card-dark {
            background: var(--card-dark);
            border: 1px solid #3b4d54;
        }
        .text-secondary-custom { color: var(--text-secondary); }
    </style>
</head>
<body>
<div class="d-flex min-vh-100">
    <!-- Sidebar -->
    <aside class="sidebar d-flex flex-column py-3">
        <div class="px-3 mb-4">
            <div class="d-flex align-items-center gap-2">
                <div class="d-flex align-items-center justify-content-center rounded bg-primary text-dark" style="width:32px; height:32px;">
                    <span class="material-symbols-outlined">school</span>
                </div>
                <div>
                    <div class="fw-bold text-white">Hanpick</div>
                    <div class="small text-secondary-custom">관리자 콘솔</div>
                </div>
            </div>
        </div>
        <nav class="nav flex-column gap-1 px-2">
            <c:set var="ctx" value="${pageContext.request.contextPath}"/>
            <c:set var="currentPath" value="${pageContext.request.requestURI}"/>
            <a class="nav-link ${fn:contains(currentPath, '/dashboard') ? 'active' : ''} d-flex align-items-center gap-2" href="${ctx}/admin/dashboard">
                <span class="material-symbols-outlined ${fn:contains(currentPath, '/dashboard') ? 'text-primary' : ''}">dashboard</span>대시보드
            </a>
            <a class="nav-link ${fn:contains(currentPath, '/members') ? 'active' : ''} d-flex align-items-center gap-2" href="${ctx}/admin/members">
                <span class="material-symbols-outlined ${fn:contains(currentPath, '/members') ? 'text-primary' : ''}">group</span>회원 관리
            </a>
            <a class="nav-link ${fn:contains(currentPath, '/posts') ? 'active' : ''} d-flex align-items-center gap-2" href="${ctx}/admin/posts">
                <span class="material-symbols-outlined ${fn:contains(currentPath, '/posts') ? 'text-primary' : ''}">article</span>게시글 관리
            </a>
            <a class="nav-link ${fn:contains(currentPath, '/recruitment') ? 'active' : ''} d-flex align-items-center gap-2" href="${ctx}/admin/recruitment">
                <span class="material-symbols-outlined ${fn:contains(currentPath, '/recruitment') ? 'text-primary' : ''}">event_note</span>모집 정보
            </a>
            <a class="nav-link ${fn:contains(currentPath, '/settings') ? 'active' : ''} d-flex align-items-center gap-2" href="${ctx}/admin/settings">
                <span class="material-symbols-outlined ${fn:contains(currentPath, '/settings') ? 'text-primary' : ''}">settings</span>설정
            </a>
        </nav>
        <div class="mt-auto border-top border-dark px-3 pt-3">
            <a class="d-flex align-items-center gap-2 text-secondary-custom text-decoration-none" href="#">
                <span class="material-symbols-outlined">help</span>고객지원
            </a>
        </div>
    </aside>

    <!-- Main -->
    <div class="flex-grow-1 d-flex flex-column overflow-hidden">
        <!-- Topbar -->
        <header class="topbar d-flex align-items-center justify-content-between px-3 px-md-4 py-3">
            <div class="d-flex align-items-center gap-3">
                <button class="btn btn-outline-light d-md-none border-0"><span class="material-symbols-outlined">menu</span></button>
                <h5 class="mb-0 d-none d-sm-block">모집 정보</h5>
            </div>
            <div class="d-flex align-items-center gap-3 flex-grow-1 justify-content-end">
                <div class="vr d-none d-sm-block" style="background:#283539;"></div>
                <div class="d-flex align-items-center gap-2">
                    <div class="rounded-circle overflow-hidden border border-dark d-flex align-items-center justify-content-center bg-primary" style="width:36px; height:36px;">
                        <span class="material-symbols-outlined text-dark">admin_panel_settings</span>
                    </div>
                    <div class="d-none d-md-flex flex-column">
                        <span class="fw-bold text-white">관리자</span>
                        <span class="small text-secondary-custom">최고 관리자</span>
                    </div>
                    <a href="${ctx}/admin/logout" class="btn btn-outline-light btn-sm border-0 ms-2" title="로그아웃">
                        <span class="material-symbols-outlined">logout</span>
                    </a>
                </div>
            </div>
        </header>

        <!-- Content -->
        <div class="flex-grow-1 overflow-auto p-3 p-md-4">
            <div class="container-fluid" style="max-width: 1400px;">
                <div class="card-dark rounded-4 p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h6 class="fw-bold mb-1 text-white d-flex align-items-center gap-2">
                                <span class="material-symbols-outlined text-primary">event_note</span>모집 정보 통계
                            </h6>
                            <p class="mb-0 text-secondary-custom small">현재 등록된 모집 정보를 카테고리별로 확인할 수 있습니다.</p>
                        </div>
                    </div>
                    <div class="row g-3">
                        <c:choose>
                            <c:when test="${empty categoryStats}">
                                <div class="col-12">
                                    <div class="text-center text-secondary-custom py-4">등록된 모집 정보가 없습니다.</div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="entry" items="${categoryStats}">
                                    <div class="col-12 col-md-6 col-lg-4">
                                        <div class="card-dark rounded-3 p-3">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div>
                                                    <p class="mb-1 text-secondary-custom small">${entry.key}</p>
                                                    <h4 class="mb-0 text-white fw-bold">${entry.value}개</h4>
                                                </div>
                                                <div class="rounded-circle bg-primary d-flex align-items-center justify-content-center" style="width:48px; height:48px;">
                                                    <span class="material-symbols-outlined text-dark">event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

