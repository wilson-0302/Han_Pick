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
                    <li class="nav-item"><a class="nav-link" href="#">모집 공고</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">정보 공유</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">마이페이지</a></li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <button class="btn btn-outline-light btn-sm">로그아웃</button>
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
                                <h2 class="fw-bold mb-0">김한동</h2>
                                <span class="badge bg-primary bg-opacity-25 text-primary fw-bold">재학생</span>
                            </div>
                            <div class="text-secondary-custom">전산전자공학부 4학년 · 21900123</div>
                            <div class="d-flex gap-2 mt-3">
                                <div class="stat-box rounded-3 px-3 py-2 text-center">
                                    <div class="text-secondary-custom small">게시글</div>
                                    <div class="fw-bold text-primary fs-5">12</div>
                                </div>
                                <div class="stat-box rounded-3 px-3 py-2 text-center">
                                    <div class="text-secondary-custom small">스크랩</div>
                                    <div class="fw-bold text-primary fs-5">48</div>
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
                                <input type="text" class="form-control" value="김한동">
                            </div>
                            <div>
                                <label class="form-label text-secondary-custom small">이메일</label>
                                <input type="email" class="form-control text-secondary-custom" value="21900123@handong.edu" disabled>
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
                            <a href="#" class="text-primary small text-decoration-none fw-bold">전체보기</a>
                        </div>
                        <div class="d-flex flex-column gap-2 flex-grow-1">
                            <div class="d-flex flex-column flex-sm-row justify-content-between gap-3 p-3 rounded-3 bg-dark bg-opacity-25 border border-dark">
                                <div class="flex-grow-1">
                                    <div class="d-flex align-items-center gap-2 mb-1">
                                        <span class="badge bg-warning text-dark">모집 공고</span>
                                        <span class="text-secondary-custom small">2024.03.15</span>
                                    </div>
                                    <div class="fw-semibold">2024-1학기 창업팀 프론트엔드 개발자 모집합니다!</div>
                                    <div class="d-flex gap-3 text-secondary-custom small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>128</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>12</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <button class="btn btn-sm btn-dark text-secondary-custom border-dark"><span class="material-symbols-outlined">edit</span></button>
                                    <button class="btn btn-sm btn-dark text-danger border-dark"><span class="material-symbols-outlined">delete</span></button>
                                </div>
                            </div>
                            <div class="d-flex flex-column flex-sm-row justify-content-between gap-3 p-3 rounded-3 bg-dark bg-opacity-25 border border-dark">
                                <div class="flex-grow-1">
                                    <div class="d-flex align-items-center gap-2 mb-1">
                                        <span class="badge bg-primary text-dark">정보 공유</span>
                                        <span class="text-secondary-custom small">2024.03.10</span>
                                    </div>
                                    <div class="fw-semibold">C언어 기초 학습 자료 공유합니다 (중간고사 대비)</div>
                                    <div class="d-flex gap-3 text-secondary-custom small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>450</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>56</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <button class="btn btn-sm btn-dark text-secondary-custom border-dark"><span class="material-symbols-outlined">edit</span></button>
                                    <button class="btn btn-sm btn-dark text-danger border-dark"><span class="material-symbols-outlined">delete</span></button>
                                </div>
                            </div>
                            <div class="d-flex flex-column flex-sm-row justify-content-between gap-3 p-3 rounded-3 bg-dark bg-opacity-25 border border-dark">
                                <div class="flex-grow-1">
                                    <div class="d-flex align-items-center gap-2 mb-1">
                                        <span class="badge bg-info text-dark">커뮤니티</span>
                                        <span class="text-secondary-custom small">2024.03.01</span>
                                    </div>
                                    <div class="fw-semibold">학식 메뉴 추천 좀 해주세요... 오늘 뭐 먹지</div>
                                    <div class="d-flex gap-3 text-secondary-custom small">
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">visibility</span>89</span>
                                        <span class="d-flex align-items-center gap-1"><span class="material-symbols-outlined" style="font-size:16px;">favorite</span>3</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <button class="btn btn-sm btn-dark text-secondary-custom border-dark"><span class="material-symbols-outlined">edit</span></button>
                                    <button class="btn btn-sm btn-dark text-danger border-dark"><span class="material-symbols-outlined">delete</span></button>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mt-3">
                            <nav class="d-flex gap-2">
                                <button class="btn btn-sm btn-dark text-secondary-custom border-dark"><span class="material-symbols-outlined" style="font-size:16px;">chevron_left</span></button>
                                <button class="btn btn-sm btn-primary text-dark fw-bold">1</button>
                                <button class="btn btn-sm btn-dark text-secondary-custom border-dark">2</button>
                                <button class="btn btn-sm btn-dark text-secondary-custom border-dark">3</button>
                                <button class="btn btn-sm btn-dark text-secondary-custom border-dark"><span class="material-symbols-outlined" style="font-size:16px;">chevron_right</span></button>
                            </nav>
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
