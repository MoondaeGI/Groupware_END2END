<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/template/header.jsp" />
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'ko',
            headerToolbar: {
                left: 'title',
                right: 'prev,next',
            },
            initialView: 'dayGridMonth',
            height: 'auto',
            aspectRatio: 1.2,
            dayCellDidMount: function(info) {
                // 각 날짜 셀이 마운트될 때 스타일 적용
                info.el.style.aspectRatio = '1';
                info.el.style.height = 'auto';
            },
            dayMaxEvents: 1, // 이벤트 수 제한
            fixedWeekCount: false
        });
        calendar.render();
    });

    calendar.setOption('height', calendar.getEl().offsetWidth * 0.8); // 너비의 80% 높이로 설정

    // 창 크기 변경 시 자동 조절
    window.addEventListener('resize', function() {
        calendar.setOption('height', calendar.getEl().offsetWidth * 0.8);
    });
</script>
<style>
    .boxContents {
        display: grid;
        grid-template-columns: 2.5fr 10fr 2.5fr; /* 3:5:2 비율 설정 */
        max-width: 2100px; /* 최대 너비 설정 */
        margin: 50px auto 0;
        gap: 20px;
        padding: 35px;
    }
    /* 좌측 영역 */
    .leftContents {
        display: grid;
        grid-template-rows: repeat(24, 1fr);
        gap: 20px;
    }

    /* commuteBox 수정 - grid-row 값을 4에서 3으로 변경 */
    .commuteBox {
        grid-row: span 3;  /* 4에서 3으로 변경하여 높이 25% 감소 */
        background: white;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    /* 중앙 영역 */
    .centerContents {
        display: grid;
        grid-template-rows: repeat(24, 1fr);
        gap: 20px;
    }

    .boardBox {
        grid-row: span 8;
        background-color: white;
        border-radius: 10px;
    }

    .approvalBox {
        grid-row: span 4;
        background-color: white;
        border-radius: 10px;
    }
    /* 우측 영역 */
    .rightContents {
        display: grid;
        grid-template-rows: repeat(24, 1fr);
        gap: 20px;
    }

    .btnBox {
        grid-row: span 2;
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        gap: 10px;
        padding: 0;
    }

    .btnBox button {
        width: 100%;
        height: 100%;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 6px;
        background: white;
        color: navy;
        font-size: 25px;
        font-weight: 600;
        padding: 30px 20px; /* 패딩 증가로 버튼 크기 키움 */
        word-break: keep-all;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        margin: 0;
        transition: all 0.2s ease-in-out;
        line-height: 1.2; /* 줄 간격 조정 */
    }

    .btnBox button:hover {
        background: #003465;
        color: white;
        transform: translateY(-1px);
    }

    /* imgBox 수정 */
    .imgBox {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        overflow: hidden;
        margin-bottom: 20px;
        background-image: url("/image/defaultImg.jpg");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        border: 1px solid #eee; /* 테두리 추가 */
    }

    /* logbox 수정 */
    .logbox {
        grid-row: span 5;
        background-color: white;
        border-radius: 10px;
        padding: 10px; /* 상하좌우 패딩 축소 */
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    /* information 수정 */
    .information {
        width: 90%;
        height: 98px;
        display: flex;
        flex-direction: column;
        gap: 12px;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 8px;
        box-sizing: border-box; /* padding이 width에 포함되도록 설정 */
    }

    .info-item {
        display: flex;
        align-items: center;
        font-size: 14px;
        justify-content: center;
        font-wieght: 600;
    }

    /* 이름 스타일 */
    .info-item.name {
        font-size: 20px;
        font-weight: 600;
        color: #333;
    }

    /* 부서 스타일 */
    .info-item.department {
        font-size: 14px;
        color: #666;
    }

    .info-summary {
        margin-top: 10px;
        padding-top: 10px;
        border-top: 1px solid #eee;
        width: 100%; /* information 전체 너비만큼 확장 */
        box-sizing: border-box; /* padding이 width에 포함되도록 설정 */
    }

    .summary-item {
        display: flex;
        align-items: center;
        justify-content: space-between; /* 양끝 정렬 */
        padding: 5px 0;
        font-size: 18px;
        color: #666;
        margin-left: 20px;
        margin-right: 20px;
    }

    .summary-item .material-icons {
        font-size: 18px;
        color: #003465;
    }

    .summary-left {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .summary-count {
        color: #003465; /* 배경 제거하고 텍스트 색상만 변경 */
        font-weight: 600;
        font-size: 18px;
    }

    .boxTitle {
        padding: 15px;
        font-size: 20px;
        font-weight: 600;
        border-bottom: 1px solid #eee;
    }

    .currentDate {
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 10px;
        color: #666;
    }

    .currentTime {
        font-size: 35px;
        font-weight: 600;
        color: #333;
    }

    .commuteButtons {
        display: flex;
        justify-content: center; /* 가운데 정렬 추가 */
        gap: 10px;
        padding: 10px;
    }

    /* 출퇴근 버튼 스타일 수정 */
    .commuteButtons button {
        width: 120px; /* 버튼 너비 고정 */
        padding: 12px;
        font-size: 18px;
        font-weight: 500;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 6px;
        background: white;
        color: navy;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }

    .commuteButtons button:hover {
        background: #003465;
        color: white;
        transform: translateY(-1px);
    }

    /* timeDisplay 여백 조정 */
    .timeDisplay {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 10px;  /* 패딩 살짝 줄임 */
    }

    .startWork {
        background-color: #4CAF50;
        color: white;
    }

    .endWork {
        background-color: #f44336;
        color: white;
    }

    .commuteButtons button:hover {
        opacity: 0.9;
        transform: translateY(-2px);
    }

    .commuteButtons button:active {
        transform: translateY(0);
    }

    .calendarBox {
        grid-row: span 7; /* 기존 값에서 5로 조정 */
        background-color: white;
        border-radius: 10px;
    }

    #calendar {
        max-height: 100px; /* 최대 높이 제한 */
        padding: 10px;
    }

    /* FullCalendar 내부 요소들 크기 조절 */
    .fc {
        font-size: 0.9em; /* 전체 폰트 크기 조절 */
    }

    .fc .fc-toolbar {
        padding: 0.5rem; /* 툴바 패딩 조절 */
    }

    .fc .fc-toolbar-title {
        font-size: 1.2em; /* 달력 제목 크기 */
    }

    .fc .fc-button {
        padding: 0.3em 0.6em;
        font-size: 0.8em;
    }
    .fc .fc-day-header {
        padding: 0.3em 0; /* 요일 헤더 높이 조절 */
    }

    .fc .fc-daygrid-day {
        min-height: 50px; /* 날짜 칸 최소 높이 */
    }

    .fc .fc-daygrid-day {
        aspect-ratio: 1; /* 1:1 비율 설정 */
        height: auto !important;
    }

    .fc-daygrid-day-frame {
        height: 100% !important;
        min-height: unset !important; /* 기본 최소 높이 제거 */
    }

    /* 날짜 숫자 크기 조절 */
    .fc .fc-daygrid-day-number {
        font-size: 0.9em;
        padding: 4px;
    }

    .fc .fc-toolbar-title {
        font-size: 1em;
    }


    .material-icons {
        font-size: 20px;
    }

    .btn-text {
        font-size: 14px;
    }

    /* 게시판 컨테이너 스타일 */
    .board-container {
        padding: 20px;
    }

    /* 게시판 타입 버튼 스타일 */
    .board-type-buttons {
        display: flex;
        gap: 0;
        margin-bottom: 20px;
        border-bottom: 2px solid #eee; /* 하단 경계선 추가 */
    }

    .board-type-btn {
        padding: 15px 30px; /* 패딩 증가로 버튼 크기 증가 */
        border: none;
        border-top: 2px solid #eee; /* 기본 하단 경계선 */
        border-radius: 0; /* 모서리 둥글기 제거 */
        background: none;
        cursor: pointer;
        font-size: 15px;
        color: #666;
        position: relative;
        transition: all 0.2s;
        min-width: 120px; /* 최소 너비 설정 */
        text-align: center;
    }

    /* hover 효과 - active와 동일한 스타일 적용 */
    .board-type-btn:hover {
        background: white;
        color: #003465;
        font-weight: 600;
        border-top: 2px solid #003465;
        border-bottom: 2px solid white;
        margin-bottom: -2px;
    }

    /* active 상태 */
    .board-type-btn.active {
        background: white;
        color: #003465;
        font-weight: 600;
        border-top: 2px solid #003465;
        margin-bottom: -2px;
    }

    /* category-list-container 스타일 */
    .category-list-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 1px solid #eee;
    }

    /* 카테고리 목록 스타일 */
    .category-list {
        display: flex;
        gap: 8px;
        overflow-x: auto;
        white-space: nowrap;
    }

    .category-btn {
        padding: 6px 16px;
        border: none; /* 테두리 제거 */
        background: none; /* 배경 제거 */
        cursor: pointer;
        font-size: 13px;
        color: #666; /* 기본 글자색 */
        transition: all 0.2s;
    }

    .category-btn.active {
        background: none; /* 활성화 상태에서도 배경 없음 */
        color: #003465; /* 활성화 상태일 때 글자색 변경 */
        font-weight: 600; /* 활성화 상태일 때 글자 굵기 증가 */
    }

    .category-btn:hover {
        background: none;
        color: #003465;
    }

    /* 더보기 버튼 스타일 */
    .more-btn {
        font-size: 14px;
        color: #666;
        text-decoration: none;
        display: flex;
        align-items: center;
        padding: 6px 12px;
        transition: all 0.2s;
    }

    .more-btn:hover {
        color: #003465;
    }

    /* 게시판 테이블 스타일 */
    .board-table-container {
        overflow-x: auto;
    }

    .board-table {
        width: 100%;
        border-collapse: collapse;
    }

    .board-table th {
        background: #f8f9fa;
        padding: 12px;
        font-weight: 600;
        text-align: center;
        border-top: 2px solid #003465;
        border-bottom: 1px solid #ddd;
    }

    .board-table td {
        padding: 12px;
        border-bottom: 1px solid #eee;
        text-align: center;
        vertical-align: middle;
    }

    .board-table td.title {
        text-align: left;
        cursor: pointer;
    }

    .board-table td.title:hover {
        text-decoration: underline;
        color: #003465;
    }

    /* 테이블 행 호버 효과 */
    .board-table tbody tr:hover {
        background-color: #f8f9fa;
    }

    /* 기존 스타일에 추가 */
    .writer-info {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .profile-img {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        border: 1px solid #eee;
    }

    .birthBox {
        grid-row: span 6;
        background-color: white;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        height: 100%; /* 그리드 셀의 전체 높이 사용 */
    }

    .birth-list {
        padding: 20px;
        overflow-y: auto;
        height: calc(100% - 53px); /* boxTitle 높이를 뺀 나머지 전체 */
        min-height: 0; /* 스크롤 동작을 위해 필요 */
    }

    .birth-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0;
        border-bottom: 1px solid #eee;
    }

    .birth-item:last-child {
        border-bottom: none;
    }

    .birth-profile {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .birth-profile .profile-img {
        width: 40px;
        height: 40px;
    }

    .birth-info {
        display: flex;
        flex-direction: column;
        gap: 4px;
    }

    .birth-name {
        font-size: 15px;
        font-weight: 600;
        color: #333;
    }

    .birth-dept {
        font-size: 13px;
        color: #666;
    }

    .birth-date {
        font-size: 14px;
        color: #003465;
        font-weight: 500;
    }

    /* 반응형을 위한 미디어 쿼리 추가 */
    @media screen and (max-width: 2140px) { /* 1700px + 좌우 패딩 고려 */
        .boxContents {
            padding: 20px;
        }
    }

    @media screen and (max-width: 1024px) {
        .leftContents,
        .rightContents {
            width: 250px;
        }
    }

    @media screen and (max-width: 768px) {
        .leftContents,
        .rightContents {
            width: 200px;
        }
    }
</style>

    <div class="leftContents">
        <div class="logbox">
            <div class="imgBox" style="background-image: url(${employee.profileImg})"></div>
            <div class="information">
                <div class="info-item name">
                    ${employee.name} ${employee.jobName}
                </div>
                <div class="info-item department">
                    ${employee.departmentName}
                </div>
            </div>
            <div class="info-summary">
                <div class="summary-item">
                    <div class="summary-left">
                        <span class="material-icons">mail</span>
                        <span class="summary-text">새 메일</span>
                    </div>
                    <span class="summary-count">5</span>
                </div>
                <div class="summary-item">
                    <div class="summary-left">
                        <span class="material-icons">event</span>
                        <span class="summary-text">오늘 일정</span>
                    </div>
                    <span class="summary-count">3</span>
                </div>
            </div>
        </div>
        <div class="commuteBox">
            <div class="boxTitle">출퇴근 관리</div>
            <div class="timeDisplay">
                <div class="currentDate"></div>
                <div class="currentTime"></div>
            </div>
            <div class="commuteButtons">
                <button class="startWork">출근하기</button>
                <button class="endWork">퇴근하기</button>
            </div>
        </div>
        <div class="calendarBox">
            <div class="boxTitle">일정</div>
            <div id="calendar"></div>
        </div>
    </div>

    <div class="centerContents">

        <div class="boardBox">
            <div class="boxTitle">게시글 목록</div>
            <div class="board-container">
                <!-- 게시판 타입 버튼 -->
                <div class="board-type-buttons">
                    <button class="board-type-btn active">공지 게시판</button>
                    <button class="board-type-btn">전사 게시판</button>
                    <button class="board-type-btn">그룹 게시판</button>
                </div>

                <div class="category-list-container">
                    <div class="category-list">
                        <button class="category-btn active">전체</button>
                        <button class="category-btn">인사</button>
                        <button class="category-btn">회계</button>
                        <button class="category-btn">영업</button>
                        <button class="category-btn">마케팅</button>
                        <button class="category-btn">개발</button>
                        <button class="category-btn">기타</button>
                    </div>

                    <a href="/board/list" class="more-btn">
                        더보기 <span class="material-icons" style="font-size: 16px; vertical-align: middle;">chevron_right</span>
                    </a>
                </div>

                <!-- 게시글 테이블 -->
                <div class="board-table-container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th width="8%">번호</th>
                            <th width="52%">제목</th>
                            <th width="20%">글쓴이</th>
                            <th width="20%">등록일자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach begin="1" end="8" var="i">
                            <tr>
                                <td>${11 - i}</td> <!-- 10부터 1까지 역순으로 표시 -->
                                <td class="title">샘플 게시글 제목입니다 ${11 - i}</td>
                                <td class="writer-info">
                                    <div class="profile-img" style="background-image: url('https://picsum.photos/seed/${i}/200')"></div>
                                    <span>작성자${i}</span>
                                </td>
                                <td>2024-03-19</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="approvalBox">
            <div class="boxTitle">나의 결재 대기 문서함</div>
            <div class="board-container">
                <div class="board-table-container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th width="10%">기안 번호</th>
                            <th width="50%">제목</th>
                            <th width="20%">기안자</th>
                            <th width="20%">등록 일자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach begin="1" end="4" var="i">
                            <tr>
                                <td>문서-${5 - i}</td>
                                <td class="title">결재 문서 제목입니다 ${5 - i}</td>
                                <td class="writer-info">
                                    <div class="profile-img" style="background-image: url('https://picsum.photos/seed/${i}/200')"></div>
                                    <span>기안자${i}</span>
                                </td>
                                <td>2024-03-19</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="rightContents">
        <div class="btnBox">
            <button type="button">
                <span class="material-icons">article</span>
                <span class="btn-text">게시글 작성</span>
            </button>
            <button type="button">
                <span class="material-icons">mail</span>
                <span class="btn-text">메일 작성</span>
            </button>
            <button type="button">
                <span class="material-icons">edit_note</span>
                <span class="btn-text">결재 작성</span>
            </button>
            <button type="button">
                <span class="material-icons">work</span>
                <span class="btn-text">보고서 작성</span>
            </button>
        </div>

        <div class="birthBox">
            <div class="boxTitle">이달의 생일</div>
            <div class="birth-list">
                <c:forEach begin="1" end="3" var="i">
                    <div class="birth-item">
                        <div class="birth-profile">
                            <div class="profile-img" style="background-image: url('https://picsum.photos/seed/${i}/200')"></div>
                            <div class="birth-info">
                                <div class="birth-name">홍길동${i}</div>
                                <div class="birth-dept">개발팀</div>
                            </div>
                        </div>
                        <div class="birth-date">3월 ${i+20}일</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function() {
        // 날짜와 시간 표시 함수
        function updateDateTime() {
            const now = new Date();

            // 날짜 포맷팅
            const dateOptions = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                weekday: 'long'
            };
            const dateStr = now.toLocaleDateString('ko-KR', dateOptions);

            // 시간 포맷팅
            const timeOptions = {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false
            };
            const timeStr = now.toLocaleTimeString('ko-KR', timeOptions);

            // jQuery로 HTML 업데이트
            $('.currentDate').text(dateStr);
            $('.currentTime').text(timeStr);
        }

        // 초기 실행
        updateDateTime();

        // 1초마다 업데이트
        setInterval(updateDateTime, 1000);

        // 출퇴근 버튼 클릭 이벤트 (필요한 경우)
        $('.startWork').click(function() {
            // 출근 버튼 클릭 시 동작
            console.log('출근');
        });

        $('.endWork').click(function() {
            // 퇴근 버튼 클릭 시 동작
            console.log('퇴근');
        });

        $('.board-type-btn').click(function() {
            // 모든 버튼에서 active 클래스 제거
            $('.board-type-btn').removeClass('active');
            // 클릭된 버튼에만 active 클래스 추가
            $(this).addClass('active');
        });

        $('.category-btn').click(function() {
            // 모든 버튼에서 active 클래스 제거
            $('.category-btn').removeClass('active');
            // 클릭된 버튼에만 active 클래스 추가
            $(this).addClass('active');
        });
    });
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp" />