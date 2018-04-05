<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.ForumThread"%>
<%@page import="db.ForumManagement"%>

<!doctype html>
<html lang="en">

    <jsp:include page="header.jsp" />
    <% User user = (User) request.getSession().getAttribute("user");%>
    <h3 class="text-center">Foro</h3>

    <div class="container">
        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#postModal">
            Nuevo tema
        </button><hr>
        <div>
            <h5>Temas</h5>
            <ul class="list-group list-group-flush">
                <%
                    for (ForumThread thread : ForumManagement.getThreads()) {
                %>
                <li class="list-group-item"><a href="ThreadDisplay.jsp?name=<%=thread.getTitle()%>&threadid=<%=thread.getId()%>"><%=thread.getTitle()%> - <%=UserManagement.getUserNick(thread.getUser_id())%> - <%=new SimpleDateFormat("dd/MM/yyyy").format(thread.getDate())%></a><% if (thread.getUser_id() == user.id()) {%>
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
                        <h5 class="modal-title" id="postModalLongTitle">Nuevo tema</h5>
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

    <jsp:include page="footer.jsp" />
