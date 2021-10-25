<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ include file  = "fuentedatos.jsp" %>

<c:set var="pageId" value="Eliminar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="delete.css">
        <%@ include file="header.jsp" %>
        <title>Eliminar</title> 
    </head>
    <body>
        <c:if test="${empty param.isbn}">
            <c:redirect url='error.jsp'>
                <c:param name="tipo" value="vacio"/>
                <c:param name="isbn" value="sin_isbn"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        
        <c:set var = "isbnId" value = "${param.isbn}"/>
        <h1>Libro eliminado</h1>
        ${var = ""}
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${isbnId}" />
        </sql:query>
            
        <c:forEach var = "row" items = "${result.rows}">
            <table border = "0" >
                <th colspan="2" align="left">Datos del libro eliminado</th>
                <tr>
                    <td>ISBN:</td>
                    <td><c:out value = "${row.isbn}"/></td>
                </tr>
                <tr>
                    <td>Título:</td>
                    <td><c:out value = "${row.titulo}"/></td>
                </tr>
                <tr>
                    <td>Autor:</td>
                    <td><c:out value = "${row.autor}"/></td>
                </tr>
                <tr>
                    <td>Editorial:</td>
                    <td><c:out value = "${row.editorial}"/></td>
                </tr>
            </table>
                
            <sql:update dataSource = "${fuenteDatos}" var = "result">
            DELETE FROM libro WHERE isbn = ?
            <sql:param value = "${isbnId}" />
            </sql:update>
            
            <p>El libro <b><c:out value = "${row.titulo}"/></b> se ha eliminado correctamente </p>  
        </c:forEach>
        <a href="index.jsp" style="font-size:0.5cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
