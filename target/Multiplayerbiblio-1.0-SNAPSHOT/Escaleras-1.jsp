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

    <% if (user.getCompletedTasks()[0]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":5820,"editor":{"tool":"select"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/5.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-9527","title":"spot-9527","x":17.845,"y":91.979,"actions":{"click":"follow-link","link":"Sala-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-1913","title":"rect-1913","type":"poly","x":45.698,"y":20.626,"width":19.006,"height":68.035,"actions":{"click":"follow-link","link":"Pasillo-superior-1.jsp","open_link_in_new_window":0},"default_style":{"fill":"#8000ff","fill_opacity":0.19689849624060152},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"plain_text":"Subir","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}},"points":[{"x":1.7045454545454541,"y":0},{"x":100,"y":0.9523809523809524},{"x":95.45454545454545,"y":98.57142857142858},{"x":0,"y":100}]},{"id":"rect-522","title":"rect-522","type":"poly","x":17.837,"y":61.285,"width":5.508,"height":7.775,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-38791","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"779\" height=\"438\" src=\"https://www.youtube.com/embed/voLTcYXkZhQ?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>","iframe_width":400}}}]}}]}},"points":[{"x":0,"y":0},{"x":100,"y":0},{"x":80.39190465284814,"y":100},{"x":0.00031372450598305844,"y":97.91552431888294}]}]});
    });
        })(jQuery, window, document);
    </script>
    <%} else { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 5820, "editor": {"selected_shape": "rect-4800", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 984, "naturalWidth": 1476, "naturalHeight": 984}, "image": {"url": "Images/5.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 17.845, "y": 91.979, "actions": {"click": "follow-link", "link": "Sala-2.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-1913", "title": "rect-1913", "type": "poly", "x": 45.698, "y": 20.626, "width": 19.006, "height": 68.035, "actions": {"link": "Pasillo-superior-1.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#8000ff", "fill_opacity": 0.19689849624060152}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"plain_text": "Bloqueado", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 1.7045454545454541, "y": 0}, {"x": 100, "y": 0.9523809523809524}, {"x": 95.45454545454545, "y": 98.57142857142858}, {"x": 0, "y": 100}]}, {"id": "spot-6585", "title": "spot-6585", "x": 76.692, "y": 54.644, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom", "auto_width": 0}, "tooltip_content": {"plain_text": "Asegúrate de revisar todas las salas completamente.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-522", "title": "rect-522", "type": "poly", "x": 17.837, "y": 61.285, "width": 5.508, "height": 7.775, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-38791", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"779\" height=\"438\" src=\"https://www.youtube.com/embed/voLTcYXkZhQ?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", "iframe_width": 400}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 100, "y": 0}, {"x": 80.39190465284814, "y": 100}, {"x": 0.00031372450598305844, "y": 97.91552431888294}]}, {"id": "spot-2252", "title": "spot-6585 Copy", "x": 76.908, "y": 26.944, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom", "auto_width": 0}, "tooltip_content": {"plain_text": "A veces tienes que completar ciertos objetivos antes de continuar a la siguiente sala.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-4800", "title": "rect-4800", "type": "poly", "x": 14.921, "y": 25.486, "width": 8.315, "height": 8.099, "actions": {"click": "run-script", "script": "$('#modal-trigger-button').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-172171", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Prueba de acceso al piso superior"}, "font": {"text_align": "center"}}}]}}, {"id": "sq-container-927281", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "Images/open-leaf-book.jpg"}}}]}}]}}, "points": [{"x": 3.8959959522120116, "y": 100}, {"x": 96.10390015179206, "y": 98.00017919827968}, {"x": 100, "y": 0}, {"x": 40.25980232747812, "y": 2.000620794040376}, {"x": 0, "y": 6.0004223959450105}]}]});
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
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta para acceder al piso superior</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        Si has visto este vídeo promocional podrás decirme como se llama el ciclo de charlas que se hacen en la Biblioteca de Ciencias Básicas de la ULPGC. 
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Escaleras-1.jsp">
                            <input type="hidden" name="correct_answer" value="ciencia compartida">
                            <input type="hidden" name="task_number" value="1">
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