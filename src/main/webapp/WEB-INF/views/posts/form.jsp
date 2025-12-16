<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hanpick - Create Post</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;900&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        :root {
            --color-primary: #2bbdee;
            --bg-dark: #101d22;
            --surface-dark: #1e2a30;
            --border-dark: #283539;
            --text-secondary: #9db2b9;
            --input-bg: #283539;
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
            background: rgba(16, 29, 34, 0.9);
            border-bottom: 1px solid var(--border-dark);
            backdrop-filter: blur(8px);
        }
        .nav-link { color: #fff !important; font-weight: 600; }
        .nav-link:hover, .nav-link.active { color: var(--color-primary) !important; }
        .card-dark {
            background: var(--surface-dark);
            border: 1px solid var(--border-dark);
        }
        .text-secondary-custom { color: var(--text-secondary); }
        .form-control, .form-select, textarea {
            background: var(--input-bg);
            border: 1px solid var(--border-dark);
            color: #fff;
        }
        .form-control:focus, .form-select:focus, textarea:focus {
            border-color: var(--color-primary);
            box-shadow: 0 0 0 0.2rem rgba(43, 189, 238, 0.15);
            background: var(--input-bg);
            color: #fff;
        }
        .chip {
            background: var(--input-bg);
            border: 1px solid transparent;
            color: #dce5ea;
            cursor: pointer;
        }
        .chip.active, .chip:hover {
            background: var(--color-primary);
            color: #0a1115;
            border-color: var(--color-primary);
        }
        .upload-box {
            border: 2px dashed var(--border-dark);
            background: rgba(40, 53, 57, 0.4);
        }
        .upload-box:hover {
            border-color: rgba(43, 189, 238, 0.6);
        }
        .footer {
            border-top: 1px solid var(--border-dark);
            background: #0f1a1f;
        }
    </style>
</head>
<body>
<div class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top px-3">
        <div class="container-lg">
            <div class="d-flex align-items-center gap-2 text-white fw-bold fs-5">
                <span class="material-symbols-outlined text-primary">hub</span>
                Hanpick
            </div>
            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navMenu">
                <ul class="navbar-nav gap-lg-4 align-items-center">
                    <li class="nav-item"><a class="nav-link text-secondary-custom" href="#">대시보드</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">모집 공고</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary-custom" href="#">내 활동</a></li>
                    <li class="nav-item">
                        <div class="rounded-circle overflow-hidden border border-dark" style="width: 36px; height: 36px;">
                            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuA3NjplSePiQZwEsN3jwNPN2nSrnDD5fTubKM6d9UyuTkaDy-I9jINnEmlLgBSPeLU3fgGnLg-gWt47Gra3Fcvo5LhL97bxi4SQ81P9ExDedTCG_W94SGi0IGPCoyQ6oHlhyFjnQj7CrzG0MQlv7pi5bnHaIQzUC2XQTOqe_B1lLJ6hEPW9u4e347zf7RRilxCIyiaKvVLN9GaZkVPp_7jawtwaRAZMi61rrLknfZbMB1DwCKse--qMbnAlztUz-O39t_-eeEVVFkv5" alt="Profile" class="w-100 h-100 object-fit-cover">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main -->
    <main class="flex-grow-1 py-4">
        <div class="container-lg">
            <div class="d-flex align-items-center gap-2 text-secondary-custom small mb-3" role="button">
                <span class="material-symbols-outlined">arrow_back</span>
                <span>이전 페이지로</span>
            </div>
            <div class="mb-3">
                <h1 class="fw-bold display-6 mb-2">새 게시글 작성</h1>
                <p class="text-secondary-custom mb-0">새로운 구인 활동이나 공모전 정보를 학우들과 공유하세요.</p>
            </div>

            <div class="row g-4">
                <!-- Left: form -->
                <div class="col-lg-8 d-flex flex-column gap-3">
                    <div class="card-dark rounded-4 p-4">
                        <label class="form-label fw-semibold text-white">제목 <span class="text-primary">*</span></label>
                        <input type="text" class="form-control form-control-lg" placeholder="모집 공고 제목을 입력하세요 (예: 2024-1학기 디자인 학회 신입 모집)">
                    </div>

                    <div class="card-dark rounded-4 p-4 d-flex flex-column gap-3">
                        <div>
                            <div class="fw-semibold mb-2">카테고리 <span class="text-primary">*</span></div>
                            <div class="d-flex flex-wrap gap-2">
                                <button type="button" class="btn chip active btn-sm px-3">동아리</button>
                                <button type="button" class="btn chip btn-sm px-3">공모전</button>
                                <button type="button" class="btn chip btn-sm px-3">대외활동</button>
                                <button type="button" class="btn chip btn-sm px-3">스터디</button>
                                <button type="button" class="btn chip btn-sm px-3">프로젝트</button>
                            </div>
                        </div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label small text-white">모집 인원</label>
                                <div class="position-relative">
                                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-secondary-custom">group</span>
                                    <input type="text" class="form-control ps-5" placeholder="0명 (인원 미정 시 비워두세요)">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small text-white">마감일</label>
                                <div class="position-relative">
                                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-secondary-custom">calendar_today</span>
                                    <input type="date" class="form-control ps-5">
                                </div>
                            </div>
                            <div class="col-12">
                                <label class="form-label small text-white">지원 링크 / 연락처</label>
                                <div class="position-relative">
                                    <span class="material-symbols-outlined position-absolute top-50 start-0 translate-middle-y ms-3 text-secondary-custom">link</span>
                                    <input type="text" class="form-control ps-5" placeholder="오픈채팅방 링크 또는 구글폼 URL">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-dark rounded-4">
                        <div class="border-bottom border-dark d-flex gap-2 p-2">
                            <button class="btn btn-dark border-0 text-secondary-custom"><span class="material-symbols-outlined">format_bold</span></button>
                            <button class="btn btn-dark border-0 text-secondary-custom"><span class="material-symbols-outlined">format_italic</span></button>
                            <button class="btn btn-dark border-0 text-secondary-custom"><span class="material-symbols-outlined">format_underlined</span></button>
                            <div class="vr mx-1" style="background:var(--border-dark); opacity:1;"></div>
                            <button class="btn btn-dark border-0 text-secondary-custom"><span class="material-symbols-outlined">format_list_bulleted</span></button>
                            <button class="btn btn-dark border-0 text-secondary-custom"><span class="material-symbols-outlined">link</span></button>
                        </div>
                        <textarea class="form-control border-0 rounded-0 bg-transparent" rows="10" placeholder="상세 내용을 작성해주세요.\n\n- 주요 활동 내용\n- 모집 기간 및 일정\n- 우대 사항 등"></textarea>
                    </div>
                </div>

                <!-- Right: sidebar -->
                <div class="col-lg-4 d-flex flex-column gap-3">
                    <div class="card-dark rounded-4 p-4 sticky-top" style="top: 96px;">
                        <div class="fw-semibold mb-3">대표 이미지 / 포스터</div>
                        <div class="upload-box rounded-4 d-flex flex-column align-items-center justify-content-center gap-3 py-4 text-center">
                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:48px; height:48px; background: var(--input-bg);">
                                <span class="material-symbols-outlined text-white">add_photo_alternate</span>
                            </div>
                            <div>
                                <div class="fw-semibold">Click to upload</div>
                                <div class="text-secondary-custom small">or drag and drop here</div>
                            </div>
                            <input type="file" accept="image/*" class="d-none">
                        </div>
                        <p class="small text-secondary-custom mt-3 mb-0">
                            * 10MB 이하의 이미지 파일(JPG, PNG)만 업로드 가능합니다.<br>
                            * 권장 사이즈: 1200 x 900px
                        </p>
                    </div>

                    <div class="d-flex flex-column gap-2 sticky-top" style="top: 360px;">
                        <button class="btn btn-primary fw-bold d-flex align-items-center justify-content-center gap-1 py-2 shadow">게시하기</button>
                        <div class="d-grid gap-2">
                            <button class="btn btn-dark text-white">미리보기</button>
                            <button class="btn btn-dark text-white">임시 저장</button>
                        </div>
                        <button class="btn btn-link text-secondary-custom text-decoration-none">취소하고 돌아가기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer py-3">
        <div class="container-lg text-center">
            <span class="text-secondary-custom small">© 2024 Hanpick. All rights reserved.</span>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
