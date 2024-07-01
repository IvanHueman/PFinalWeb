<%-- 
    Document   : add-url
    Created on : Jun 29, 2024, 10:45:47 AM
    Author     : Huerta Mancilla Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%
    Object id = request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Url</title>
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
        
        .add-url__title {
            text-align: center;
        }
        
        .add-url__form {
            background-color: #fff;
            border-radius: 0.625rem;
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 40px;
        }
        
        .add-url__form-input {
            display: flex;
            flex-direction: column;
            gap: 0.3125rem;
        }
        
        .add-url__input {
            text-indent: 0.625rem;
        }
        
        .add-url__link {
            text-align: center;
        }
    </style>
    <body>
        <form class="add-url__form" action="AddUrl" method="POST">
            <h2 class="add-url__title">Agregar url</h2>
            <input name="user-id" type="hidden" placeholder="Página" value="<%= id %>">
            <div class="add-url__form-input">
                <label>Página</label>
                <input name="name" class="add-url__input" type="text" placeholder="Página" required>
            </div>
            <div class="add-url__form-input">
                <label>Link</label>
                <input name="url" class="add-url__input" type="url" placeholder="Link" required>
            </div>
            <a class="add-url__link" href="/UrlStore/Dashboard">Regresar</a>
            <input type="submit" value="Agregar">
        </form>
    </body>
</html>
