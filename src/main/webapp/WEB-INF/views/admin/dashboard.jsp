<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick Admin Dashboard</title>
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
            overflow: hidden;
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
        .progress.bg-dark { background: #1a262b !important; }
        .table-dark-custom thead { background: #1e292d; }
        .table-dark-custom tbody tr:hover { background: #344248; }
        .badge-soft-success { background: rgba(11, 218, 87, 0.1); color: #0bda57; }
        .badge-soft-warning { background: rgba(255, 159, 67, 0.12); color: #ff9f43; }
        .badge-soft-danger { background: rgba(250, 95, 56, 0.12); color: #fa5f38; }
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
                    <div class="small text-secondary-custom">Admin Console</div>
                </div>
            </div>
        </div>
        <nav class="nav flex-column gap-1 px-2">
            <a class="nav-link active d-flex align-items-center gap-2" href="#"><span class="material-symbols-outlined text-primary">dashboard</span>Dashboard</a>
            <a class="nav-link d-flex align-items-center gap-2" href="#"><span class="material-symbols-outlined">group</span>User Management</a>
            <a class="nav-link d-flex align-items-center gap-2" href="#"><span class="material-symbols-outlined">article</span>Post Management</a>
            <a class="nav-link d-flex align-items-center gap-2" href="#"><span class="material-symbols-outlined">event_note</span>Recruitment Info</a>
            <a class="nav-link d-flex align-items-center gap-2" href="#"><span class="material-symbols-outlined">settings</span>Settings</a>
        </nav>
        <div class="mt-auto border-top border-dark px-3 pt-3">
            <a class="d-flex align-items-center gap-2 text-secondary-custom text-decoration-none" href="#">
                <span class="material-symbols-outlined">help</span>Support
            </a>
        </div>
    </aside>

    <!-- Main -->
    <div class="flex-grow-1 d-flex flex-column overflow-hidden">
        <!-- Topbar -->
        <header class="topbar d-flex align-items-center justify-content-between px-3 px-md-4 py-3">
        <div class="d-flex align-items-center gap-3">
            <button class="btn btn-outline-light d-md-none border-0"><span class="material-symbols-outlined">menu</span></button>
            <h5 class="mb-0 d-none d-sm-block">Dashboard Overview</h5>
        </div>
            <div class="d-flex align-items-center gap-3 flex-grow-1 justify-content-end">
                <div class="d-none d-sm-flex align-items-center bg-dark rounded-3 px-3" style="min-width:240px; max-width:320px;">
                    <span class="material-symbols-outlined text-secondary-custom me-2">search</span>
                    <input type="text" class="form-control border-0 bg-transparent text-white p-0" placeholder="Search...">
                </div>
                <button class="btn btn-outline-light border-0 position-relative">
                    <span class="material-symbols-outlined">notifications</span>
                    <span class="position-absolute top-0 end-0 translate-middle p-1 bg-danger rounded-circle border border-dark"></span>
                </button>
                <div class="vr d-none d-sm-block" style="background:#283539;"></div>
                <div class="d-flex align-items-center gap-2">
                    <div class="rounded-circle overflow-hidden border border-dark" style="width:36px; height:36px;">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuA3efdimstuN1-WQ_oNsRysjlxUZ_4le1_20BJLbmODqC3JvmhUgDWdNBSu14cE2kOz7gIJZ8gXN0nR1WTh473XjdzdpoOqS9BtAb7TJCv4IbzKVcFkdGZwUKZmPyxCzPSyHRpnYQ1LwMtv606-byJejiMDKkXXwMYcXFRoJYL1_UIpSsFCVzl70bjfJPBArSlzlMEzgO_mP-CJj9ZgT7WZblUexC6ovc0vIkGWBUzoDJhx3gAgjIM4Zy6A9LaTyYY7sDzEbV3t-FN4" alt="Admin" class="w-100 h-100 object-fit-cover">
                    </div>
                    <div class="d-none d-md-flex flex-column">
                        <span class="fw-bold text-white">Admin</span>
                        <span class="small text-secondary-custom">Super User</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Content -->
        <div class="flex-grow-1 overflow-auto p-3 p-md-4">
            <div class="container-fluid" style="max-width: 1200px;">
                <!-- Management cards -->
                <div class="row g-3 mb-4">
                    <div class="col-12 col-lg-6">
                        <div class="card-dark rounded-4 p-4 h-100 d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h6 class="fw-bold mb-1 text-white d-flex align-items-center gap-2"><span class="material-symbols-outlined text-primary">article</span>게시글 관리</h6>
                                    <p class="mb-0 text-secondary-custom small">최근 게시글을 검토하고 승인/삭제할 수 있습니다.</p>
                                </div>
                                <button class="btn btn-primary btn-sm fw-bold text-dark">게시글 등록</button>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-dark table-borderless table-dark-custom align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th class="text-white">제목</th>
                                            <th class="text-white">작성자</th>
                                            <th class="text-white">상태</th>
                                            <th class="text-end text-white">액션</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-white">2024-1 창업 경진대회 팀원 모집</td>
                                            <td class="text-secondary-custom">김지훈</td>
                                            <td><span class="badge badge-soft-success">승인</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">edit</span></button>
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">delete</span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-white">디자인 스터디 신입 모집</td>
                                            <td class="text-secondary-custom">이민지</td>
                                            <td><span class="badge badge-soft-warning">검토중</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">check_circle</span></button>
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">delete</span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-white">개발자 구함 (React)</td>
                                            <td class="text-secondary-custom">박현우</td>
                                            <td><span class="badge badge-soft-success">승인</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">edit</span></button>
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">delete</span></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="card-dark rounded-4 p-4 h-100 d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h6 class="fw-bold mb-1 text-white d-flex align-items-center gap-2"><span class="material-symbols-outlined text-primary">group</span>사용자 관리</h6>
                                    <p class="mb-0 text-secondary-custom small">회원 상태 변경 및 권한 관리.</p>
                                </div>
                                <button class="btn btn-primary btn-sm fw-bold text-dark">사용자 초대</button>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-dark table-borderless table-dark-custom align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th class="text-white">이름</th>
                                            <th class="text-white">역할</th>
                                            <th class="text-white">상태</th>
                                            <th class="text-end text-white">액션</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-white">Admin 계정</td>
                                            <td class="text-secondary-custom">관리자</td>
                                            <td><span class="badge badge-soft-success">활성</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">edit</span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-white">김학생</td>
                                            <td class="text-secondary-custom">작성자</td>
                                            <td><span class="badge badge-soft-warning">일시중지</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">toggle_on</span></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-white">이학생</td>
                                            <td class="text-secondary-custom">사용자</td>
                                            <td><span class="badge badge-soft-success">활성</span></td>
                                            <td class="text-end">
                                                <button class="btn btn-sm btn-link text-secondary-custom text-decoration-none"><span class="material-symbols-outlined">toggle_off</span></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
