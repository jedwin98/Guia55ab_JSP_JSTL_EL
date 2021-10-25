<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CERRAR SESION</title>
        <link href="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>
    </head>
    <body>
        <h1>ACABA DE CERRAR SESION.</h1>
        <hr>
        <c:set var="user" value="" scope="session" />
        <c:set var="nombre" value="" scope="session" />
        <c:set var="nivel" value="-1" scope="session" />
        <p>
        <h2 style="color:greenyellow;"><br>Dentro de unos segundos sera redirigido a la pagina de INICIO</p></h2>
        <script>
                alertify.success('¡Hasta Luego!');
                setTimeout(function () {
                    location.href = "index.jsp";
                }, 4000);
            </script>
    </body>
</html>
