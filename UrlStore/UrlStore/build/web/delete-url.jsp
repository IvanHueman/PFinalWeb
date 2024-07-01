<%-- 
    Document   : delete-url
    Created on : Jun 29, 2024, 1:44:58 PM
    Author     : Huerta Mancilla Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Object id = request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <style>
        * { margin: 0; padding: 0; }
        
        *, *::before, *::after { box-sizing: border-box }
        
        p { text-wrap: pretty }
        
        h1, h2, h3 { text-wrap: balance }
        
        input, button, select, textarea { font: inherit; outline: none; }
        
        body {
            background-color: #f1f1f1;
            font-family: sans-serif;
            font-size: 16px;
            display: grid;
            min-height: 100dvh;
            place-content: center;
        }
        
        .delete-url__title {
            text-align: center;
        }
        
        .delete-url__form {
            background-color: #fff;
            border-radius: 0.625rem;
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 40px;
        }
        
        .delete-url__form-input {
            display: flex;
            flex-direction: column;
            gap: 0.3125rem;
        }
        
        .delete-url__input {
            text-indent: 0.625rem;
        }
        
        .delete-url__link {
            text-align: center;
        }
    </style>
    <body>
        <form class="delete-url__form" action="DeleteUrl" method="POST">
            <h2 class="delete-url__title">Eliminar url</h2>
            <div class="delete-url__form-input">
                <label>Selecciona una página</label>
                <select id="id" name="id">
                    <c:forEach items ="${requestScope.urls}" var="url">
                        <option value="<c:out value="${url.id}"/>">
                            <c:out value="${url.id}"/> - <c:out value="${url.name}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <a class="delete-url__link" href="/UrlStore/Dashboard">Regresar</a>
            <input type="submit" value="Eliminar">
        </form>
    </body>
</html>
