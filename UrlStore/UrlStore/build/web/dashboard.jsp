<%-- 
    Document   : dashboard
    Created on : Jun 29, 2024, 2:58:37 AM
    Author     : Huerta Mancilla Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   Object username = request.getAttribute("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <title>Dashboard</title>
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
            grid-template-rows: 40px auto;
            min-height: 100dvh;
        }
        
        table {
            width: 100%
        }
        
        th, td {
            text-align: center !important;
        }
        
        .dashboard__header {
            align-items: center;
            background-color: #fff;
            border-bottom: 1px solid rgba(0, 0, 0, 0.13); 
            display: flex;
            justify-content: space-between;
            padding: 10px 20px 0 20px;
        }
        
        .dashboard__title {
            font-size: 18px;
        }
        
        .dashboard__header-actions {
            display: flex;
            gap: 10px;
        }
    </style>
    <body>
        <header class="dashboard__header">
            <h2 class="dashboard__title">¡Te damos la bienvenida, <%= username %>!</h2>
            <div class="dashboard__header-actions">
                <a href="/UrlStore/AddUrl">
                    <span class="material-symbols-outlined" title="Agregar">
                         add_circle
                    </span>
                </a>
                <a href="/UrlStore/UpdateUrl" title="Editar">
                    <span class="material-symbols-outlined">
                        edit
                    </span>
                </a>
                <a href="/UrlStore/DeleteUrl" title="Eliminar">
                    <span class="material-symbols-outlined">
                        delete
                    </span>
                </a>
                <a href="/UrlStore/Logout" title="Salir">
                    <span class="material-symbols-outlined">
                        logout
                    </span>
                </a>
            </div>
        </header>
        <main>
            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                <thead>
                    <tr>
                        <th class="mdl-data-table__cell--non-numeric">#</th>
                        <th>Página</th>
                        <th>Link</th>
                        <th>Fecha de modificación</th>
                        <th>Fecha de creación</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items ="${requestScope.urls}" var="url">
                    <tr>
                        <td><c:out value="${url.id}"/></td>
                        <td><c:out value="${url.name}"/></td>
                        <td>
                            <a href="<c:out value="${url.url}"/>">
                                <c:out value="${url.url}"/>
                            </a>
                        </td>
                        <td><c:out value="${url.updatedAt}"/></td>
                        <td><c:out value="${url.createdAt}"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
</html>
