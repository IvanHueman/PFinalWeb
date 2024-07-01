<%-- 
    Document   : update-url
    Created on : Jun 29, 2024, 12:15:53 PM
    Author     : Huerta
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
        <title>JSP Page</title>
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
        
        .update-url__title {
            text-align: center;
        }
        
        .update-url__form {
            background-color: #fff;
            border-radius: 0.625rem;
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 40px;
        }
        
        .update-url__form-input {
            display: flex;
            flex-direction: column;
            gap: 0.3125rem;
        }
        
        .update-url__input {
            text-indent: 0.625rem;
        }
        
        .update-url__link {
            text-align: center;
        }
    </style>
    <body>
        <form class="update-url__form" action="UpdateUrl" method="POST">
            <h2 class="update-url__title">Actualizar url</h2>
            <input name="user-id" type="hidden" placeholder="Página" value="<%= id %>">
            <div class="update-url__form-input">
                <label>Selecciona una página</label>
                <select id="id" name="id">
                    <c:forEach items ="${requestScope.urls}" var="url">
                        <option value="<c:out value="${url.id}"/>" data-url="<c:out value="${url.url}"/>">
                            <c:out value="${url.id}"/> - <c:out value="${url.name}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="update-url__form-input">
                <label>Página</label>
                <input id="name" name="name" class="update-url__input" type="text" placeholder="Página" required>
            </div>
            <div class="update-url__form-input">
                <label>Link</label>
                <input id="url" name="url" class="update-url__input" type="url" placeholder="Link" required>
            </div>
            <a class="update-url__link" href="/UrlStore/Dashboard">Regresar</a>
            <input type="submit" value="Actualizar">
        </form>
    </body>
    <script>
        'use strict';
        
        const id = document.querySelector('#id');

        id.addEventListener('change', (e) => {
            const name = document.querySelector('#name');
            const url = document.querySelector('#url');

            const index = e.target.selectedIndex;

            name.value = e.target.children[index].innerText.trim().split('-')[1].trim();
            url.value =  e.target.children[index].getAttribute('data-url').trim();
        }); 
    </script>
</html>
