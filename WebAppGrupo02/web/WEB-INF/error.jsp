<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceso Denegado</title>
    </head>
    <body>
        <h1>
            <c:choose>
            <c:when test="${param.logeado eq 'not'}">
                <h1>Hemos detectado que intenta realizar la operacion: <span style="color:red;">${param.operacion}</span> sin haberse logeado</h1>
                <h1>A continuación se le permite ingresar como Anonimo, pero solo tiene derechos para realizar Consultas.    </h1>           
            </c:when>
            <c:when test="${param.logeado eq 'yes'}">
                <h1>Hemos detectado que intenta realizar la operacion: <span style="color:red;">${param.operacion}</span></h1>
                <h1>Su nivel de seguridad es: <span style="color:red;">${sessionScope.nivel}</span></h1>
                <h1>Dicho nivel solo le permite realizar: 
                <c:set var="permiso" value="${sessionScope.nivel}"/>
                <c:choose>
                    <c:when test="${permiso eq '0'}">
                        <span style="color:blue;">Consultas</span>
                    </c:when>
                    <c:when test="${permiso eq '1'}">
                        <span style="color:blue;">Consultas e Inserciones</span>
                    </c:when>
                    <c:when test="${permiso eq '2'}">
                        <span style="color:blue;">Consultas, Actualizaciones y Eliminaciones</span>
                    </c:when>                       
                </c:choose>
                </h1>
            </c:when>                
        </c:choose>
        </h1>
        <c:choose>
            <c:when test="${param.tipo eq 'contexto'}">
                    Error, no es posible acceder sin autorización.
            </c:when>
            <c:when test="${param.tipo eq 'vacio'}">
                <h1>Los parametros que están vacios para realizar la operación son los siguientes:</h1>
                <c:if test="${param.isbn eq 'sin_isbn'}">
                    <h1><span style="color:blue;">- El isbn</span> </h1>
                </c:if>
                <c:if test="${param.titulo eq 'sin_titulo'}">
                    <h1><span style="color:blue;">- El titulo </span></h1>
                </c:if>
                <c:if test="${param.autor eq 'sin_autor'}">
                    <h1><span style="color:blue;">- El autor</span></h1>
                </c:if>
                <c:if test="${param.editorial eq 'sin_editorial'}">
                    <h1><span style="color:blue;">- La editorial</span></h1>
                </c:if>
            </c:when>
            <c:when test="${param.tipo eq 'parametro'}">
                    No tiene el nivel de acceso necesario para Aceder.
            </c:when>                
            </c:choose>
                  <script>
                setTimeout(function () {
                    location.href = "${param.destino}";
                }, 4000);
            </script>
    </body>
</html>

