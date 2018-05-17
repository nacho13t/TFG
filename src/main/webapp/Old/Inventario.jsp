<%@page import="inventory.InventoryItem"%>
<%@page import="com.mycompany.multiplayerbiblio.LevelUnlocks"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<jsp:include page="header.jsp" />

<% User user = (User) request.getSession().getAttribute("user");%>

<div class="container">

    <h5>Consigue objetos abriendo cajas de recompensa.</h5>
    <div class="d-flex flex-wrap justify-content-center" id="inventoryItems">
        <%
                    for (InventoryItem item : user.inventory().getItems()) {%>
        <div class="p-2">
            <img src="Images/<%=item.image()%>" id="img<%=item.id()%>" onclick="displayOpenBoxButton(<%=item.id()%>)" class="img-responsive inventoryImageContainer rounded-circle p-2" alt="Item" title="<%=item.description()%>">
            <div class="itemsActions" id="itemsActions<%=item.id()%>" style="display: none">
                <form style="text-align: center" action="OpenItemServlet" onsubmit="return checkJoker(<%=item.id()%>)">
                    <button type="submit" id="btn<%=item.id()%>" class="btn btn-outline-secondary btn-sm <%if (item.type().equals("Joker")) {
                            out.write("disabled");
                        }%>">Abrir</button>
                    <input type="hidden" name="item" value="<%=item.id()%>">
                </form>
                <div style="text-align: center" class="p-2">
                    <button id="btnSend<%=item.id()%>" onclick="displaySendDiv(<%=item.id()%>)" class="btn btn-outline-secondary btn-sm mb-2">Enviar</button>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

    <div class="container" id="sendItemDiv" style="display: none">
        <form action="SendItemServlet">
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

<jsp:include page="footer.jsp" />

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