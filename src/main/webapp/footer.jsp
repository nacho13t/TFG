<%@page import="com.mycompany.multiplayerbiblio.User"%>
<div class=" container fixed-bottom justify-content-center">
    <% User user = (User) request.getSession().getAttribute("user");%>
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
        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            Acciones
        </button>

        <div class="collapse navbar-collapse skillbar" role="toolbar" aria-label="Toolbar with button groups" id="navbarSupportedContent">
            <div class="btn-group  btn-group-lg navbar-nav mr-auto" role="group" aria-label="First group">
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Rankings" onClick="location.href = 'mainScreen.jsp'"><i class="fas fa-list-ol"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Contenido" onClick="location.href = 'Content.jsp'"><i class="fas fa-book"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Cuestionarios" onClick="location.href = 'Exams.jsp'"><i class="fas fa-flag-checkered"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Medallas" onClick="location.href = 'Medals.jsp'"><i class="fas fa-trophy"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Perfil" onClick="location.href = 'Profile.jsp'"><i class="fas fa-user"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Inventario" onClick="location.href = 'Inventario.jsp'"><i class="fas fa-archive"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Libros recomendados" onClick="location.href = 'RecommendedBooks.jsp'"><i class="fas fa-graduation-cap"></i></button>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Mensajes" onClick="location.href = 'Messages.jsp';"><i class="far fa-envelope"></i></button>
                    <% if (user.level() >= 4) {%>
                <button type="button" class="mr-2 btn btn-secondary nav-item active" data-toggle="tooltip" data-placement="top" title="Foro" onClick="location.href = 'Forum.jsp'"><i class="fas fa-comment-alt"></i></button>
                    <%} else {%>
                <button type="button" class="mr-2 btn btn-secondary nav-item active disabled" data-toggle="tooltip" data-placement="top" title="Foro (Nivel 4 requerido)"><i class="fas fa-comment-alt"></i></button>
                    <%}%>
            </div>
        </div>
    </nav>
</div>

<div class="d-inline-block" style="height: 130px"></div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type='text/javascript' src="imageMapResizer.min.js"></script>


<script>
                    function validateSearch(form) {
                        if (form.elements[0].value === "") {
                            alert("Introduce algún texto en el campo de búsqueda");
                            return false;
                        }
                    }

//                    $(function () {
//                        $('[data-toggle="popover"]').popover();
//                    });

//                    $(document).ready(function () {
//                        $('[data-toggle="tooltip"]').tooltip();
//                    });
</script>