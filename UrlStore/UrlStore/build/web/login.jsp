<%-- 
    Document   : Login
    Created on : Jun 29, 2024, 2:03:21 AM
    Author     : Huerta Mancilla Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UrlStore - Login</title>
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
        
        .login__title {
            text-align: center;
        }
        
        .login__form {
            background-color: #fff;
            border-radius: 0.625rem;
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 40px;
        }
        
        .login__form-input {
            display: flex;
            flex-direction: column;
            gap: 0.3125rem;
        }
        
        .login__input {
            text-indent: 0.625rem;
        }
        
        .login__link {
            text-align: center;
        }
    </style>
    <body>
        <form class="login__form" action="Login" method="POST">
            <h2 class="login__title">Iniciar Sesión</h2>
            <div class="login__form-input">
                <label>Correo electrónico</label>
                <input name="email" class="login__input" type="email" placeholder="Correo electrónico" required>
            </div>
            <div class="login__form-input">
                <label>Contraseña</label>
                <input name="password" class="login__input" type="password" placeholder="Contraseña" required>
            </div>
            <a class="login__link" href="/UrlStore/SignUp">Crear cuenta</a>
            <input type="submit" value="Iniciar Sesión">
        </form>
    </body>
</html>
