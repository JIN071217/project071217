<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
</head>
<body>
    <!-- 관리자 로그인 -->
<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header justify-content-center">
                <h3 class="modal-title">관리자</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form action="/admin/admin_ok" method="POST" role="form">
                    <div class="form-group">
                        <label for="">관리자 아이디</label>
                        <input type="text"name="admin_id" value="admin"  class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">관리자 비밀번호</label>
                        <input type="password" name="admin_pw" value="1234" class="form-control">
                    </div>
                    <div class="checkbox">
                        <input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked="">
                        <label for="checkbox-1" class="checkbox-custom-label form-check-label">아이디 저장</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">관리자 로그인</button>
                    <button type="button" class="btn btn-link btn-block">비밀번호를 잃어버리셨습니까?</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
	$(document).ready(function () {
		let msg = '${msg}';
		if (msg == 'failID') {
			alert("아이디를 확인하세요.");
		} else if (msg == 'failPW') {
			alert("비밀번호를 확인하세요.");
		}
	});

</script>
</body>
</html>