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


    
    <% if (user.getCompletedTasks()[2]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":9298,"editor":{"selected_shape":"spot-3791"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/14.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-5482","title":"spot-5482","x":44.079,"y":99.076,"actions":{"click":"follow-link","link":"Sala-3.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-3791","title":"spot-3791","x":69.781,"y":63.877,"actions":{"click":"follow-link","link":"Pasillo-superior-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-right","icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}}]});
    });
        })(jQuery, window, document);
    </script>
    <%} else { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":3274,"editor":{"selected_shape":"rect-5317","tool":"select"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/14.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-5482","title":"spot-5482","x":44.079,"y":92.273,"actions":{"click":"follow-link","link":"Sala-3.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-3791","title":"spot-3791","x":69.997,"y":63.553,"actions":{"link":"Pasillo-superior-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"lock","icon_fill":"#ffffff","icon_is_pin":0},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"plain_text":"Bloqueado.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-5317","title":"rect-5317","type":"poly","x":91.595,"y":73.038,"width":6.587,"height":6.965,"actions":{"click":"run-script","script":"$('#modal-trigger-button').click();"},"default_style":{"fill":"#8000ff","fill_opacity":0.5916875394663417},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-646381","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Prueba de acceso al último piso."}}}]}},{"id":"sq-container-779981","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}}]}},"points":[{"x":0,"y":4.764589498012742},{"x":0.0002448609802214293,"y":100},{"x":100,"y":92.90949521124776},{"x":100,"y":0}]}]});
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
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta para acceder al último piso</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        ¿Cuál la signatura topográfica de este libro "Construye tu robot: guía para principiantes"?
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Escaleras-2.jsp">
                            <input type="hidden" name="correct_answer" value="BIG 007.52 BAI con">
                            <input type="hidden" name="task_number" value="3">
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