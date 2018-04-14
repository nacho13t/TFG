<%@page import="inventory.InventoryItem"%>
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
                <div class="container">

                    <h5 style="color: white;">Consigue objetos abriendo cajas de recompensa.</h5>
                    <div class="d-flex flex-wrap justify-content-center mt-2" id="inventoryItems">
                        <%
            for (InventoryItem item : user.inventory().getItems()) {%>
                        <div class="p-2">
                            <img src="Images/<%=item.image()%>" id="img<%=item.id()%>" onclick="displayOpenBoxButton(<%=item.id()%>)" class="img-responsive inventoryImageContainer rounded-circle p-2" alt="Item" title="<%=item.description()%>">
                            <div class="itemsActions" id="itemsActions<%=item.id()%>" style="display: none">
                                <form style="text-align: center" action="OpenItemServlet" onsubmit="return checkJoker(<%=item.id()%>)">
                                    <button style="color: white;" type="submit" id="btn<%=item.id()%>" class="btn btn-outline-secondary btn-sm <%if (item.type().equals("Joker")) {
                                            out.write("disabled");
                                        }%>">Abrir</button>
                                    <input type="hidden" name="item" value="<%=item.id()%>">
                                </form>
                                <div style="text-align: center" class="p-2">
                                    <button style="color: white;" id="btnSend<%=item.id()%>" onclick="displaySendDiv(<%=item.id()%>)" class="btn btn-outline-secondary btn-sm mb-2">Enviar</button>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <div class="container" id="sendItemDiv" style="display: none">
                        <form action="SendItemServlet" style="color: white">
                            <div class="form-group">
                                <label for="itemTarget">Destinatario</label>
                                <input type="text" class="form-control" id="target" name="target" aria-describedby="targetHelp">
                                <small id="targetHelp" class="form-text text-muted">El objeto será transferido al usuario especificado.</small>
                            </div>
                            <div class="form-group">
                                <label for="targetMessageLabel">Mensaje para el destinatario.</label>
                                <textarea class="form-control" id="targetMessage" name="message" rows="3"></textarea>
                            </div>
                            <input type="hidden" name="idItem" value="">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                            <button type="button" class="btn btn-danger" onclick="cancelSend()">Cancelar</button>
                        </form>
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
                    <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Medallas</a>
                    <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
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
                function displayOpenBoxButton(id) {
                    jQuery('.itemsActions').hide();
                    jQuery('#sendItemDiv').hide();
                    jQuery('#itemsActions' + id).show();
                }

                function displaySendDiv(id) {
                    $('input[name="idItem"]').val(id);
                    jQuery('#sendItemDiv').toggle();

                }

                function cancelSend() {
                    $('input[name="idItem"]').val("");
                    jQuery('#sendItemDiv').toggle();
                }

                function checkJoker(id) {
                    if (document.getElementById("btn" + id).classList.contains('disabled'))
                        return false;
                    return true;
                }
    </script>

</body>
</html>