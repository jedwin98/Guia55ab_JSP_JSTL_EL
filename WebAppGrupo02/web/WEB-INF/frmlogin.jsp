
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="frmlogin.css">
         <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>AUTENTICACIÓN DE USUARIO</title>
    </head>
    <body>
        <div class="acceso">
           <h1>Formulario de Acceso</h1>
        </div>
        <hr>
        
        <div id="container">
            <c:if test="${not empty param.msg}">
                <p style="color:red;"> Corrige el siguiente error : ${param.msg}</p>
            </c:if>
                
       </div>
       
                <form name="login" action="validar.jsp" method="post">
                    <!-- Username -->
                   <div> 
                   
                    <i class="fa fa-user fa-lg" aria-hidden="true"></i><label for="usuario"><strong>Usuario : </strong></label>
                    <input name="usuario" id="usuario" type="input" value=""  placeholder="Ingrese su usuario">
                   </div>
                    <br>
                 
                    <!-- Password -->
                    <div> 
                    <i class="fa fa-key fa-lg" aria-hidden="true"></i><label for="clave"><strong>Clave : </strong></label>
                    <input  name="clave" id="clave" type="password"  placeholder="Ingrese su contraseña">
                    </div>
                    
                     <br>
                     <br>
                    <div>
                        <input type="submit" value="Ingresar">
                    </div>
                </form>     
                     
        </div>
    </body>
</html>
