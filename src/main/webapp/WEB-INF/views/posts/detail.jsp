<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .sidebar-sticky {
            position: sticky;
            top: 96px;
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
                    <div class="rounded-circle overflow-hidden border border-dark" style="width: 36px; height: 36px;">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDv3ySDz3fMSKrAFm_GTaji1utoLokzJBv1wTDXRmuEo3Qr7n9OHR8Mij9syY3wyWVCkuQdixt6dSNApcWh0ts382Hl6daqEspfRjM2mv9ClWtLO7KGtwSUkPiOkLis041pePYRFfjhAwn4sUQU1j0yFr0uTJiX0yVP_F1sW1KxhG1XbuhHcWnqsGBEdR_bFXoHFLXC2XYwdJeUqe1VsGwXCoCvkVwxqf7DE2soPVqmM25ztdBOVbqJmlwJ9bci8rvYXIUSaD_DAaHx" alt="Profile" class="w-100 h-100 object-fit-cover">
                    </div>
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
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-light border-0 text-secondary-custom" data-bs-toggle="dropdown">
                                <span class="material-symbols-outlined">more_horiz</span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="#">수정하기</a></li>
                                <li><a class="dropdown-item text-danger" href="#">삭제하기</a></li>
                            </ul>
                        </div>
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
                            <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">schedule</span>2시간 전</span>
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
                    <h5 class="fw-bold mb-4 d-flex align-items-center gap-2">댓글 <span class="text-primary">3</span></h5>
                    <!-- Input -->
                    <div class="d-flex gap-3 mb-4">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBIHVFqn23BjtZlN9F5Mh210joO2Kvv52Coki0IqPb4rzTlC4DWMxevF3umz8hFgwfdiSkTw-ARcT_907ywcglxIb061ggpOPYHcpUh4crFyvdLJwjYW39mbYwjK5i49BkHqBFNO-BjrnwxL-9ZMBeBh-6ChWZ6EYQ593VMewKkPDaVicAjwZw5veHtjIpdY_VnosNopqYe_Zyg15q6uar8F9TaXT0n9YDUckacN0_-4Iiw28KWuWi_FR7knSsh-4GAuf14CEzCFuCp" alt="User" class="rounded-circle" style="width: 44px; height: 44px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <textarea class="form-control bg-dark border-dark text-white" rows="3" placeholder="궁금한 내용을 질문해보세요."></textarea>
                            <div class="d-flex justify-content-end mt-2">
                                <button class="btn btn-primary btn-sm px-3">등록하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- Comment list -->
                    <div class="d-flex gap-3 mb-3">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuD23Ro86L9PHfkMf4cpmLH6w_L72D6WoPwb3h61bg1szYIkBwvhEel9gBrGMEyINVssVTrKHcjUPhkC30m6eu4MwYFLypTRAHgp7b8h4jaCFm0ep6idm-SDcpyWoA4ajjnjBZRMJYTukQam4VUdjc-Ws0UauYwhUntrEBqz9k0PCd_5ZdS5qq-4_UhsoE2IETwHivaEgATFFtDwpkQVDw0PeGKs6W5vDHSV0u90h7hYmZYWjjUfS0zzILyehO9PQG8LzwZfpnFe8lu0" alt="Commenter" class="rounded-circle" style="width: 44px; height: 44px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div class="fw-bold">이학생</div>
                                <span class="small text-secondary-custom">1시간 전</span>
                            </div>
                            <p class="small text-secondary-custom mb-2">혹시 백엔드 개발자는 모집 계획 없으신가요?</p>
                            <button class="btn btn-link p-0 small text-secondary-custom text-decoration-none d-inline-flex align-items-center gap-1">
                                <span class="material-symbols-outlined" style="font-size:16px;">reply</span> 답글달기
                            </button>
                            <div class="d-flex gap-3 mt-3 ps-3 border-start border-dark">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBqkhK5cbPSi01bIli8QzQi-mpwwAPlA9G8GEPBVUbvrVN7cBZyRPzoNc7WoJD3NapASyAsfhCfC3kNqiDHhMVNKHs1CkVzrWfAgaRZBOA9-IasCier_DKuo1Fczw6D-mS2LsUzdye7s4gFMohXxp-x6Steb5VFVBqBCRT9PepWEv_uxYwW2C1Jx5dJ_PC4Tl-4XrylWcXTSJtJ4MpT9fT-M1vDA-6f73Wy8OK8OYCO2D__iNwwNKwbOMrUMP_fJhOTU_BoR2OJYzmg" alt="Reply" class="rounded-circle" style="width: 36px; height: 36px; object-fit: cover;">
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <div class="fw-bold text-primary d-flex align-items-center gap-1">김학생 <span class="badge bg-primary bg-opacity-25 text-primary border border-primary">작성자</span></div>
                                        <span class="small text-secondary-custom">50분 전</span>
                                    </div>
                                    <p class="small text-secondary-custom mb-0">안녕하세요! 현재 백엔드는 충원된 상태라 이번에는 프론트엔드만 모집합니다. 관심 가져주셔서 감사합니다! :)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex gap-3">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuA1-VW0Q4FBIFY0zyThrgL1hNV2gOvEmSB3JQsndFu9MPI_Dh4YPEdeivgNOxTmtwVUU3m6g7clsrQniK_0dudj45463LXM7x-cJ3KZSqb2nPWphyzMycShjem8Mo1Ycr8BI8iFgP-kX2nQEC93O7cRs9-ppNiArm-ri2OFgplczpRYkUq3lAQqvI2vRfpUiMUnE8-LajQTMt_dZlb0QqbSoii00n0iBqbYIkUB1kfwKoFek1apdOR-BYtZ64bK31-ETorEVXwWa6C-" alt="Commenter" class="rounded-circle" style="width: 44px; height: 44px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <div class="fw-bold">박학우</div>
                                <span class="small text-secondary-custom">30분 전</span>
                            </div>
                            <p class="small text-secondary-custom mb-2">디자이너 포트폴리오 필수인가요?</p>
                            <button class="btn btn-link p-0 small text-secondary-custom text-decoration-none d-inline-flex align-items-center gap-1">
                                <span class="material-symbols-outlined" style="font-size:16px;">reply</span> 답글달기
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right -->
            <div class="col-lg-4 d-flex flex-column gap-4">
                <div class="card-dark rounded-4 shadow sidebar-sticky">
                    <div class="p-3 border-bottom border-dark bg-primary bg-opacity-10">
                        <h5 class="fw-bold text-primary d-flex align-items-center gap-2 mb-0"><span class="material-symbols-outlined">info</span>모집 정보</h5>
                    </div>
                    <div class="p-4 d-flex flex-column gap-4">
                        <div class="text-center">
                            <div class="text-uppercase text-secondary-custom small fw-semibold mb-1">마감까지</div>
                            <div class="display-6 fw-bold text-white">D-5</div>
                            <div class="text-secondary-custom small">2024.05.20 (월) 마감</div>
                        </div>
                        <div>
                            <div class="d-flex justify-content-between small fw-semibold mb-2">
                                <span class="text-secondary-custom">현재 지원자</span>
                                <span class="text-primary">2명 <span class="text-secondary-custom fw-normal">/ 4명 모집</span></span>
                            </div>
                            <div class="progress bg-dark" style="height: 10px;">
                                <div class="progress-bar bg-primary" style="width:50%;"></div>
                            </div>
                        </div>
                        <hr class="border-dark"/>
                        <dl class="row mb-0 small">
                            <dt class="col-5 text-secondary-custom">카테고리</dt>
                            <dd class="col-7 text-white">팀 프로젝트</dd>
                            <dt class="col-5 text-secondary-custom">모임 장소</dt>
                            <dd class="col-7 text-white">오석관 305호</dd>
                            <dt class="col-5 text-secondary-custom">연락처</dt>
                            <dd class="col-7 text-white">카카오톡 오픈채팅</dd>
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
                        <div>
                            <a class="text-decoration-none text-white fw-semibold d-block" href="#">2024-1 창업 경진대회 팀원 구합니다 (디자이너)</a>
                            <div class="d-flex gap-2 align-items-center text-secondary-custom small mt-1">
                                <span class="badge bg-dark border border-dark text-secondary-custom">공모전</span>•<span>모집중</span>
                            </div>
                        </div>
                        <hr class="border-dark"/>
                        <div>
                            <a class="text-decoration-none text-white fw-semibold d-block" href="#">Flutter 스터디 같이 하실 분? (초보 환영)</a>
                            <div class="d-flex gap-2 align-items-center text-secondary-custom small mt-1">
                                <span class="badge bg-dark border border-dark text-secondary-custom">스터디</span>•<span>마감임박</span>
                            </div>
                        </div>
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
