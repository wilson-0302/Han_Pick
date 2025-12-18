<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - Find Your Opportunity</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --card-dark: #16262c;
            --card-light: #ffffff;
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
            background: rgba(16, 29, 34, 0.9);
            border-bottom: 1px solid var(--border-dark);
            backdrop-filter: blur(8px);
        }
        .nav-link {
            color: #fff !important;
            font-weight: 600;
        }
        .nav-link.active, .nav-link:hover, .nav-link:focus {
            color: var(--color-primary) !important;
        }
        .search-input {
            background: #1a2a30;
            border: 1px solid var(--border-dark);
            color: #fff;
        }
        .search-input:focus {
            background: #1f3036;
            border-color: var(--color-primary);
            box-shadow: 0 0 0 0.2rem rgba(43, 189, 238, 0.15);
            color: #fff;
        }
        .chip-btn {
            background: #1f3036;
            color: #cfd8dc;
            border: 1px solid transparent;
        }
        .chip-btn:hover {
            color: var(--color-primary);
            border-color: rgba(43, 189, 238, 0.3);
            background: rgba(43, 189, 238, 0.08);
        }
        .filter-card, .sort-bar {
            background: #132026;
            border: 1px solid var(--border-dark);
        }
        .card-post {
            background: var(--card-dark);
            border: 1px solid var(--border-dark);
            transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
        }
        .card-post:hover {
            border-color: var(--color-primary);
            box-shadow: 0 12px 24px rgba(43, 189, 238, 0.12);
            transform: translateY(-2px);
        }
        .badge-tag {
            font-size: 0.65rem;
            letter-spacing: 0.06em;
        }
        .floating-btn {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: var(--color-primary);
            color: #0a1115;
            box-shadow: 0 12px 24px rgba(43, 189, 238, 0.35);
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="d-flex flex-column min-vh-100">
    <!-- Header -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-lg">
            <div class="d-flex align-items-center gap-2 text-white fw-bold fs-5">
                <span class="material-symbols-outlined filled text-primary">hub</span>
                Hanpick
            </div>
            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navMenu">
                <ul class="navbar-nav gap-lg-4">
                    <li class="nav-item"><a class="nav-link" href="${ctx}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${ctx}/list">Recruitment</a></li>
                    <li class="nav-item"><a class="nav-link" href="${ctx}/posts/manage">My Posts</a></li>
                </ul>
            </div>
            <div class="d-flex align-items-center gap-2">
                <button class="btn btn-outline-light border-0 px-3">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <button class="btn btn-outline-light border-0 px-3">
                    <span class="material-symbols-outlined">account_circle</span>
                </button>
            </div>
        </div>
    </nav>

    <!-- Hero -->
    <section class="w-100 border-bottom border-dark" style="background:#132026;">
        <div class="container-lg py-5 d-flex flex-column align-items-center gap-4">
            <h1 class="text-white text-center fw-bold display-6 mb-2">Find Your <span class="text-primary">Opportunity</span></h1>
            <div class="w-100" style="max-width:720px;">
                <div class="position-relative">
                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-secondary">search</span>
                    <input type="text" class="form-control form-control-lg search-input ps-5" placeholder="Search for project, team, or contest...">
                </div>
            </div>
            <div class="d-flex flex-wrap justify-content-center gap-2">
                <button class="btn chip-btn btn-sm rounded-pill px-3">#FrontEnd</button>
                <button class="btn chip-btn btn-sm rounded-pill px-3">#Design</button>
                <button class="btn chip-btn btn-sm rounded-pill px-3">#SpringCamps</button>
                <button class="btn chip-btn btn-sm rounded-pill px-3">#Freshman</button>
                <button class="btn chip-btn btn-sm rounded-pill px-3">#GlobalTeam</button>
            </div>
        </div>
    </section>

    <!-- Main -->
    <main class="container-lg flex-grow-1 py-5">
        <div class="row g-4">
            <!-- Sidebar -->
            <aside class="col-12 col-lg-3">
                <div class="filter-card rounded-3 p-3 mb-3">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h5 class="text-white mb-0">Category</h5>
                    </div>
                    <div class="d-flex flex-column gap-2">
                        <div class="form-check">
                            <input class="form-check-input bg-dark border-secondary" type="checkbox" id="cat-all" checked>
                            <label class="form-check-label text-secondary" for="cat-all">All Posts</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input bg-dark border-secondary" type="checkbox" id="cat-project">
                            <label class="form-check-label text-secondary" for="cat-project">Project Recruitment</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input bg-dark border-secondary" type="checkbox" id="cat-competition">
                            <label class="form-check-label text-secondary" for="cat-competition">Competitions</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input bg-dark border-secondary" type="checkbox" id="cat-study">
                            <label class="form-check-label text-secondary" for="cat-study">Study Groups</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input bg-dark border-secondary" type="checkbox" id="cat-club">
                            <label class="form-check-label text-secondary" for="cat-club">Clubs</label>
                        </div>
                    </div>
                </div>

                <div class="filter-card rounded-3 p-3 mb-3">
                    <h5 class="text-white mb-3">Status</h5>
                    <div class="d-flex align-items-center justify-content-between px-3 py-2 rounded-3 border border-dark">
                        <span class="text-secondary small">Recruiting Only</span>
                        <div class="form-check form-switch m-0">
                            <input class="form-check-input" type="checkbox" id="statusToggle" checked>
                        </div>
                    </div>
                </div>

                <div class="filter-card rounded-3 p-3">
                    <h5 class="text-white mb-3">Position</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <span class="badge bg-dark border border-secondary text-secondary">Developer</span>
                        <span class="badge bg-dark border border-secondary text-secondary">Designer</span>
                        <span class="badge bg-dark border border-secondary text-secondary">PM</span>
                        <span class="badge bg-dark border border-secondary text-secondary">Planner</span>
                    </div>
                </div>
            </aside>

            <!-- Content -->
            <section class="col-12 col-lg-9">
                <div class="d-flex flex-column flex-md-row align-items-start align-items-md-center justify-content-between gap-3 mb-4">
                    <p class="text-secondary small mb-0">총 <span class="fw-bold text-white"><c:out value="${fn:length(posts)}"/></span>건</p>
                </div>

                <div class="row g-3">
                    <c:if test="${empty posts}">
                        <div class="col-12">
                            <div class="card-post rounded-3 p-4 text-center text-secondary">
                                게시글이 없습니다. 첫 글을 작성해보세요.
                            </div>
                        </div>
                    </c:if>

                    <c:forEach var="post" items="${posts}">
                        <div class="col-12 col-md-6 col-xl-4">
                            <a class="text-decoration-none" href="${ctx}/posts/detail?id=${post.id}">
                                <div class="card-post rounded-3 h-100 overflow-hidden">
                                    <div class="position-relative" style="height: 180px; background:#1a2a30;">
                                        <c:choose>
                                            <c:when test="${not empty post.imageUrl}">
                                                <img src="${post.imageUrl}" alt="post thumbnail" class="w-100 h-100" style="object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="w-100 h-100 d-flex align-items-center justify-content-center text-secondary">
                                                    <span class="material-symbols-outlined">image_not_supported</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${not empty post.deadline}">
                                            <span class="badge text-bg-primary position-absolute top-0 end-0 m-2 fw-bold"><c:out value="${post.deadline}"/></span>
                                        </c:if>
                                    </div>
                                    <div class="p-3 d-flex flex-column h-100">
                                        <div class="d-flex align-items-center gap-2 mb-2">
                                            <span class="badge bg-primary text-dark badge-tag"><c:out value="${post.category}"/></span>
                                            <span class="badge bg-success bg-opacity-75 text-white badge-tag"><c:out value="${post.status}"/></span>
                                        </div>
                                        <h5 class="fw-bold text-white mb-2"><c:out value="${post.title}"/></h5>
                                        <p class="text-secondary small mb-3 flex-grow-1"><c:out value="${post.content}"/></p>
                                        <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                            <div class="text-secondary small">
                                                <span class="material-symbols-outlined align-middle" style="font-size:16px;">person</span>
                                                <c:out value="${post.authorId}"/>
                                            </div>
                                            <div class="d-flex align-items-center gap-2 text-secondary small">
                                                <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span><c:out value="${post.viewCount}"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>

                <!-- Load more -->
                <div class="d-flex justify-content-center mt-4">
                    <button class="btn btn-dark border border-dark px-4 py-2 text-secondary fw-bold">Load More Opportunities</button>
                </div>
            </section>
        </div>
    </main>

    <!-- Floating Action Button -->
    <div class="position-fixed bottom-0 end-0 m-4">
        <button class="floating-btn border-0 d-flex align-items-center justify-content-center">
            <span class="material-symbols-outlined">edit</span>
        </button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
