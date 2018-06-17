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



    <% if (user.getCompletedTasks()[5]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":3274,"editor":{"selected_shape":"rect-7946","tool":"poly"},"general":{"name":"Untitled","width":1116,"height":647,"naturalWidth":1116,"naturalHeight":647},"image":{"url":"Images/166.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-5482","title":"spot-5482","x":19.997,"y":94.184,"actions":{"click":"follow-link","link":"Pasillo-superior-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_is_pin":0},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-1778","title":"rect-1778","type":"poly","x":75.072,"y":38.308,"width":10.907,"height":9.127,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-689381","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/oOq3xpXIB00?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":1.9801980198019802,"y":0},{"x":0,"y":79.59183673469387},{"x":100,"y":100},{"x":100,"y":2.0408163265306123}]},{"id":"rect-3010","title":"rect-3010","type":"poly","x":59.953,"y":37.376,"width":6.479,"height":6.892,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-183861","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/aq-MQYTtYdM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":0,"y":0},{"x":0,"y":86.48648648648648},{"x":100,"y":100},{"x":96.66666666666667,"y":8.108108108108109}]},{"id":"rect-6362","title":"rect-6362","type":"poly","x":87.167,"y":31.788,"width":7.991,"height":4.471,"actions":{"script":"$('#modal-trigger-button1').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-967441","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre el catálogo"}}}]}},{"id":"sq-container-336881","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-815281","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta contestada."}}}]}}]}},"points":[{"x":0,"y":0},{"x":6.757289992119005,"y":99.99390364658106},{"x":100,"y":100},{"x":98.64854200157616,"y":0}]},{"id":"rect-7946","title":"rect-7946","type":"poly","x":12.113,"y":31.974,"width":5.724,"height":6.892,"actions":{"script":"$('#modal-trigger-button2').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-638101","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre libros electrónicos."}}}]}},{"id":"sq-container-84021","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-413061","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta contestada."}}}]}}]}},"points":[{"x":7.547169811320755,"y":0},{"x":0,"y":100},{"x":100,"y":94.5945945945946},{"x":100,"y":2.7027027027027026}]},{"id":"rect-6011","title":"rect-6011","type":"poly","x":30.688,"y":32.161,"width":5.508,"height":6.333,"actions":{"script":"$('#modal-trigger-button3').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-262601","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre revistas electrónicas."}}}]}},{"id":"sq-container-568081","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-836621","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta contestada."}}}]}}]}},"points":[{"x":0,"y":0},{"x":3.9215686274509802,"y":100},{"x":96.07843137254902,"y":94.11764705882352},{"x":100,"y":0}]}]});
    });
        })(jQuery, window, document);
    </script>
    <%} else if (user.getCompletedTasks()[4]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":3274,"editor":{"selected_shape":"rect-7946","tool":"poly"},"general":{"name":"Untitled","width":1116,"height":647,"naturalWidth":1116,"naturalHeight":647},"image":{"url":"Images/166.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-5482","title":"spot-5482","x":19.997,"y":94.184,"actions":{"click":"follow-link","link":"Pasillo-superior-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_is_pin":0},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-1778","title":"rect-1778","type":"poly","x":75.072,"y":38.308,"width":10.907,"height":9.127,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-689381","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/oOq3xpXIB00?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":1.9801980198019802,"y":0},{"x":0,"y":79.59183673469387},{"x":100,"y":100},{"x":100,"y":2.0408163265306123}]},{"id":"rect-3010","title":"rect-3010","type":"poly","x":59.953,"y":37.376,"width":6.479,"height":6.892,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-183861","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/aq-MQYTtYdM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":0,"y":0},{"x":0,"y":86.48648648648648},{"x":100,"y":100},{"x":96.66666666666667,"y":8.108108108108109}]},{"id":"rect-6362","title":"rect-6362","type":"poly","x":87.167,"y":31.788,"width":7.991,"height":4.471,"actions":{"script":"$('#modal-trigger-button1').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-967441","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre el catálogo"}}}]}},{"id":"sq-container-336881","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-815281","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta contestada."}}}]}}]}},"points":[{"x":0,"y":0},{"x":6.757289992119005,"y":99.99390364658106},{"x":100,"y":100},{"x":98.64854200157616,"y":0}]},{"id":"rect-7946","title":"rect-7946","type":"poly","x":12.113,"y":31.974,"width":5.724,"height":6.892,"actions":{"script":"$('#modal-trigger-button2').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-638101","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre libros electrónicos."}}}]}},{"id":"sq-container-84021","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-413061","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta contestada."}}}]}}]}},"points":[{"x":7.547169811320755,"y":0},{"x":0,"y":100},{"x":100,"y":94.5945945945946},{"x":100,"y":2.7027027027027026}]},{"id":"rect-6011","title":"rect-6011","type":"poly","x":30.688,"y":32.161,"width":5.508,"height":6.333,"actions":{"click":"run-script","script":"$('#modal-trigger-button3').click();"},"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-388091","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Pregunta sobre revistas electrónicas."}}}]}},{"id":"sq-container-337801","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}}]}},"points":[{"x":0,"y":0},{"x":3.9215686274509802,"y":100},{"x":96.07843137254902,"y":94.11764705882352},{"x":100,"y":0}]}]});
    });
        })(jQuery, window, document);
    </script>
    <%} else if (user.getCompletedTasks()[3]) { %>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 3274, "editor": {"selected_shape": "rect-7946", "tool": "poly"}, "general": {"name": "Untitled", "width": 1116, "height": 647, "naturalWidth": 1116, "naturalHeight": 647}, "image": {"url": "Images/166.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-5482", "title": "spot-5482", "x": 19.997, "y": 94.184, "actions": {"click": "follow-link", "link": "Pasillo-superior-2.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-1778", "title": "rect-1778", "type": "poly", "x": 75.072, "y": 38.308, "width": 10.907, "height": 9.127, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-689381", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/oOq3xpXIB00?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}}, "points": [{"x": 1.9801980198019802, "y": 0}, {"x": 0, "y": 79.59183673469387}, {"x": 100, "y": 100}, {"x": 100, "y": 2.0408163265306123}]}, {"id": "rect-3010", "title": "rect-3010", "type": "poly", "x": 59.953, "y": 37.376, "width": 6.479, "height": 6.892, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-183861", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/aq-MQYTtYdM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 0, "y": 86.48648648648648}, {"x": 100, "y": 100}, {"x": 96.66666666666667, "y": 8.108108108108109}]}, {"id": "rect-6362", "title": "rect-6362", "type": "poly", "x": 87.167, "y": 31.788, "width": 7.991, "height": 4.471, "actions": {"script": "$('#modal-trigger-button1').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-967441", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Pregunta sobre el catálogo"}}}]}}, {"id": "sq-container-336881", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "Images/open-leaf-book.jpg"}}}]}}, {"id": "sq-container-815281", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Pregunta contestada."}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 6.757289992119005, "y": 99.99390364658106}, {"x": 100, "y": 100}, {"x": 98.64854200157616, "y": 0}]}, {"id": "rect-7946", "title": "rect-7946", "type": "poly", "x": 12.113, "y": 31.974, "width": 5.724, "height": 6.892, "actions": {"click": "run-script", "script": "$('#modal-trigger-button2').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-545401", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Pregunta sobre libros electrónicos."}}}]}}, {"id": "sq-container-68351", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "Images/open-leaf-book.jpg"}}}]}}]}}, "points": [{"x": 7.547169811320755, "y": 0}, {"x": 0, "y": 100}, {"x": 100, "y": 94.5945945945946}, {"x": 100, "y": 2.7027027027027026}]}]});
            });
        })(jQuery, window, document);
    </script>
    <%} else {%>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 7314, "editor": {"selected_shape": "rect-6362", "tool": "select"}, "general": {"name": "Untitled", "width": 1116, "height": 647, "naturalWidth": 1116, "naturalHeight": 647}, "image": {"url": "Images/166.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-5482", "title": "spot-5482", "x": 19.997, "y": 94.184, "actions": {"click": "follow-link", "link": "Pasillo-superior-2.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-1778", "title": "rect-1778", "type": "poly", "x": 75.072, "y": 38.308, "width": 10.907, "height": 9.127, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-689381", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/oOq3xpXIB00?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}}, "points": [{"x": 1.9801980198019802, "y": 0}, {"x": 0, "y": 79.59183673469387}, {"x": 100, "y": 100}, {"x": 100, "y": 2.0408163265306123}]}, {"id": "rect-3010", "title": "rect-3010", "type": "poly", "x": 59.953, "y": 37.376, "width": 6.479, "height": 6.892, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-183861", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"780\" height=\"439\" src=\"https://www.youtube.com/embed/aq-MQYTtYdM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 0, "y": 86.48648648648648}, {"x": 100, "y": 100}, {"x": 96.66666666666667, "y": 8.108108108108109}]}, {"id": "rect-6362", "title": "rect-6362", "type": "poly", "x": 87.167, "y": 31.788, "width": 7.991, "height": 4.471, "actions": {"click": "run-script", "script": "$('#modal-trigger-button1').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-313391", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Pregunta sobre el catálogo"}}}]}}, {"id": "sq-container-84291", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "Images/open-leaf-book.jpg"}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 6.757289992119005, "y": 99.99390364658106}, {"x": 100, "y": 100}, {"x": 98.64854200157616, "y": 0}]}]});
            });
        })(jQuery, window, document);
    </script>
    <%}%>

    <button style="visibility: hidden" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" id="modal-trigger-button1">
        Launch demo modal
    </button>

    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta sobre el catálogo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        ¿Cuál el primer número que tenemos de la revista English now?
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Sala-5.jsp">
                            <input type="hidden" name="correct_answer" value="84">
                            <input type="hidden" name="task_number" value="4">
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

    <button style="visibility: hidden" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" id="modal-trigger-button2">
        Launch demo modal
    </button>

    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta sobre los libros electrónicos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        ¿Cuántos libros tenemos en el portal e-BULibros de Alexis Ravelo? 
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Sala-5.jsp">
                            <input type="hidden" name="correct_answer" value="2">
                            <input type="hidden" name="task_number" value="5">
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

    <button style="visibility: hidden" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal3" id="modal-trigger-button3">
        Launch demo modal
    </button>

    <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta sobre revistas electrónicos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        ¿Cuál es el ISSN de la revista ?Canadian journal of music therapy??
                    </p>

                    <form action="TaskServlet" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="answer">Tu respuesta:</label>
                            <input type="text" class="form-control" name="answer" id="answer" aria-describedby="ans">
                            <input type="hidden" name="place" value="Sala-5.jsp">
                            <input type="hidden" name="correct_answer" value="1199-1054">
                            <input type="hidden" name="task_number" value="6">
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