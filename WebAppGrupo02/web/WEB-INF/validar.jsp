<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VALIDACION DE USUARIOS</title>
        <link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>
    </head>
    <body>
        <div>
            <h1>Comprobación de Usuarios</h1>
        </div>
        <hr>
        <c:if test="${empty param.usuario or empty param.clave}">
            <c:redirect url="frmlogin.jsp">
                <c:param name="msg" value=" El usuario o Clave no deben quedar vacios"/>
            </c:redirect>
        </c:if>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT count(*) as cant from usuarios where login=? and clave=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:if test="${result.rows[0].cant < 1}"> 
            <c:redirect url="frmlogin.jsp">
                <c:param name="msg" value="Usuario o Clave incorrectos"/>
            </c:redirect>
        </c:if> 
        <sql:query dataSource = "${fuenteDatos}" var = "datos">
            SELECT login,nombre,nivel from usuarios where login=? and clave=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:set var="user" value="${datos.rows[0].login}" scope="session" />
        <c:set var="nombre" value="${datos.rows[0].nombre}" scope="session" />
        <c:set var="nivel" value="${datos.rows[0].nivel}" scope="session" />
        <div>
            <h2 style="color:greenyellow;"><br><br>¡En unos segundos se redirijirá a index!</h2>
        </div>
        
                <script>
                    alertify.success('¡Bienvenido a su sitio!');
                    setTimeout(function () {
                        location.href = "index.jsp";
                    }, 5000);
                
                </script>
    </body>
</html>
