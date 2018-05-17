<%@page import="java.util.List"%>
<%@page import="com.mycompany.multiplayerbiblio.Message"%>
<%@page import="db.UserManagement"%>
<%@page import="inventory.InventoryItem"%>
<%@page import="com.mycompany.multiplayerbiblio.LevelUnlocks"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">

    <jsp:include page="header.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>

        <div class="container">
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
                            <div class="card-header" id="heading<%=message.getId()%>">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse<%=message.getId()%>" aria-expanded="false" aria-controls="collapse<%=message.getId()%>">
                                        De: <%=message.getOrigin()%> Fecha: <%=message.getDate()%>
                                    </button>
                                </h5>
                            </div>

                            <div id="collapse<%=message.getId()%>" class="collapse" aria-labelledby="heading<%=message.getId()%>" data-parent="#accordion">
                                <div class="card-body">
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
                            <div class="card-header" id="heading<%=msg.getId()%>">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse<%=msg.getId()%>" aria-expanded="false" aria-controls="collapse<%=msg.getId()%>">
                                        Para: <%=msg.getTarget()%> Fecha: <%=msg.getDate()%>
                                    </button>
                                </h5>
                            </div>

                            <div id="collapse<%=msg.getId()%>" class="collapse" aria-labelledby="heading<%=msg.getId()%>" data-parent="#accordion2">
                                <div class="card-body">
                                    <%=msg.getContent()%>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>

   <jsp:include page="footer.jsp" />
   
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


</html>