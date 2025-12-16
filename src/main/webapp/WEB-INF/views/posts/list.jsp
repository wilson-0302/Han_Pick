<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <p class="text-secondary small mb-0">Showing <span class="fw-bold text-white">12</span> active opportunities</p>
                    <div class="sort-bar rounded-3 p-1 d-flex gap-1">
                        <button class="btn btn-primary btn-sm fw-bold">Latest</button>
                        <button class="btn btn-dark btn-sm text-secondary border-0">Closing Soon</button>
                        <button class="btn btn-dark btn-sm text-secondary border-0">Popular</button>
                    </div>
                </div>

                <div class="row g-3">
                    <!-- Card 1 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDcXr7RZ9oO7xjqY1-AVK-H1nxF_GAvvzQ-VXjB9OkFiaNYR0UNFJt8rpa9VKGkKhCkrk345UcT7-UTw1Wj7tQdp_Xng1FJM7VB0ktwLxB6CTho2yLTpM0fao97shCryeT3dTf-Z3wZNzQqW17UqWF-ZU0OT8eSCLVKcU4lMX2KTUMnOaXkk_58VbqTL3eGuy1xEOYGHDsg2ZmfXI8XAoFUycTKkjxIpwc7IOZ1H1QvsSpHSMFmfKmntp5aRlgKZeqfvViOmhMYYh4o" alt="Abstract code" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-primary position-absolute top-0 end-0 m-2 fw-bold">D-3</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-primary text-dark badge-tag">Project</span>
                                    <span class="small text-secondary">#React #NextJS</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">Front-end Developer needed for App Challenge</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">We are looking for a passionate developer to join our team for the upcoming Global App Challenge. Experience with React is preferred.</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle bg-gradient text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #8b5cf6, #3b82f6); font-size: 11px;">K</div>
                                        <span class="text-secondary small">Kim Min-su</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>142</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>12</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBpa0e4s-wbmVcH4UwBbl-s5la9KUifbQaCi7xAWeQssKaHUthAuhHqwADTyTd5pYPFc2Pi04XgdbwZjydLkHFRRv7yIlH2gYisUfbqpm6QMgq5d7pdMo2ArkL6-tmgCCUT9GwPU7_nhBP9sBPBYO2EagjaH6aCbYxqEy9cfHHoPiRjgw3JBP7UojfN6H_2AoyFjwoPHWe4qMogTLfYz7GXwa0HTA1_CSTA-O7XhcDKZaqhJcaTc9YVUCXnErrvT53bS8VK-yv5AUwJ" alt="Team work" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-danger position-absolute top-0 end-0 m-2 fw-bold">Today</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-danger bg-opacity-75 text-white badge-tag">Competition</span>
                                    <span class="small text-secondary">#Design #UX/UI</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">UX/UI Designer for H-Star Contest</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">Need a designer who can handle Figma prototyping. Our team has 2 developers and 1 PM. Let's win together!</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #22c55e, #14b8a6); font-size: 11px;">L</div>
                                        <span class="text-secondary small">Lee Ji-won</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>89</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>24</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuAAGXs5aQfSuR_rNX2hz-BgvvaTyj-5ggNoS2ExQQeYKFGf5LADYuZcM1KMk5fgSEWq1wYQnf2uiskt1ABJZY1oX9yMMEaBW3EmNIU1dnKU0odNfwks5Gzdy4_grgpPb6lT1dZMO29tx9Ve2R_R2lCYaE00G17kqVqdTtwfwjjBadlrtKx9WHYXZ4eJ8zQvmBNa5cudAnrd0EHr6emtBhgtAnyO3UshIAw2nCizEhGvNKV7o6XPbw-c5HTCBpg4n6rk4MgBz_ts2uM7" alt="Friends" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-success position-absolute top-0 end-0 m-2 fw-bold">Open</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-success bg-opacity-75 text-white badge-tag">Study</span>
                                    <span class="small text-secondary">#Algorithm #Python</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">Algorithm Study Group (Beginner Friendly)</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">Starting from basics. We meet every Tuesday evening. Python preferred but any language welcome.</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #f97316, #ef4444); font-size: 11px;">P</div>
                                        <span class="text-secondary small">Park Jun</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>210</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>45</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDOjqpQjV3CCEAuDZyH5RFZ3S2iJ6ycU0Clm2NvTJPpPUDHQnYQuAy40uunqEdgY_BU34mliulskjTnGEsBrCu4TUIfv8q9FwMpWx6vu-JeRwqonZ65-rKxliFQZUoYxDGf6HDr0TaN0S5Z55Qa6tbDJiqTOPsb6Ui56c9CEWF5rCR9TXJJgPu4e-0Jy9FzjTUHTCyeixVbn1FhPlTWvGZvdFwOzy8y3nIiIZsJMAec4O273ONuJilrFRQmb1kH2QzbAk1wKjFi3AwA" alt="Campus" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-secondary position-absolute top-0 end-0 m-2 fw-bold">D-10</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-purple text-white badge-tag">Club</span>
                                    <span class="small text-secondary">#Music #Band</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">Keyboard player for 'Blue Sound'</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">We are looking for a keyboardist to perform at the upcoming festival. Must be available for weekly practice.</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #6366f1, #8b5cf6); font-size: 11px;">C</div>
                                        <span class="text-secondary small">Choi Soo</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>56</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCUwXApwoiImvXEf2v2vavot049odNjJdE687XkmSW1isHz2PWjbBHuNH7qqpPOuTT0azVTzgsX6oCJMqoHIc2G_oE9bbLJwcFzE19ixvT0Zc1KMtIz74OOtdt72ty_-m4-sGl2k5wkZ7afBbxsmssMEYQzFbUqN_51_aksSX-FCauaGT8ACnsNBBsKEyu1vlPlF-CjI1zuKdNBnZ90UA4ZTOSwppkz0Q1jvIRGSgNdCU4mExlXSD7rJm1F-fSA-dN4qryt0Yi7DIDZ" alt="Discussion" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-primary position-absolute top-0 end-0 m-2 fw-bold">D-7</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-primary text-dark badge-tag">Project</span>
                                    <span class="small text-secondary">#Startup #Business</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">Co-founder for Edu-Tech Startup</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">Looking for a business-minded co-founder. I have the MVP ready. Let's validate the market together.</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #60a5fa, #2dd4bf); font-size: 11px;">H</div>
                                        <span class="text-secondary small">Han Dong</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>320</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>67</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6 -->
                    <div class="col-12 col-md-6 col-xl-4">
                        <div class="card-post rounded-3 h-100 overflow-hidden">
                            <div class="position-relative" style="height: 180px;">
                                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCUhbnmJjTBxow0tuOzmQwEmK5xeXQdnUJCYUrKHxkJ8l6bgj4SuJ0gLOeYZhJXYCE696l2QUwb8uJlsMmRLbXD9QFp5Hm4gSzXgFgkBHCx2dxXNKRMCuRtTbpvAyx-oJwvdDWKO6-26Tncmj2XziRJLUyU0mNHk3t7KbTZCS4tzAWh6T2eay6-5QweLHISH6qRwTrCbYN23OJ7YRuM8SeZTtYj9aHQQ_KKes9CGexLvX9EPmvwhrSx0KLIFbD6IArYdulMGpz1g_tY" alt="Office" class="w-100 h-100" style="object-fit: cover;">
                                <span class="badge text-bg-secondary position-absolute top-0 end-0 m-2 fw-bold">D-14</span>
                            </div>
                            <div class="p-3 d-flex flex-column h-100">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-warning text-dark badge-tag">External</span>
                                    <span class="small text-secondary">#Marketing #Intern</span>
                                </div>
                                <h5 class="fw-bold text-white mb-2">Global Marketing Internship Prep</h5>
                                <p class="text-secondary small mb-3 flex-grow-1">Preparing for summer internships at global tech companies. Resume review and mock interviews.</p>
                                <div class="d-flex align-items-center justify-content-between border-top border-dark pt-2">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background: linear-gradient(135deg, #fbbf24, #d97706); font-size: 11px;">J</div>
                                        <span class="text-secondary small">Jung Min</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-secondary small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>95</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>15</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
