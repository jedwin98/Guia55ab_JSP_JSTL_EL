<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Insertar" />
<c:set var="standalone" value="not" />
<%@include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="insertar.css">
        <%@ include file="header.jsp" %>
        <title>Insertar</title>
    </head>
    <body>
        <c:if test="${empty param.isbn or empty param.titulo or empty param.autor or empty param.editorial}">
            <c:redirect url='error.jsp'>
                <c:param name="tipo" value="vacio"/>
                <c:param name="destino" value="index.jsp"/>
                <c:if test="${empty param.isbn}">
                    <c:param name="isbn" value="sin_isbn"/>
                </c:if>
                <c:if test="${empty param.titulo}">
                    <c:param name="titulo" value="sin_titulo"/>
                </c:if>
                <c:if test="${empty param.autor}">
                    <c:param name="autor" value="sin_autor"/>
                </c:if>
                <c:if test="${empty param.editorial}">
                    <c:param name="editorial" value="sin_editorial"/>
                </c:if>
            </c:redirect>
        </c:if>
        
        <c:if test="${sessionScope.nivel != 1}">
        <cd:redirect url='error.jsp'>
        </cd:redirect>
        </c:if> 
        
        <c:set var = "isbnInsertar" value = "${param.isbn}"/>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${param.isbn}" />
        </sql:query>
        <c:set var = "contador" value = "0"/>
        
        <c:forEach var = "row" items = "${result.rows}">
            <c:set var = "contador" value = "${contador+1}"/>
        </c:forEach>

    <c:if test="${contador==0}">
        <h1>Libro agregado</h1>
        ${var = ""}
        
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro (isbn,titulo,autor,editorial)  VALUES (?,?,?,?);
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>   

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${isbnInsertar}" />
        </sql:query>

        <c:forEach var = "row" items = "${result.rows}">
            <p>El libro <c:out value = "${row.titulo}"/> de <c:out value = "${row.autor}"/> se ha agregado correctamente.</p> 
        </c:forEach>
    </c:if>
    <c:if test="${contador!=0}">
        <c:redirect url="index.jsp">
            <c:param name="msg" value="El libro no puede agregarse porque ya existe un libro con isbn ${param.isbn}"/>
        </c:redirect>
    </c:if>
    <a href="index.jsp" style="font-size:0.5cm;color:blue;">RETORNAR A INDEX</a>
</body>
</html>