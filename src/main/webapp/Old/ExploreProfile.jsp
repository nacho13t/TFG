<%@page import="db.UserManagement"%>
<%@page import="inventory.InventoryItem"%>
<%@page import="com.mycompany.multiplayerbiblio.LevelUnlocks"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
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
        <%
            if (request.getSession().getAttribute("user") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>    
        <% User user = (User) request.getSession().getAttribute("user");%>


        <% if (!user.levelUnlocks().isEmpty()) {%>
        <div class="alert alert-info alert-dismissible" role="alert">
            <h2 class="alert-heading">Nuevas recompensas</h2>
            <% for (LevelUnlocks reward : user.levelUnlocks()) {
                    out.write("<p>" + reward.info() + "</p>");
                }
                user.levelUnlocks().clear();
            %>

            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%}%>

        <div class="mb-2 text-white top-bar container-fluid">
            <div class="row">
                <div class="col text-center">
                    <img src="<%=user.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    <h5><%=user.nick()%></h5>
                </div> 
                <div class="text-center col d-inline-flex justify-content-center align-self-center">
                    <div>
                        <h5><%=user.career()%></h5>
                        <h5>Nivel <%=user.level()%></h5>
                    </div>
                </div>
                <div class="text-center col d-inline-flex justify-content-center align-self-center">

                    <form action="LogoutServlet">
                        <button class="btn btn-outline-light mb-2 btn-sm" type="submit"><span class="font-weight-bold" >Cerrar sesión</span></button>
                    </form>

                </div>
            </div>
        </div>

        <%
            User target = UserManagement.getUser(request.getParameter("username"));
            if (target.id() == user.id()) {
                request.getRequestDispatcher("Profile.jsp").forward(request, response);
            }
        %>
        <div class="container">
            <div class="col p-2">
                <img src="<%=target.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
            </div> 
            <div id="profileInfo" class=" p-2">
                <h5><i><%=target.nick()%></i></h5>
                <h5><i>Nombre de usuario: <%=target.username()%></i></h5>
                <h5><i> Nv. <%=target.level()%></i></h5>
                <h5><i>Carrera: <%=target.career()%></i></h5>
                <h5><i><%=target.examStats()%> cuestionarios completados</i></h5>
                <h5><i><%=target.medalStats()%> medallas obtenidas</i></h5>
            </div>
        </div>

    </div>
    <div class=" container fixed-bottom justify-content-center">

        <div class="mb-2 progress">
            <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
        </div>


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                Menú
            </button>

            <div class="collapse navbar-collapse skillbar" role="toolbar" aria-label="Toolbar with button groups" id="navbarSupportedContent">
                <div class="btn-group  btn-group-lg navbar-nav mr-auto" role="group" aria-label="First group">
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Rankings" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-list-ol"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Contenido" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-book"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Cuestionarios" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-flag-checkered"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Medallas" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-trophy"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Perfil" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-user"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Inventario" onClick="location.href = 'Inventario.jsp';"><i class="fas fa-archive"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Libros recomendados" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-graduation-cap"></i></button>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Mensajes" onClick="location.href = 'Messages.jsp';"><i class="far fa-envelope"></i></button>
                        <% if (user.level() >= 4) {%>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Foro" onClick="location.href = 'mainScreen.jsp';"><i class="fas fa-comment-alt"></i></button>
                        <%} else {%>
                    <button type="button" class="mr-2 btn btn-secondary nav-item active disabled" data-toggle="tooltip" data-placement="top" title="Foro (Nivel 4 requerido)"><i class="fas fa-comment-alt"></i></button>
                        <%}%>
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

</body>
</html>