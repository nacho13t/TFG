<%@page import="db.CareerManagement"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <title>TFG</title>
    </head>
    <body>

        <div class="p-3 mb-2 bg-primary text-white container-fluid">
            <div class="row">
                <div class="col text-center">
                    <h1>Conoce tu biblioteca</h1>
                </div> 

                <div class="text-center col d-inline-flex justify-content-center align-self-center">
                    <form action="LogoutServlet">
                        <button class="btn btn-outline-light mt-1" type="button" data-toggle="modal" data-target="#loginModal"><span class="font-weight-bold" >Iniciar sesión</span></button>
                        <button class="btn btn-success mt-1" type="button" data-toggle="modal" data-target="#registerModal"><span class="font-weight-bold" >Registrarse</span></button>
                    </form>
                </div>
            </div>
        </div>

        <div class="content container" id="skill6Div">
            <jsp:include page="Rankings.jsp" />
        </div>

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inicio de sesión</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="LoginServlet" onsubmit="return validateLogin(this)">
                            <div class="form-group">
                                <label for="yourName">Nombre</label>
                                <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Contraseña</label>
                                <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary">Entrar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Registro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="RegisterServlet" onsubmit="return validateRegister(this)" accept-charset="UTF-8">
                            <div class="form-group">
                                <label for="yourName">Nombre</label>
                                <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                            </div>
                            <div class="form-group">
                                <label for="inputCareer">Carrera</label>
                                <select id="inputCareer" name="career" class="form-control">
                                    <%
                                        for (String career : CareerManagement.getCareerNames()) {
                                    %><option><%=career%></option><%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Contraseña</label>
                                <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Repita la contraseña</label>
                                <input type="password" class="form-control" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary float-left">Entrar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

        <script>
                            $(document).ready(function () {
                                $('[data-toggle="tooltip"]').tooltip();
                            });
        </script>

        <script>
            function validateRegister(form) {
                if (form.elements[0].value === "") {
                    alert("Introduce un nombre de usuario");
                    return false;
                }

                if (form.elements[1].value === "") {
                    alert("Introduce la carrera que estudias");
                    return false;
                }

                if (form.elements[2].value === "") {
                    alert("Introduce una contraseña");
                    return false;
                }

                if (form.elements[2].value !== form.elements[3].value) {
                    alert("Las contraseñas no coinciden");
                    return false;
                }

                return true;
            }
        </script>

        <script>
            function validateLogin(form) {
                if (form.elements[0].value === "") {
                    alert("Introduce un nombre de usuario");
                    return false;
                }

                if (form.elements[1].value === "") {
                    alert("Introduce la contraseña");
                    return false;
                }

                return true;
            }
        </script>
        <div class="d-inline-block" style="height: 130px"></div>
    </body>
</html>