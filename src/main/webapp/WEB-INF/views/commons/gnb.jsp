<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary" id="mainNav">
	<div class="container px-4">
		<a class="navbar-brand" href="/">With Me</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="#">듀오 찾기</a></li>
				<c:choose>
					<c:when test="${sessionScope.email == null}">
						<li class="nav-item"><a class="nav-link" href="/member/toSignIn">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="#">내 정보</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/signOut">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
	</div>
</nav>

