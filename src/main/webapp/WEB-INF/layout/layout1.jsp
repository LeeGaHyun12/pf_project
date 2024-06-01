<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<style>
    div.mainlayout>div{
        background-color: gray;
        position: absolute;
    }
    div.mainlayout>div.header{
        width: 100%;
        height: 150px;
        line-height:100px;
        font-size: 35px;
        text-align: center;

    }
    div.mainlayout>div.menu{
        width: 100%;
        height: 100px;
        top: 170px;
        line-height:100px;
        font-size: 35px;
        text-align: center;

    }
    div.mainlayout>div.info{
        width: 100%;
        height: 340px;
        top: 280px;
        line-height:100px;
        font-size: 35px;
        text-align: center;
    }
    div.mainlayout>div.main{
        width: 100%;
        height: 1000px;
        top: 660px;
        line-height:100px;
        font-size: 35px;
        text-align: center;
    }

</style>
</head>
<body>
<div class="mainlayout">
    <div class="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="menu">
        <tiles:insertAttribute name="menu"/>
    </div>
    <div class="info">
        <tiles:insertAttribute name="info"/>
    </div>
    <div class="main">
        <tiles:insertAttribute name="main"/>
    </div>
</div>
</body>
</html>
