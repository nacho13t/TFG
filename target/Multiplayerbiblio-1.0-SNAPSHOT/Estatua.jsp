<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div id="image-map-pro-container" class="mb-2"></div>
                <jsp:include page="Reviews-Caroussel.jsp" />
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>



    <% if (user.getCompletedTasks()[1]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 256, "editor": {"previewMode": 1, "selected_shape": "rect-3451", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 1078, "naturalWidth": 1476, "naturalHeight": 1078}, "image": {"url": "Images/11.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-5482", "title": "spot-5482", "x": 87.168, "y": 73.46, "actions": {"click": "follow-link", "link": "Pasillo-superior-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-right"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-3451", "title": "rect-3451", "type": "poly", "x": 52.178, "y": 37.826, "width": 6.587, "height": 12.568, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "width": 390}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-283211", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe src=\"https://bustreaming.ulpgc.es/bustreaming/reproducirEmbed.php?idpublicacion=32535\" allowfullscreen style=\"width:100%;height:440px;border-style: none;border: 0px;\"></iframe>", "iframe_width": 450, "iframe_height": 250}}}]}}]}}, "points": [{"x": 0, "y": 78.82352941176471}, {"x": 73.77049180327872, "y": 100}, {"x": 100, "y": 51.76470588235295}, {"x": 88.52459016393443, "y": 49.411764705882355}, {"x": 96.72131147540985, "y": 15.294117647058824}, {"x": 50.819672131147584, "y": 0}]}]});
            });
        })(jQuery, window, document);
    </script>
    <%} else { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 7314, "editor": {"selected_shape": "rect-5313", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 1078, "naturalWidth": 1476, "naturalHeight": 1078}, "image": {"url": "Images/11.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-5482", "title": "spot-5482", "x": 87.168, "y": 73.46, "actions": {"click": "follow-link", "link": "Pasillo-superior-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-right"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-3451", "title": "rect-3451", "type": "poly", "x": 52.178, "y": 37.826, "width": 6.587, "height": 12.568, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "width": 390}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-283211", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe src=\"https://bustreaming.ulpgc.es/bustreaming/reproducirEmbed.php?idpublicacion=32535\" allowfullscreen style=\"width:100%;height:440px;border-style: none;border: 0px;\"></iframe>", "iframe_width": 450, "iframe_height": 250}}}]}}]}}, "points": [{"x": 0, "y": 78.82352941176471}, {"x": 73.77049180327872, "y": 100}, {"x": 100, "y": 51.76470588235295}, {"x": 88.52459016393443, "y": 49.411764705882355}, {"x": 96.72131147540985, "y": 15.294117647058824}, {"x": 50.819672131147584, "y": 0}]}, {"id": "rect-5313", "title": "rect-5313", "type": "poly", "x": 16.865, "y": 37.612, "width": 23.11, "height": 15.082, "actions": {"click": "run-script", "script": "$('#modal-trigger-button').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-716491", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Pregunta sobre el acceso remoto.\nRecompensa: 30 puntos de experiencia."}}}]}}, {"id": "sq-container-7601", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "Images/open-leaf-book.jpg"}}}]}}]}}, "points": [{"x": 1.4017954405947168, "y": 48.03833665542216}, {"x": 100, "y": 0}, {"x": 99.53270993099808, "y": 57.84207882999809}, {"x": 0, "y": 100}]}]});
            });
        })(jQuery, window, document);
    </script>
    <%}%>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="modal-trigger-button">
        Launch demo modal
    </button>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta sobre el acceso remoto.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        Después de identificarte con tu usuario y contraseña, qué dirección debe aparecer para saber que has accedido correctamente:
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Estatua.jsp">
                            <input type="hidden" name="correct_answer" value="biblioteca.ulpgc.es.bibproxy.ulpgc.es">
                            <input type="hidden" name="task_number" value="2">
                            <button type="submit" class="btn btn-primary mt-1">Enviar</button>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>