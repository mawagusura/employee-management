<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <!-- title -->
        <title>Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
    </head>
    <body>
        <c:import url="/WEB-INF/navbar.jsp"/>
        <div class="d-block mx-auto details-form jumbotron">
            <a href="navbar.jsp"></a>
            <form method="post">
                
                <c:choose>
                    <c:when test="${new_employee}">
                        <legend>Nouveau membre</legend>
                    </c:when>
                    <c:otherwise>
                        <legend>Détails du membre ${employee.prenom} ${employee.nom}</legend>
                    </c:otherwise>
                </c:choose>
                <hr>
                <p class="text-danger"><c:out value="${message_error}"/></p>
                <c:remove var="message_error" scope="session"/>
                
                <p class="text-primary"><c:out value="${message_info}"/></p>
                <c:remove var="message_info" scope="session"/>
                
                <c:if test="${!new_employee}"> 
                    <input type="hidden" class="form-control" id="employes-id" name="employes-id" value="${employee.id}">
                </c:if>
                    
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Nom</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${new_employee}">
                                <input type="text" class="form-control" id="name" name="employes-nom" placeholder="Nom" required>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="name" name="employes-nom" value="${employee.nom}" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="first-name" class="col-sm-2 col-form-label">Prénom</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${new_employee}">
                                <input type="text" class="form-control" id="first-name" name="employes-prenom" placeholder="Prénom" required>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="first-name" name="employes-prenom" value="${employee.prenom}" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="fixed-phone" class="col-sm-2 col-form-label">Tél dom</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${new_employee}">
                                <input type="text" class="form-control" id="fixed-phone" name="employes-teldom" placeholder="Tél. domicile" required>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="fixed-phone" name="employes-teldom" value="${employee.teldom}" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="mobile-phone" class="col-sm-2 col-form-label">Tél mob</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${new_employee}">
                                <input type="text" class="form-control" id="mobile-phone" name="employes-telport" placeholder="Tél. mobile" required>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="mobile-phone" name="employes-telport"value="${employee.telport}" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="pro-phone" class="col-sm-2 col-form-label">Tél pro</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${new_employee}">
                                <input type="text" class="form-control" id="pro-phone" name="employes-telpro" placeholder="Tél. professionnel" required>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="pro-phone" name="employes-telpro" value="${employee.telpro}" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="address" class="col-sm-4 col-form-label">Adresse</label>
                            <div class="col-sm-8">
                                <c:choose>
                                    <c:when test="${new_employee}">
                                        <input type="text" class="form-control" id="address" name="employes-adresse" placeholder="Adresse" required>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="address" name="employes-adresse" value="${employee.adresse}" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="postal" class="col-sm-5 col-form-label">Code postal</label>
                            <div class="col-sm-7">
                                <c:choose>
                                    <c:when test="${new_employee}">
                                        <input type="text" class="form-control" id="postal" name="employes-codepostal" placeholder="Code postal" required>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="postal" name="employes-codepostal" value="${employee.codepostal}" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="country" class="col-sm-4 col-form-label">Ville</label>
                            <div class="col-sm-8">
                                <c:choose>
                                    <c:when test="${new_employee}">
                                        <input type="text" class="form-control" id="country" name="employes-ville" placeholder="Ville" required>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="country" name="employes-ville" value="${employee.ville}" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="mail" class="col-sm-5 col-form-label">Email</label>
                            <div class="col-sm-7">
                                <c:choose>
                                    <c:when test="${new_employee}">
                                        <input type="text" class="form-control" id="mail" name="employes-email" placeholder="Email" required>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" id="mail" name="employes-email" value="${employee.email}" required>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="float-right">
                    <c:choose>
                        <c:when test="${new_employee}">
                            <button type="submit" class="btn btn-primary ml-1" formaction="${pageContext.request.contextPath}/add" formmethod="post">Valider</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-primary ml-1" formaction="${pageContext.request.contextPath}/details" formmethod="post">Modifier</button>
                        </c:otherwise>
                    </c:choose>
                   
                    <a href ="${pageContext.request.contextPath}/list" class="btn ml-1"> Voir liste </a>
                </div>
            </form>
        </div>
    </body>
</html>