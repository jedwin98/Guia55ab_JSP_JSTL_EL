<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="cabecera.css">
<div class="cabecera">
<table width="100%" style="text-align: center;">
    <tr>
        <td style="text-align: justify">
            <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <span style="color:white;font-size:5mm;">
                  Usuario: ${sessionScope.user}</span><br>
              </c:if>
              <c:if test="${sessionScope.user == 'Anonimo'}">
              <span style="color:white;font-size:5mm;">
                  Usuario: Anónimo</span><br>
              </c:if>
          </c:if>
        </td>
        <td>
            
        </td>
        <td style="text-align: right">
    
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">

                  <a href="logout.jsp">Cerrar Sesión</a>
              </c:if>
          </c:if>
        
   
    <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
          <span style="color:brown;font-size:5mm;">
              <a href="frmlogin.jsp">Iniciar Sesión</a>
        </span>
    </c:if>
</td>
</tr>    
</table>
</div>
