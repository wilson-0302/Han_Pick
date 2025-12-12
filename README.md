# 📌 Handong Pick – Backend

> 한동대학교 통합 모집·정보 플랫폼 백엔드 API  
> 프로젝트 기획서 기반 개발용 README 문서

---

## 📖 프로젝트 소개
Handong Pick(한동픽)은 한동대학교 내 다양한 **구인 활동(설문, 촬영, 근로, 팀프로젝트 등)** 과  
**공모전·대외활동 정보**를 한 곳에 모아 제공하는 **통합 정보 플랫폼**입니다.

현재 오픈채팅방, SNS, 히즈넷 등 여러 곳에 흩어진 정보 문제를 해결하고  
학생들의 **참여, 협업, 연결**을 자연스럽게 촉진하는 로컬 맞춤형 플랫폼을 목표로 합니다.

---

## 👥 팀 구성

| 이름 | 역할 |
|------|------|
| **김원겸** | 컨트롤러 & API 설계·구현, 서비스 로직 개발 |
| **박준형** | DB 설계, 인증/인가, 예외처리, 배포 환경 설정 |

---

## 🌐 링크

| 항목 | 주소 |
|------|------|
| GitHub Repository | https://github.com/wilson-0302/Handong_Pick.git |
| API 서버 배포 URL | _(예정)_ |
| 벤치마킹 서비스 | https://www.campuspick.com/ |

---

## 🛠 기술 스택

### Backend
- Spring Boot
- Spring Framework
- Spring Security + JWT
- JPA / Hibernate
- MariaDB

### Tools & Collaboration
- GitHub (Issues / Projects)
- IntelliJ IDEA
- Zoom

---

## 🚀 주요 기능

### 1. 사용자 기능
- 회원가입 / 로그인
- JWT 기반 인증
- 사용자 정보 조회

### 2. 게시글 CRUD
- 모집 / 공모전 / 대외활동 / 팀플 등 각종 게시글 작성
- 게시글 단일 조회
- 게시글 수정 및 삭제(작성자만 가능)
- 이미지(썸네일/포스터) 업로드 기능

### 3. 검색·필터·정렬 기능
- 제목/내용 키워드 검색
- 카테고리별 필터링
- 최신순 / 인기순 / 마감 임박순 정렬

### 4. 관리자 기능
- 공모전, 활동 정보 등록 및 관리
- 향후 자동 API 연동 예정

---

## 🗂 데이터베이스 구조

### **회원 테이블**

| 필드명 | 타입 | 제약조건 |
|--------|--------|-----------|
| id | int | PK, AI |
| memberID | string | UNIQUE, NOT NULL |
| password | string | NOT NULL |
| email | string | UNIQUE, NOT NULL |
| created_at | datetime | DEFAULT now() |

---

### **게시글 테이블**

| 필드명 | 타입 | 제약조건 |
|--------|--------|-----------|
| id | int | PK, AI |
| title | string | NOT NULL |
| content | string | NOT NULL |
| category | string | NOT NULL |
| recruit_count | int | NOT NULL |
| deadline | date | NULL |
| created_at | datetime | DEFAULT now() |
| updated_at | datetime | ON UPDATE now() |

---

## 📡 API 명세 요약

| Method | URL | 설명 |
|--------|------|--------|
| POST | `/auth/signup` | 회원가입 |
| POST | `/auth/login` | 로그인 |
| GET | `/auth/me` | 내 정보 조회 |
| GET | `/posts` | 게시글 목록 조회(검색/필터 포함) |
| POST | `/posts/write` | 게시글 생성 |
| GET | `/posts/{id}` | 단일 게시글 조회 |
| PUT | `/posts/{id}` | 게시글 수정 |
| DELETE | `/posts/{id}` | 게시글 삭제 |

---

## 🏗 시스템 아키텍처

프로젝트는 **3-Layered Architecture** 기반으로 구성됨.


- **Controller**: 요청 처리 및 응답 반환
- **Service**: 비즈니스 로직
- **Repository**: JPA 기반 DB 접근

---

## 📅 프로젝트 일정 (3주)

| 주차 | 진행 내용 |
|------|-----------|
| **1주차** | 기획 / DB 설계 / CRUD API 구현 |
| **2주차** | 프론트 연동 / 인증 구조 완성 / 검색 기능 구현 / 발표 준비 |
| **3주차** | 테스트 / 배포 / 마무리 |

---

## 🔧 향후 개선 방향

### 1) 공모전·대외활동 자동 연동
공공데이터 API 등을 활용해 공모전 정보를 자동 수집·갱신.

### 2) 한동대학교 일자리센터와 연동
근로 장학생 / 인턴십 / 취업 프로그램 정보 자동 업데이트 목표.

### 3) 학교 통합 플랫폼으로 확장
- 학과별 공지
- 교내 행사
- 동아리 모집
- 스터디 / 팀플 매칭  
  → *한동대 생활 전반의 모든 정보를 통합하는 허브 제공*

### 4) UX 고도화
- 알림 기능
- 추천 알고리즘
- 모바일 최적화
- UI/UX 개선

---

## 🎯 팀 프로젝트의 성장 목표

- 협업 및 커뮤니케이션 능력 향상
- GitHub 기반 버전 관리 및 이슈 관리 능력 강화
- Spring, DB, 배포 등 실무 기술 실전 적용
- 클린 코드 및 유지보수 가능한 구조 설계
- 일정 관리 · 우선순위 설정 능력 강화

---



src/main/webapp/
├─ assets/                # css/js/img 등 정적 리소스
└─ WEB-INF/
   ├─ web.xml
   └─ views/
      ├─ layout/          # 공통 레이아웃
      │  └─ base.jsp      # <jsp:include>로 header/footer/nav 조립
      │  
      ├─ auth/            # 인증 관련 화면
      │  ├─ login.jsp
      │  ├─ signup.jsp
      │  └─ profile.jsp   # 내 정보 조회/수정
      ├─ posts/           # 모집/공모전/대외활동 화면
      │  ├─ list.jsp      # 검색/필터/정렬 포함 목록
      │  ├─ detail.jsp
      │  ├─ form.jsp      # 작성/수정 공용
      │  └─ manage.jsp    # 내가 쓴 글 관리
      ├─ admin/           # 관리자 등록/관리
      │  ├─ dashboard.jsp
      │  └─ contest-form.jsp
      │
      └─ error/           # 오류 페이지
        ├─ 404.jsp
        └─ 500.jsp
    



