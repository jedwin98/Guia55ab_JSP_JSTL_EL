<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Actualizar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="update.css">
        <%@ include file="header.jsp" %>
        <title>Actualizar libro</title>
    </head>
    <body>
        <c:if test="${empty param.isbn}">
            <c:redirect url='error.jsp'>
                <c:param name="tipo" value="vacio"/>
                <c:param name="isbn" value="sin_isbn"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            UPDATE libro SET titulo=?,autor=?,editorial=? WHERE isbn=?; 
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>            
            <sql:param value="${param.isbn}"/>
        </sql:update> 
        <h1>Libro actualizado</h1>
        <p>Los datos del libro con isbn <b> ${param.isbn} </b> han sido actualizados con éxito</p>
        <a href="index.jsp" style="font-size:0.5cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
