<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Hanpick - 한동대학교 통합 모집 플랫폼</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet"/>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <!-- Bootstrap -->
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
        .hero-card, .feature-card, .cta-card {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .stats-wrap {
            background: rgba(28, 36, 39, 0.3);
            border-top: 1px solid var(--border-dark);
            border-bottom: 1px solid var(--border-dark);
        }
        .section-title {
            letter-spacing: 0.02em;
            font-weight: 800;
        }
        .badge-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            padding: 0.35rem 0.75rem;
            border-radius: 999px;
            background: var(--color-primary);
            color: #0a1115;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            font-size: 0.75rem;
        }
        .feature-card {
            transition: border-color 0.2s ease, transform 0.2s ease;
        }
        .feature-card:hover {
            border-color: var(--color-primary);
            transform: translateY(-2px);
        }
        .stats-icon, .feature-icon {
            color: var(--color-primary);
        }
        .text-secondary-custom {
            color: var(--text-secondary);
        }
        .cta-bg {
            background: linear-gradient(135deg, rgba(43, 189, 238, 0.12), rgba(16, 29, 34, 0.9));
        }
        .footer {
            border-top: 1px solid var(--border-dark);
            background: #0f1a1f;
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${sessionScope.user}" />
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-lg">
        <div class="d-flex align-items-center text-white fw-bold fs-5">
            <span class="material-symbols-outlined me-2 fs-3 text-primary">school</span>
            Hanpick
        </div>
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navMenu">
            <ul class="navbar-nav me-3 mb-2 mb-lg-0 gap-lg-4">
                <li class="nav-item"><a class="nav-link" href="#hero">소개</a></li>
                <li class="nav-item"><a class="nav-link" href="#features">기능</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/list">팀 찾기</a></li>
                <li class="nav-item"><a class="nav-link" href="#footer">문의하기</a></li>
            </ul>
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="d-flex align-items-center gap-2">
                        <span class="text-secondary-custom small d-none d-md-inline">안녕하세요, <span class="text-white fw-semibold"><c:out value="${user.name}" default="회원"/></span>님</span>
                        <a class="btn btn-outline-light px-3" href="${ctx}/posts/manage">내 글 관리</a>
                        <a class="btn btn-primary px-3 text-dark fw-bold" href="${ctx}/posts/new">글쓰기</a>
                        <a class="btn btn-outline-light border-0 px-3" href="${ctx}/auth/profile" aria-label="프로필">
                            <span class="material-symbols-outlined">account_circle</span>
                        </a>
                        <a class="btn btn-outline-light px-3" href="${ctx}/auth/logout">로그아웃</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-flex gap-2">
                        <a class="btn btn-primary px-3" href="${ctx}/auth/signup">회원가입</a>
                        <a class="btn btn-outline-light px-3" href="${ctx}/auth/login">로그인</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<main>
    <!-- Hero -->
    <section id="hero" class="container-lg py-5 py-md-5">
        <div class="row align-items-center g-4 flex-column-reverse flex-lg-row">
            <div class="col-lg-6 d-flex flex-column gap-3">
                <h1 class="display-5 fw-bold">
                    한동의 모든 기회,<br><span class="text-primary">여기서 픽하다</span>
                </h1>
                <p class="text-secondary-custom fs-6 mb-2">
                    한동대학교 통합 모집·정보 플랫폼, Hanpick.<br>
                    동아리, 학회, 프로젝트 팀원을 찾는 가장 쉬운 방법입니다.
                </p>
                <div class="d-flex flex-wrap gap-2">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <a class="btn btn-primary btn-lg px-4" href="${ctx}/list">모집글 둘러보기</a>
                            <a class="btn btn-outline-light btn-lg px-4" href="${ctx}/posts/manage">내 글 관리</a>
                            <a class="btn btn-outline-light btn-lg px-4" href="${ctx}/posts/new">글쓰기</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-primary btn-lg px-4" href="${ctx}/auth/signup">시작하기</a>
                            <a class="btn btn-outline-light btn-lg px-4" href="${ctx}/auth/login">로그인</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hero-card rounded-4 shadow-lg overflow-hidden">
                    <div class="position-relative">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCO5HultWwQNP4yua3kWMlnyVCKhTqHcnnQ1Ks77sdpnTmjNJ6hpzP-5g0UgFup2xacixgC4xQkoZUFWpcO98W0HIVTmcNiglmU0wHeKCOd-5XmLtZ2ErEiEazubdoYC7FtPTi8EhCQZLDpBa4M_OGDtg_-uFATZIy35o2Ee-JMMlKeDRyRto3zAGcCu7j1fqYA_AflhtpPEH5UhtpuloQ2dQ00z5oZsjkhHX0OMpT2yP9hcBGrpJ1VvZwx6n8MQAXzWm6unEq_6dxB" alt="Hero illustration" class="img-fluid w-100" style="object-fit: cover; aspect-ratio: 16/9;">
                        <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(135deg, rgba(16,29,34,0.8), transparent);"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats -->
    <section class="stats-wrap py-4">
        <div class="container-lg">
            <div class="row text-center gy-4 align-items-center">
                <div class="col-12 col-md-4">
                    <div class="d-flex flex-column align-items-center gap-1">
                        <span class="material-symbols-outlined stats-icon fs-1">groups</span>
                        <div class="fs-2 fw-bold">50+</div>
                        <div class="text-secondary-custom">활성 그룹</div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="d-flex flex-column align-items-center gap-1">
                        <span class="material-symbols-outlined stats-icon fs-1">school</span>
                        <div class="fs-2 fw-bold">1,200+</div>
                        <div class="text-secondary-custom">등록된 학생</div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="d-flex flex-column align-items-center gap-1">
                        <span class="material-symbols-outlined stats-icon fs-1">folder_open</span>
                        <div class="fs-2 fw-bold">300+</div>
                        <div class="text-secondary-custom">누적 프로젝트</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features -->
    <section id="features" class="container-lg py-5">
        <div class="text-center mb-5">
            <div class="text-primary fw-bold text-uppercase mb-2" style="letter-spacing: 0.08em;">Features</div>
            <h2 class="section-title fs-1">주요 기능</h2>
                        <p class="text-secondary-custom mb-0">Hanpick이 제공하는 핵심 기능을 확인해보세요.</p>
        </div>
        <div class="row g-4">
            <div class="col-12 col-md-4">
                <div class="feature-card rounded-3 p-4 h-100">
                    <div class="d-flex align-items-center justify-content-center rounded-circle bg-primary bg-opacity-10 text-primary mb-3" style="width: 48px; height: 48px;">
                        <span class="material-symbols-outlined">notifications_active</span>
                    </div>
                    <h5 class="fw-bold mb-2">실시간 모집 공고</h5>
                    <p class="text-secondary-custom mb-0">놓치지 않는 실시간 모집 알림을 받아보세요. 원하는 분야의 공고를 즉시 확인할 수 있습니다.</p>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="feature-card rounded-3 p-4 h-100">
                    <div class="d-flex align-items-center justify-content-center rounded-circle bg-primary bg-opacity-10 text-primary mb-3" style="width: 48px; height: 48px;">
                        <span class="material-symbols-outlined">assignment_turned_in</span>
                    </div>
                    <h5 class="fw-bold mb-2">간편 지원 시스템</h5>
                    <p class="text-secondary-custom mb-0">복잡한 서류 없이 클릭 몇 번으로 지원이 완료됩니다. 나의 이력을 관리하고 손쉽게 제출하세요.</p>
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="feature-card rounded-3 p-4 h-100">
                    <div class="d-flex align-items-center justify-content-center rounded-circle bg-primary bg-opacity-10 text-primary mb-3" style="width: 48px; height: 48px;">
                        <span class="material-symbols-outlined">diversity_3</span>
                    </div>
                    <h5 class="fw-bold mb-2">팀 빌딩 매칭</h5>
                    <p class="text-secondary-custom mb-0">나에게 딱 맞는 팀원을 쉽고 빠르게 찾아보세요. 스킬셋 기반 매칭으로 최적의 팀을 구성합니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Dashboard CTA -->
    <section id="dashboard" class="container-lg pb-5">
        <div class="cta-card rounded-4 overflow-hidden">
            <div class="row g-0">
                <div class="col-lg-6 p-5 d-flex flex-column justify-content-center gap-3">
                    
                    <h3 class="fw-bold fs-2 mb-0">더 쉽고 효율적인<br>팀 관리</h3>
                    <p class="text-secondary-custom mb-2">지원자 관리부터 합격자 발표까지, Hanpick 대시보드에서 한눈에 관리하세요. 복잡한 절차를 자동화하여 본질에 집중할 수 있습니다.</p>
                    <a class="btn btn-outline-light d-inline-flex align-items-center gap-1 px-3" href="${ctx}/list">
                        기능 더보기
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
                <div class="col-lg-6 position-relative">
                    <div class="h-100" style="background: radial-gradient(circle at 20% 20%, rgba(43,189,238,0.2), transparent 40%), var(--bg-dark);">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBuoUZictNBm67fNzeb6i8ZTHWjC33AuHGSFutbkDj9h-hCd1vHX-mWWFHd_x4s-rTCBXlvQtJMNnQUOwWVcvZZuPoh2uidru4IrBnvy9wjFv_l_PgpyZvhPfbrZnRQoczEgMhWN4-IVVA4AjSPEMUJBgDeRPdv0ZP699weNNvGUhAwI9p_HRjaD_asAfIoCkGM8ezzUFiwCAaXGbg4_6I8IDPnUnQ9NoPbtWGjPomZ-7eWgocke7eBPZ5cg4pMlot5DfCXxQkNsWnv" alt="Dashboard preview" class="img-fluid w-100 h-100" style="object-fit: cover;">
                        <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(90deg, rgba(16,29,34,0.85), transparent);"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Final CTA -->
    <section class="container-lg py-5">
        <div class="text-center cta-bg rounded-4 p-5">
            <h2 class="fw-bold fs-1 mb-3">지금 바로 시작하세요</h2>
            <p class="text-secondary-custom fs-6 mb-4">
                한동대학교 학우들과 함께 성장하는 즐거움, Hanpick에서 경험해보세요.
            </p>
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="d-flex flex-wrap justify-content-center gap-2">
                        <a class="btn btn-primary btn-lg px-4" href="${ctx}/list">모집글 둘러보기</a>
                        <a class="btn btn-outline-light btn-lg px-4" href="${ctx}/posts/manage">내 글 관리</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-primary btn-lg px-4" href="${ctx}/auth/signup">무료로 회원가입</a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</main>

<!-- Footer -->
<footer id="footer" class="footer py-5 mt-4">
    <div class="container-lg">
        <div class="row gy-4">
            <div class="col-md-4">
                <div class="d-flex align-items-center text-white fw-bold mb-2">
                    <span class="material-symbols-outlined me-2 text-primary">school</span>
                    Hanpick
                </div>
                <p class="text-secondary-custom mb-0">한동대학교 학생들을 위한<br>통합 모집 및 정보 플랫폼</p>
            </div>
            <div class="col-md-4 d-flex gap-5">
                <div>
                    <h6 class="text-white fw-bold">서비스</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a class="text-secondary-custom text-decoration-none" href="#features">기능 소개</a></li>
                        <li><a class="text-secondary-custom text-decoration-none" href="${ctx}/list">팀 찾기</a></li>
                        <li><a class="text-secondary-custom text-decoration-none" href="#dashboard">프로젝트</a></li>
                    </ul>
                </div>
                <div>
                    <h6 class="text-white fw-bold">지원</h6>
                    <ul class="list-unstyled mb-0">
                        <li><a class="text-secondary-custom text-decoration-none" href="#footer">자주 묻는 질문</a></li>
                        <li><a class="text-secondary-custom text-decoration-none" href="#footer">문의하기</a></li>
                        <li><a class="text-secondary-custom text-decoration-none" href="#footer">이용약관</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <h6 class="text-white fw-bold">Contact</h6>
                <a class="text-secondary-custom text-decoration-none" href="mailto:support@handongpick.com">support@handongpick.com</a>
            </div>
        </div>
        <div class="border-top border-dark mt-4 pt-3 text-secondary-custom small">
            © 2024 Hanpick. All rights reserved.
        </div>
    </div>
</footer>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
