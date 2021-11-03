<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Edit my profile</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <!-- 제가 적용하는 style 및 sript 부분 -->
        <script src="/jquery-3.2.1.min.js"></script>
<style>

</style>

<script>

$(document).ready(function(){
	$("#btnLogin").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();//입력포커스 이동
			return;//함수종료
		}
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();//입력포커스 이동
			return;//함수종료
		}
		//폼 내부의 데이터를 전송할 주소
		//document.login.action="main2"
		//제출
		document.login.submit();
	});
});

//-----------------------------------------------
//비밀번호 확인
function checkValue()
{  
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.updateform.pw.value != document.updateform.pwchk.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}

//회원탈퇴
function deleteMember(){
	var id=$("#id").val();
	var result = false;
	result = confirm("Do you really want to delete your account?");
	if(result){
		$.ajax({
			url:'/deletemember',
			type:'post',
			data:{'id': id},
			
			//dataType:'json',
			success: function(msg){
				alert("success 수정");
			},//success
			error:function(e){alert("error")},
			//complete:function(){alert("완료 ")}
		});
		location.href = "main";	
	}else{
		location.href = "pwCheck";
	}
};
//출처: https://all-record.tistory.com/115 [세상의 모든 기록]

//회원가입 기능 끝 
</script>
    </head>
    <!-- 상단 bar -->
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main2">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>
              
                    </ul>
                </div>
            </div>
        </nav>  
     
        <!-- Update form-->
        <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">Edit My Profile</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">Hello, ${sessionScope.nickname }!</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                    <!-- ---------------------------------------------------------------- -->
                    <!-- 회원가입 다시!!!만들기 -->
                    <form action="updatemember" method="post" name="updateform" onsubmit="return checkValue()">
                            <!-- id input-->
                            <input id="id" type="hidden" name="id" value="${sessionScope.id }">
                            
                            <!-- PW input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" name="pw" id="pw" type="password" maxlength="10" placeholder="10 digit..." required="required" value="${sessionScope.pw }"/>
                                <label for="pw">Password</label>
                                <div class="invalid-feedback">Password is required.</div>
                            </div>
                            
                            <!-- pw 확인 -->
                             <div class="form-floating mb-3">
                                <input class="form-control" name="pwchk" id="pwchk" type="password" maxlength="10" placeholder="10 digit..." required="required" value="${sessionScope.pw }"/>
                                <label for="pwchk">Password Check</label>
                                <div class="invalid-feedback">Password is required.</div>
                            </div>
                            
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name..." required="required" value="${sessionScope.name }"/>
                                <label for="name">Full name</label>
                                <div class="invalid-feedback">A name is required.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com" required="required" value="${sessionScope.email }"/>
                                <label for="email">Email address</label>
                                <div class="invalid-feedback">An email is required.</div>
                                <div class="invalid-feedback">Email is not valid.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" name="phone_number" id="phone_number" type="tel" placeholder="(123) 456-7890" required="required" value="${sessionScope.phone_number }"/>
                                <label for="phone_number">Phone number</label>
                                <div class="invalid-feedback">A phone number is required.</div>
                            </div>
                
                            <!-- NickName input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" name="nickname" id="nickname" type="text" placeholder="Enter your nickname..." maxlength="8" required="required" value="${sessionScope.nickname }"/>
                                <label for="nickname">Nickname</label>
                                <div class="invalid-feedback">A nickname is required.</div>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    <br />
                                    <!--  <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>-->
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="submit"></div>
                            <br>
                        </form>
                            <div class="d-grid"><button class="btn btn-primary btn-xl" id="submitButton" onclick="deleteMember()">Delete My Account</button></div>
                    <!-- 회원가입 끝 -->
                    
            </div>
                    <div id ="space_little2"></div>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-4 text-center mb-5 mb-lg-0">
                        <i class="bi-phone fs-2 mb-3 text-muted"></i>
                        <div>+1 (555) 123-4567</div>
                    </div>
                </div>
        </section>
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Kulture</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="/sb-forms-latest.js"></script>
    </body>
</html>