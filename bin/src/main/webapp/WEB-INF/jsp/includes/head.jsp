<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- start header -->
<head>
  <meta charset="utf-8">
  <title>studying</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />
  
  <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  <!-- default header name is X-CSRF-TOKEN -->
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
  
  <!-- css -->
  <link type="text/css" media="screen" href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" />
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/bootstrap-responsive.css" rel="stylesheet" />
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/flexslider.css" rel="stylesheet" />
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/prettyPhoto.css" rel="stylesheet" />
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/camera.css" rel="stylesheet" />
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/css/jquery.bxslider.css" rel="stylesheet" />
  <link type="text/css" media="screen"  href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link type="text/css" media="screen" href="${pageContext.request.contextPath }/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link type="text/css" media="screen" rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/ico/apple-touch-icon-144-precomposed.png" />
  <link type="text/css" media="screen" rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/ico/apple-touch-icon-114-precomposed.png" />
  <link type="text/css" media="screen" rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/ico/apple-touch-icon-72-precomposed.png" />
  <link type="text/css" media="screen" rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/ico/apple-touch-icon-57-precomposed.png" />
  <link type="text/css" media="screen" rel="shortcut icon" href="${pageContext.request.contextPath }/ico/favicon.png" />

  <!-- =======================================================
    Theme Name: Eterna
    Theme URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>