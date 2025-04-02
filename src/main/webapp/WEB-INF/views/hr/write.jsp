<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"/>
<link rel="stylesheet" href="/css/hr/write.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="mainContainer">
    <div class="mainHeader">
        <div class="title">
            <h2><span class="material-icons">supervisor_account</span>사원 등록</h2>
        </div>
    </div>
    <div class="mainBody">
        <form action="/hr/insert" method="post" enctype="multipart/form-data" id="form">
            <div class="content">
                <div class="hrProfile">
                    <label for="profileInput">
                        <img id="profilePreview" src="/image/defaultImg.jpg" alt="프로필 이미지">
                        <span class="material-icons">add_a_photo</span>
                    </label>
                    <input type="file" id="profileInput" name="profileImg" accept="image/*" style="display: none;">
                </div>
                <div class="name">이름 : <input type="text" name="name"></div>
                <div class="ssn">생년월일 :
                    <input type="date" name="birthday">
                </div>
                <div class="id">아이디 : <input type="text" name="loginId" placeholder="8~20자 이내 영어소문자,숫자를 포함한 ID 입력">
                    <button type="button" id="idCheckBtn">중복 체크</button>
                </div>
                <div id="result"></div>
                <div class="pw">패스워드 입력 : <input type="password" name="password" placeholder="8자 이상의 영어소문자,숫자를 포함한 PW 입력">
                </div>
                <div class="repw">패스워드 확인 : <input type="password" placeholder="위와 동일하게 패스워드 입력"></div>
                <div class="position">직급 :
                    <select name="jobId">
                        <option value="4">사원</option>
                        <option value="3">팀장</option>
                        <option value="5">사장</option>
                    </select>
                </div>
                <div class="department">부서 :
                    <select name="departmentId">
                        <option value="1">개발팀</option>
                        <option value="2">인사팀</option>
                        <option value="3">운영팀</option>
                        <option value="4">경영팀</option>
                        <option value="5">총무팀</option>
                    </select>
                </div>
                <div class="email">이메일 : <input type="text" name="email"></div>
                <!--<div class="contact">연락처 : <input type="text" name="contact"></div> -->
                <div class="postCode">우편번호 : <input type="text" name="postCode" id="postcode">
                    <button type="button" class="postBtn" id="postBtn">우편번호 검색</button>
                </div>
                <div class="address1">주소 : <input type="text" name="address"></div>
                <div class="address2">상세주소 : <input type="text" name="detailAddress"></div>
            </div>
            <div class="btn">
                <button id="insertBtn">입력완료</button>
                <button type="button" id="backBtn">돌아가기</button>
            </div>
        </form>
    </div>
</div>
<script>

    $('#form').on('submit', function(e) {
       // e.preventDefault();
        let formData1 = new FormData(document.getElementById("form"));

        formData1.forEach((value, key) => {
            console.log(key + ':', value);
        });
    })
</script>
<!--<script src="/js/hr/write.js" type="text/javascript"></script>-->
<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
