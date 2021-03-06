<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- title -->
        <title>Login</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
    </head>
    <body>
        <div class="d-block mx-auto login-card">
            <h3 class="text-primary">Connexion</h3>
            <p class="text-danger"><c:out value="${message_error}"/><p>
            <c:remove var="message_error" scope="session"/>
            
            <div class="card border-secondary mb-3" style="max-width: 20rem;">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="form-group">
                            <input type="text" name="chLogin" class="form-control" placeholder="Login">
                            <input type="password" name="chPassword" class="form-control mt-2" placeholder="Mot de passe">
                            <button type="submit"  class="btn btn-primary mt-2">Connexion</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>