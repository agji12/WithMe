<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary" id="mainNav">
	<div class="container-fluid px-4">
		<a class="navbar-brand" href="/">With Me</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/duo/toDuoSearch">듀오 찾기</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link"
						href="/member/toSignIn">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="#">내 정보</a></li>
					<li class="nav-item">
						<form action="/member/signOut" name="logout" method="post">
							<sec:csrfInput />
							<a class="nav-link" href="javascript:void(0);" 
								onclick="document.forms['logout'].submit();">로그아웃</a>
						</form>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('admin')">
					<li class="nav-item"><a class="nav-link" href="/admin/#">관리자
							페이지</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>

