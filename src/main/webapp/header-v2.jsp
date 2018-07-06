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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <title>TFG</title>
</head>

<body>
        <script>
            
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
            }

            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function () {
                FB.init({
                    appId: '251303118946517',
                    cookie: true, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.8' // use graph api version 2.8
                });

                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "https://connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));


            function testAPI() {
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', function (response) {
                    console.log('Successful login for: ' + response.name);
                    document.getElementById('status').innerHTML =
                            'Thanks for logging in, ' + response.name + '!';
                });
            }
        </script>
    
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
        <p>Revisa primero el tutorial, haciendo click en el icono negro con una interrogación en la imagen inferior.</p>
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
        <h3 class="alert-heading">Información</h3>
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
                    <button class="btn btn-outline-light btn-sm" type="submit"><span class="font-weight-bold" onclick="FB.logout();">Cerrar sesión</span></button>
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
