<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mycompany.multiplayerbiblio.ForumThread"%>
<%@page import="db.ForumManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<%@page import="db.UserManagement"%>
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #333333">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color:white">
        
        <h3 class="text-center">Foro</h3>
        
        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#postModal">
            Nuevo tema
        </button><hr>
        <div>
            <h5>Temas</h5>
            <ul class="list-group list-group-flush">
                <%
                    for (ForumThread thread : ForumManagement.getThreads()) {
                %>
                <li class="list-group-item" style="background-color: #444444; "><a style="color:white;" href="ThreadDisplay-v2.jsp?name=<%=thread.getTitle()%>&threadid=<%=thread.getId()%>"><%=thread.getTitle()%> - <%=UserManagement.getUserNick(thread.getUser_id())%> - <%=new SimpleDateFormat("dd/MM/yyyy").format(thread.getDate())%></a><% if (thread.getUser_id() == user.id()) {%>
                    <form action="DeleteThreadServlet">
                        <input type="hidden" name="threadid" value="<%=thread.getId()%>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                    <%}%>
                </li>
                <%}%>
            </ul>
        </div>

        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 style="color: black" class="modal-title" id="postModalLongTitle">Nuevo tema</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="CreateThreadServlet" onsubmit="return validateNewThread(this)">
                            <div class="form-group">
                                <label for="postName">Título</label>
                                <input type="text" class="form-control" name="title" id="inputTitle" aria-describedby="emailHelp" placeholder="Nombre del tema">
                                <small id="titleHelp" class="form-text text-muted">Este es el título que aparecerá en la lista de hilos.</small>
                            </div>
                            <div class="form-group">
                                <label for="body">Mensaje: </label>
                                <textarea class="form-control" rows="5" name="body" id="body"></textarea>
                                <small id="bodyHelp" class="form-text text-muted">Máximo 255 caracteres.</small>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Crear</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
            </div>
            <div class="col-sm-12 col-md-4">
                <div class="row mt-4 mr-1">
                    <div class="col-5 text-center">
                        <img src="<%=user.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    </div> 
                    <div class="col-7">
                        <h5 style="color: white" mt-2><%= user.nick()%></h5>
                        <h5 style="color: white" mt-2><%= user.career()%></h5>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-center pr-2">

                    <div class="mt-3"><span class="rounded-circle border border-white" style="background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level()%></span></div>
                    <div class="mt-4 progress w-75">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
                    </div>
                    <div class="mt-3"><span class="rounded-circle border border-white" style=" background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level() + 1%></span></div>

                </div>

                <div class="list-group align-items-center menu-right align-middle mt-4 pr-3">
                    <a href="Content.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Biblioteca</a>
                    <a href="Rankings-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Rankings</a>
                    <a href="Inventario-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
                    <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
                    <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Medallas</a>
                </div> 
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>

    <jsp:include page="footer-v2.jsp" />

        <script>
        function validateNewThread(form) {
            if (form.elements[0].value === "") {
                alert("Introduce un título para el tema");
                return false;
            }

            if (form.elements[1].value === "") {
                alert("Introduce el contenido del primer mensaje");
                return false;
            }

            if (form.elements[1].value.length > 255) {
                alert("Máximo 255 caracteres, has introducido " + form.elements[1].value.length);
                return false;
            }

            return true;
        }
    </script>
    
</body>
</html>