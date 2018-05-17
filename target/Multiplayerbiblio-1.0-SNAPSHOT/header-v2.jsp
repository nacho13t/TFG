<%@page import="com.mycompany.multiplayerbiblio.LevelUnlocks"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="image-map-pro.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>TFG</title>
</head>

<body bgcolor="#000000">
    <%
        if (request.getSession().getAttribute("user") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    %>    
    <% User user = (User) request.getSession().getAttribute("user");
        if (user.noob()) {
            user.noNoob();%>
    <div class="alert alert-success alert-dismissible" role="alert">
        <h4 class="alert-heading">¡Bienvenid@ <%=user.nick()%> !</h4>
        <p>Completa lecciones y realiza las diferentes tareas disponibles para conseguir experiencia y subir de nivel. A medida que progreses desbloquearás nuevas características.</p>
        <hr>
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

    <div class="text-white top-bar container-fluid user-info">
        <div class="row p-2">
            <div class="col pt-1">
                <h3 class="page-title">Conoce tu biblioteca</h3>
            </div>
            <div class="col pt-1" style="text-align: right">
                <form action="LogoutServlet">
                    <button class="btn btn-outline-light btn-sm" type="submit"><span class="font-weight-bold" >Cerrar sesión</span></button>
                </form>

            </div>
        </div>
    </div>

<!--    <div class="container search-user">
        <form action="SearchUserServlet" onsubmit="return validateSearch(this)" class="form-inline p-1">
            <div class="form-group mb-2">
                <input type="text" name="search" placeholder="Busca un usuario" class="form-control">
            </div>
            <button type="submit" class="btn btn-info mb-2">Buscar</button>
        </form>
        <hr>
    </div>-->
