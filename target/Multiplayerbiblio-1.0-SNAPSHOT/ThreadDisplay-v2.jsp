<%@page import="com.mycompany.multiplayerbiblio.ForumPost"%>
<%@page import="db.ForumManagement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<%@page import="db.UserManagement"%>
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color:white">
                    <h3><%=request.getParameter("name")%></h3>
                    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#messageModal">
                        Nuevo mensaje
                    </button>
                    <%
                        for (ForumPost post : ForumManagement.getPosts(Integer.parseInt(request.getParameter("threadid")))) {
                    %>
                    <hr>
                    <div class="float-right">
                        <%if (post.getUser_id() == user.id()) {%>
                        <form action="DeletePostServlet">
                            <input type="hidden" name="postid" value="<%=post.getPost_id()%>">
                            <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                        </form>
                        <%
                    }%>
                    </div>
                    <h5><%=UserManagement.getUserNick(post.getUser_id())%> - <%= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(post.getDate())%></h5>

                    <p><%= post.getBody()%></p>

                    <%
                }%>
                    <hr>
                    <a href="Forum-v2.jsp">Volver</a>
                </div>            

                <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="postModalLongTitle">Nuevo mensaje</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="CreatePostServlet" onsubmit="return validatePost(this)">
                                    <input type="hidden" name="threadid" value="<%=request.getParameter("threadid")%>">
                                    <input type="hidden" name="threadtitle" value="<%=request.getParameter("name")%>">
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
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>


    <jsp:include page="footer-v2.jsp" />

    <script>
                        if (form.elements[0].value === "") {
                        alert("Introduce el contenido del mensaje");
                        return false;
                        }

                        if (form.elements[0].value.length > 255) {
                        alert("Máximo 255 caracteres, has introducido " + form.elements[0].value.length);
                        return false;
                        }

                        return true;
                        }
    </script>    

</body>
</html>