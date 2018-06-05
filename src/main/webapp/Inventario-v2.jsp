<%@page import="inventory.InventoryItem"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container">
                    <h5 style="color: white;">Consigue objetos abriendo cajas de recompensa.</h5>
                    <div class="d-flex flex-wrap justify-content-center mt-2" id="inventoryItems">
                        <%
                            for (InventoryItem item : user.inventory().getItems()) {%>
                        <%
                            String tipo = "";
                            if (item.type().equals("LootBox")) {
                                tipo = "Caja de recompensa";
                            } else if (item.type().equals("Joker")) {
                                tipo = "Comodín";
                            } else if (item.type().equals("Image")) {
                                tipo = "Ficha de imagen";
                            } else {
                                tipo = "Ficha de experiencia";
                            }
                        %>
                        <div class="p-2" style="text-align: center">
                            <img src="Images/<%=item.image()%>" id="img<%=item.id()%>" onclick="displayOpenBoxButton(<%=item.id()%>)" class="img-responsive inventoryImageContainer rounded-circle p-2" alt="Item" data-toggle="tooltip" data-placement="top" data-html="true" title="<h5><%=tipo%></h5><p><%=item.description()%></p>">
                            <div class="itemsActions" id="itemsActions<%=item.id()%>" style="display: none">
                                <form style="text-align: center" action="OpenItemServlet" onsubmit="return checkJoker(<%=item.id()%>)">
                                    <button style="color: white;" type="submit" id="btn<%=item.id()%>" class="btn btn-outline-secondary btn-sm <%if (item.type().equals("Joker")) {
                                            out.write("disabled");
                                        }%>">Abrir</button>
                                    <input type="hidden" name="item" value="<%=item.id()%>">
                                </form>
                                <%if (item.type().equals("Joker")) {%>
                                <form style="text-align: center" action="ChangeForExperienceServlet" class="mt-2">
                                    <button style="color: white;" type="submit" id="btn<%=item.id()%>" class="btn btn-outline-secondary btn-sm">Cambiar por experiencia</button>
                                    <input type="hidden" name="item" value="<%=item.id()%>">
                                </form>       
                                <%}%>
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
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>
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

        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>
</html>