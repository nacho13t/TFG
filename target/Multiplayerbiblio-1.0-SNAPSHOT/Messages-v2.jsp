<%@page import="com.mycompany.multiplayerbiblio.Message"%>
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
                <div class="container" style="color:white;">
                    <div class="row p-3">
                        <button id="buttonSend" type="button" class="btn btn-outline-primary" onclick="displaySend()">Nuevo mensaje</button>
                    </div>
                    <div class="row p-3 w-50" style="display: none" id="sendDiv">
                        <div class="container" id="sendItemDiv">
                            <form action="SendMessageServlet" onsubmit="return validateMessage(this)">
                                <div class="form-group">
                                    <label for="target">Destinatario</label>
                                    <input type="text" class="form-control" id="target" name="target" aria-describedby="targetHelp">
                                    <small id="target" class="form-text text-muted">Usuario destino.</small>
                                </div>
                                <div class="form-group">
                                    <label for="targetMessageLabel">Mensaje para el destinatario.</label>
                                    <textarea class="form-control" id="targetMessage" name="message" rows="3"></textarea>
                                </div>

                                <input type="hidden" name="origin" value="<%=user.username()%>">

                                <button type="submit" class="btn btn-primary">Enviar</button>

                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm mt-2">
                            <h4>Recibidos</h4>
                            <div id="accordion">
                                <% for (Message message : UserManagement.getRecievedMessages(user)) {%>

                                <div class="card">
                                    <div class="card-header" id="heading<%=message.getId()%>" style="background-color: #444444"> 
                                        <h5 class="mb-0">
                                            <button style="color:white;" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse<%=message.getId()%>" aria-expanded="false" aria-controls="collapse<%=message.getId()%>">
                                                De: <%=message.getOrigin()%> Fecha: <%=message.getDate()%>
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapse<%=message.getId()%>" class="collapse" aria-labelledby="heading<%=message.getId()%>" data-parent="#accordion">
                                        <div class="card-body" style="color:black">
                                            <%=message.getContent()%>
                                        </div>
                                    </div>
                                </div>
                                <%}%> 
                            </div>
                        </div>
                        <div class="col-sm mt-2">
                            <h4>Enviados</h4>
                            <div id="accordion2">
                                <% for (Message msg : UserManagement.getSentMessages(user)) {%>
                                <div class="card">
                                    <div class="card-header" id="heading<%=msg.getId()%>" style="background-color: #444444">
                                        <h5 class="mb-0">
                                            <button style="color:white;" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse<%=msg.getId()%>" aria-expanded="false" aria-controls="collapse<%=msg.getId()%>">
                                                Para: <%=msg.getTarget()%> Fecha: <%=msg.getDate()%>
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapse<%=msg.getId()%>" class="collapse" aria-labelledby="heading<%=msg.getId()%>" data-parent="#accordion2">
                                        <div class="card-body" style="color:black">
                                            <%=msg.getContent()%>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
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
                    <a href="Medallas-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Medallas</a>
                    <% if (user.level() >= 4) { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
                    <% } else { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro</a>
                    <%}%>
                </div> 
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>

    <jsp:include page="footer-v2.jsp" />

    <script>
                function displaySend() {
                    jQuery('#sendDiv').toggle();
                    if ($('#buttonSend').text() === "Nuevo mensaje") {
                        $('#buttonSend').text("Cancelar");
                    } else if ($('#buttonSend').text() === "Cancelar") {
                        $('#buttonSend').text("Nuevo mensaje");
                    }
                }

                function validateMessage(form) {
                    if (form.elements[0].value === "") {
                        alert("Introduce un nombre de usuario");
                        return false;
                    }

                    if (form.elements[1].value === "") {
                        alert("Escribe algo en el mensaje");
                        return false;
                    }

                    return true;
                }
    </script>

</body>
</html>