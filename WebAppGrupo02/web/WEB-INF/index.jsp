<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ include file  = "fuentedatos.jsp" %>

<c:set var="pageId" value="Index" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="principal.css">
        <title>Registro de libros</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Biblioteca</h1>
        
        <c:if test="${sessionScope.nivel eq 1}">
            <h2>Registrar libro</h2>
            <form method="POST" action="insertar.jsp">

                <div><label for="isbn">ISBN: </label></div>
                <div><input id="isbn" name="isbn" type="text" max="13"><br></div>

                <div><label for="titulo">Título: </label></div>
                <div><input id="titulo" name="titulo" type="text"><br></div>

                <div><label for="autor">Autor: </label></div>
                <div><input id="autor" name="autor" type="text"><br></div>

                <div><label for="editorial">Editorial: </label></div>
                <div><input id="editorial" name="editorial" type="text"></div><br>

                <div><input type="submit" value="Enviar"></div>
                <div id="form">
                    <c:if test="${not empty param.msg}">
                        <p style="color:white; font-size: 5 px;"> Corrige el siguiente error : ${param.msg}</p>
                    </c:if>
                </div>
            </form>
        </c:if>
            
        ${var = ""}
        <h2>Listado de libros</h2>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>  
            
        <table border = "1" width = "100%">
            <tr>
                <th>ISBN</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Editorial</th>
                <c:if test="${sessionScope.nivel eq 2}">
                    <th>Acción</th>
                </c:if>
            </tr>
            
            <c:choose>
                <c:when test="${sessionScope.nivel eq 1 or sessionScope.nivel eq 0}">
                    <c:forEach var = "row" items = "${result.rows}">

                        <tr>
                            <td>  
                                <c:out value = "${row.isbn}"/>
                            </td>
                            <td>
                                <c:out value = "${row.titulo}"/>
                            </td>
                            <td>
                                <c:out value = "${row.autor}"/>
                            </td>
                            <td>
                                <c:out value = "${row.editorial}"/>
                            </td>
                            
                        </tr>
                    </c:forEach>
                </c:when>
                <c:when test="${sessionScope.nivel eq 2}">
                    <c:forEach var = "row" items = "${result.rows}">

                        <tr>
                            <td>  
                                <c:out value = "${row.isbn}"/>
                            </td>
                            <td>
                                <c:out value = "${row.titulo}"/>
                            </td>
                            <td>
                                <c:out value = "${row.autor}"/>
                            </td>
                            <td>
                                <c:out value = "${row.editorial}"/>
                            </td>
                            <td>
                                <c:if test="${sessionScope.nivel eq 2}">
                                    <a href="frmupdate.jsp?isbn=<c:out value="${row.isbn}"/>">Actualizar</a>|
                                </c:if>
                                <a href="delete.jsp?isbn=<c:out value="${row.isbn}"/>">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
        </table>

        
    </body>
</html>
