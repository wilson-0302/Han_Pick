<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - Post Detail</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --surface-dark: #152329;
            --border-dark: #283539;
            --text-secondary: #9db2b9;
        }
        body {
            font-family: 'Lexend', sans-serif;
            background: var(--bg-dark);
            color: #fff;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .navbar {
            background: rgba(21, 35, 41, 0.9);
            border-bottom: 1px solid var(--border-dark);
            backdrop-filter: blur(8px);
        }
        .nav-link {
            color: #fff !important;
            font-weight: 600;
        }
        .nav-link:hover, .nav-link.active {
            color: var(--color-primary) !important;
        }
        .card-dark {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .text-secondary-custom {
            color: var(--text-secondary);
        }
        .badge-tag {
            font-size: 0.7rem;
            letter-spacing: 0.05em;
        }
        .prose p, .prose ul, .prose li {
            color: #d9e1e5;
        }
        .prose strong {
            color: #fff;
        }
        .attachment-card:hover {
            border-color: var(--color-primary);
            background: rgba(43, 189, 238, 0.05);
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="similarPosts" value="${requestScope.similarPosts}" />
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
<div class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-lg">
            <div class="d-flex align-items-center gap-2 text-white fw-bold fs-5" role="button">
                <div class="rounded-3 bg-primary text-dark fw-bold d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">H</div>
                Hanpick
            </div>
            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navMenu">
                <ul class="navbar-nav gap-lg-4 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="${ctx}/">홈</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${ctx}/list">모집</a></li>
                    <li class="nav-item"><a class="nav-link" href="${ctx}/posts/manage">마이페이지</a></li>
                </ul>
                <div class="d-flex align-items-center gap-2">
                    <button class="btn btn-outline-light border-0 px-3"><span class="material-symbols-outlined">notifications</span></button>
                    <a class="rounded-circle overflow-hidden border border-dark d-block" style="width: 36px; height: 36px;" href="${ctx}/auth/profile" aria-label="프로필">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDv3ySDz3fMSKrAFm_GTaji1utoLokzJBv1wTDXRmuEo3Qr7n9OHR8Mij9syY3wyWVCkuQdixt6dSNApcWh0ts382Hl6daqEspfRjM2mv9ClWtLO7KGtwSUkPiOkLis041pePYRFfjhAwn4sUQU1j0yFr0uTJiX0yVP_F1sW1KxhG1XbuhHcWnqsGBEdR_bFXoHFLXC2XYwdJeUqe1VsGwXCoCvkVwxqf7DE2soPVqmM25ztdBOVbqJmlwJ9bci8rvYXIUSaD_DAaHx" alt="Profile" class="w-100 h-100 object-fit-cover">
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main -->
    <main class="container-lg flex-grow-1 py-4">
        <!-- Breadcrumb -->
        <nav class="mb-4">
            <ol class="breadcrumb small mb-0">
                <li class="breadcrumb-item"><a class="text-decoration-none text-secondary-custom" href="${ctx}/list">모집</a></li>
                <li class="breadcrumb-item active text-white" aria-current="page"><c:out value="${post.title}"/></li>
            </ol>
        </nav>

        <div class="row g-4">
            <!-- Left -->
            <div class="col-lg-8 d-flex flex-column gap-4">
                <!-- Post header -->
                <div class="card-dark rounded-4 p-4">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div class="d-flex gap-2">
                            <span class="badge bg-primary text-dark badge-tag"><c:out value="${post.category}"/></span>
                            <span class="badge bg-success bg-opacity-75 text-white badge-tag"><c:out value="${post.status}"/></span>
                        </div>
                        <c:if test="${isOwner}">
                            <div class="d-flex gap-2">
                                <a class="btn btn-outline-light btn-sm border-dark text-secondary-custom d-flex align-items-center gap-1" href="${ctx}/posts/edit?id=${post.id}">
                                    <span class="material-symbols-outlined" style="font-size:18px;">edit</span> 수정
                                </a>
                                <form action="${ctx}/posts/delete" method="post" class="m-0">
                                    <input type="hidden" name="id" value="${post.id}">
                                    <button type="submit" class="btn btn-danger btn-sm d-flex align-items-center gap-1">
                                        <span class="material-symbols-outlined" style="font-size:18px;">delete</span> 삭제
                                    </button>
                                </form>
                            </div>
                        </c:if>
                    </div>
                    <h1 class="h3 fw-bold mb-4"><c:out value="${post.title}"/></h1>
                    <div class="d-flex justify-content-between align-items-center border-top border-dark pt-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="rounded-circle bg-primary d-flex align-items-center justify-content-center text-dark fw-bold" style="width: 44px; height: 44px;">
                                <span class="material-symbols-outlined">person</span>
                            </div>
                            <div>
                                <div class="fw-semibold text-white"><c:out value="${post.authorId}"/></div>
                                <c:if test="${not empty post.deadline}">
                                    <div class="small text-secondary-custom">마감일: <c:out value="${post.deadline}"/></div>
                                </c:if>
                            </div>
                        </div>
                        <div class="d-flex gap-3 small text-secondary-custom">
                            <c:if test="${not empty post.createdAt}">
                                <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">schedule</span><c:out value="${post.createdAt}"/></span>
                            </c:if>
                            <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span><c:out value="${post.viewCount}"/></span>
                        </div>
                    </div>
                </div>

                <!-- Body -->
                <div class="card-dark rounded-4 p-4 p-md-5">
                    <article class="prose">
                        <pre class="fs-6 mb-0 text-white" style="white-space: pre-wrap; background: none; border: 0;"><c:out value="${post.content}"/></pre>
                    </article>

                    <!-- Contact -->
                    <div class="mt-4 pt-4 border-top border-dark">
                        <h6 class="fw-bold mb-3">지원/연락</h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="d-flex align-items-center p-3 rounded-3 border border-dark text-white attachment-card">
                                    <div class="rounded bg-primary bg-opacity-25 text-primary d-flex align-items-center justify-content-center me-3" style="width:40px; height:40px;">
                                        <span class="material-symbols-outlined">link</span>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="small fw-semibold text-white text-truncate">
                                            <c:out value="${post.contactLink}"/>
                                        </div>
                                        <div class="text-secondary-custom small">
                                            마감일: <c:out value="${post.deadline}"/> /
                                            상태: <c:out value="${post.status}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Comments -->
                <div class="card-dark rounded-4 p-4">
                    <h5 class="fw-bold mb-4 d-flex align-items-center gap-2">댓글</h5>
                    <div class="d-flex flex-column align-items-center justify-content-center text-secondary-custom py-3">
                        <span class="material-symbols-outlined mb-1 text-primary">chat_bubble</span>
                        댓글 기능은 준비 중입니다.
                    </div>
                </div>
            </div>

            <!-- Right -->
            <div class="col-lg-4 d-flex flex-column gap-4">
                <div class="card-dark rounded-4 shadow">
                    <div class="p-3 border-bottom border-dark bg-primary bg-opacity-10">
                        <h5 class="fw-bold text-primary d-flex align-items-center gap-2 mb-0"><span class="material-symbols-outlined">info</span>모집 정보</h5>
                    </div>
                    <div class="p-4 d-flex flex-column gap-4">
                        <div class="text-center">
                            <div class="text-uppercase text-secondary-custom small fw-semibold mb-1">상태</div>
                            <div class="display-6 fw-bold text-white"><c:out value="${statusLabel}"/></div>
                            <c:choose>
                                <c:when test="${not empty post.deadline}">
                                    <div class="text-secondary-custom small">마감일: <c:out value="${post.deadline}"/></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-secondary-custom small">마감일 정보 없음</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div>
                            <div class="d-flex justify-content-between small fw-semibold mb-2">
                                <span class="text-secondary-custom">모집 인원</span>
                                <span class="text-primary">
                                    <c:choose>
                                        <c:when test="${not empty post.headcount}">
                                            <c:out value="${post.headcount}"/>명
                                        </c:when>
                                        <c:otherwise>미정</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="d-flex justify-content-between small fw-semibold mb-2">
                                <span class="text-secondary-custom">조회수</span>
                                <span class="text-primary"><c:out value="${post.viewCount}" default="0"/></span>
                            </div>
                        </div>
                        <hr class="border-dark"/>
                        <dl class="row mb-0 small">
                            <dt class="col-5 text-secondary-custom">카테고리</dt>
                            <dd class="col-7 text-white"><c:out value="${post.category}" default="미정"/></dd>
                            <dt class="col-5 text-secondary-custom">상태</dt>
                            <dd class="col-7 text-white"><c:out value="${statusLabel}"/></dd>
                            <dt class="col-5 text-secondary-custom">연락처</dt>
                            <dd class="col-7 text-white">
                                <c:choose>
                                    <c:when test="${not empty post.contactLink}">
                                        <a class="text-primary text-decoration-none" href="${post.contactLink}" target="_blank" rel="noopener noreferrer"><c:out value="${post.contactLink}"/></a>
                                    </c:when>
                                    <c:otherwise>제공된 연락처 없음</c:otherwise>
                                </c:choose>
                            </dd>
                        </dl>
                        <div class="d-grid gap-2">
                            <div class="d-flex gap-2">
                                <button class="btn btn-dark flex-grow-1 text-secondary-custom border-dark"><span class="material-symbols-outlined">favorite_border</span></button>
                                <button class="btn btn-dark flex-grow-1 text-secondary-custom border-dark"><span class="material-symbols-outlined">share</span></button>
                            </div>
                            <button class="btn btn-primary fw-bold">지원하기</button>
                        </div>
                    </div>
                </div>

                <div class="card-dark rounded-4 p-4">
                    <h6 class="fw-bold mb-3">비슷한 모집글</h6>
                    <div class="d-flex flex-column gap-3">
                        <c:if test="${empty similarPosts}">
                            <div class="text-secondary-custom small">비슷한 모집글이 없습니다.</div>
                        </c:if>
                        <c:forEach var="similar" items="${similarPosts}">
                            <div>
                                <a class="text-decoration-none text-white fw-semibold d-block" href="${ctx}/posts/detail?id=${similar.id}">
                                    <c:out value="${similar.title}" default="제목 없음"/>
                                </a>
                                <div class="d-flex gap-2 align-items-center text-secondary-custom small mt-1">
                                    <span class="badge bg-dark border border-dark text-secondary-custom"><c:out value="${similar.category}" default="카테고리"/></span>
                                    <span>• <c:out value="${similar.status}" default="상태 미지정"/></span>
                                </div>
                            </div>
                            <hr class="border-dark"/>
                        </c:forEach>
                        <c:if test="${not empty similarPosts}">
                            <hr class="border-dark"/>
                            <a class="text-primary small text-decoration-none fw-bold" href="${ctx}/list">다른 모집글 더 보기</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="mt-4 py-4 border-top border-dark" style="background:#0f1a1f;">
        <div class="container-lg d-flex flex-column flex-md-row justify-content-between align-items-center gap-2">
            <div class="text-center text-md-start">
                <div class="fw-bold text-white">Hanpick</div>
                <div class="small text-secondary-custom">© 2024 Hanpick. All rights reserved.</div>
            </div>
            <div class="d-flex gap-3">
                <a class="text-secondary-custom text-decoration-none small" href="#">이용약관</a>
                <a class="text-secondary-custom text-decoration-none small" href="#">개인정보처리방침</a>
                <a class="text-secondary-custom text-decoration-none small" href="#">문의하기</a>
            </div>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
