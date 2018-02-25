<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>TFG</title>
    </head>
    <body>
        <% User user = (User) request.getSession().getAttribute("user");
            if (user.noob()) {%>
        <div class="alert alert-success alert-dismissible" role="alert">
            <h4 class="alert-heading">¡Bienvenid@ <%=user.nick()%> !</h4>
            <p>Completa lecciones y realiza las diferentes tareas disponibles para conseguir experiencia y subir de nivel. A medida que progreses desbloquearás nuevas características.</p>
            <hr>
            <p class="mb-0">Esto es una versión de prueba, tu progreso no se guardará cuando abandones la sesión.</p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%}
            if (session.getAttribute("note") != null) {
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <h2 class="alert-heading">Has realizado un cuestionario</h2>
            <p>La puntuación que has obtenido es <%= session.getAttribute("note")%></p>
            <%if (session.getAttribute("lessonCompleted") != null) {%>
            <hr><p class="mb-0">¡Has conseguido la máxima nota en el cuestionario, has ganado experiencia!</p>
            <%}%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%}

            session.setAttribute("note", null);
            session.setAttribute("lessonCompleted", null);
        %>




        <div class="container p-3 mb-2 bg-primary text-white">
            <div class="row">
                <div class="col-sm">
                    <img src="<%=user.image()%>" class="img-fluid" alt="Profile image" style="max-height:75px;width:130px;">
                </div>
                <div class="col-sm">
                    <h4 class="text-center"><%=user.nick()%> - <%=user.career()%></h4>
                    <h3 class="text-center">Nv: <%=user.level()%></h3>
                </div>
            </div>
        </div>

        <div class="content container" id="skill1Div" style="display: none">
            <jsp:include page="Content.jsp" />
        </div>

        <div class="content container" id="skill2Div" style="display: none">
            <jsp:include page="Exams.jsp" />
        </div>

        <div class="content container" id="skill3Div" style="display: none">
            <jsp:include page="Medals.jsp" />
        </div>

        <div class="content container" id="skill4Div" style="display: none">
            <jsp:include page="Profile.jsp" />
        </div>

        <div class="content container" id="skill5Div" style="display: none">
            <jsp:include page="RecommendedBooks.jsp" />
        </div>
        
        <div class="content container" id="skill6Div">
            <jsp:include page="Rankings.jsp" />
        </div>



        <div class=" container fixed-bottom justify-content-center">

            <%if (user.noob()) {%>
            <div class="alert alert-success alert-dismissible" role="alert">
                <p>Esta es tu barra de experiencia, ¡has obtenido 50 puntos por entrar por primera vez!</p>
                <hr>
                <p class="mb-0">Cuando llenes la barra aumentarás un nivel.</p>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%}%>

            <div class="mb-2 progress">
                <div class="progress-bar" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
            </div>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    Menú
                </button>

                <div class="collapse navbar-collapse" role="toolbar" aria-label="Toolbar with button groups" id="navbarSupportedContent">
                    <div class="btn-group  btn-group-lg navbar-nav mr-auto" role="group" aria-label="First group">
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Rankings" onClick="displayDiv(this.id)" id="skill6"><i class="fas fa-list-ol"></i></button>
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Contenido" onClick="displayDiv(this.id)" id="skill1"><i class="fas fa-book"></i></button>
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Cuestionarios" onClick="displayDiv(this.id)" id="skill2"><i class="fas fa-flag-checkered"></i></button>
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Medallas" onClick="displayDiv(this.id)" id="skill3"><i class="fas fa-trophy"></i></button>
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Perfil" onClick="displayDiv(this.id)" id="skill4"><i class="fas fa-user"></i></button>
                        <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Libros recomendados" onClick="displayDiv(this.id)" id="skill5"><i class="fas fa-graduation-cap"></i></button>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

        <script>
                            function displayDiv(buttonId) {
            <%user.noNoob();%>
                                jQuery('.content').hide();
                                jQuery('#' + buttonId + 'Div').show();
                            }
        </script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
        <div class="d-inline-block" style="height: 130px"></div>
    </body>
</html>