<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AcademicSys - Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="./img/logo.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                    AcademicSys
                </a>
            </div>
        </nav>
        <div class="pgLogin">
            <div class="container mt100">
                <div class="login">
                    <form method="post" action="LoginController">
                        <div class="mb-3">
                            <label class="form-label">User</label>
                            <input type="text" 
                                   required class="form-control" 
                                   name="usuario">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <input type="password" 
                                   required class="form-control" 
                                   name="senha">
                        </div>
                        <button type="submit" 
                                class="btn btn-dark w-100">Signup</button>
                                
                        <% if (Boolean.parseBoolean(request.getParameter("authError"))) { %>
                            <div class="loginError">
                                <b>Authentication error!</b>
                            </div>
                        <% } %>
                        
                        <% if (request.getParameter("accessDenied") != null) { %>
                            <div class="loginError">
                                <b>Access Denied! You should signup!</b>
                            </div>
                        <% } %>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>     
</html>