<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<h1>
	회원가입
</h1>
<form action="/save.do" method="POST">
	<p>
		<strong>아이디</strong>
		<input type="text" name="id" value="아이디 입력">
	</p>
	<p>
		<strong>비밀번호</strong>
		<input type="password" name="password" value="비밀번호 입력">
	</p>
	<p>
		<strong>이름</strong>
		<input type="text" name="name" value="이름 입력">
	</p>
	<p>
		<input type="submit" value="제출">
	</p>
</form>
</body>
</html>
