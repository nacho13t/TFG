<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div id="image-map-pro-container" class="pt-4 pl-1 pb-4"></div>
                <jsp:include page="Reviews-Caroussel.jsp" />
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>

    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 4524, "editor": {"selected_shape": "spot-6656", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 984, "naturalWidth": 1476, "naturalHeight": 984}, "image": {"url": "Images/2.JPG"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-1888", "title": "spot-1888", "x": 37.923, "y": 34.557, "actions": {"click": "follow-link", "link": "Sala-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-up", "icon_fill": "#ffffff", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-7709", "title": "spot-7709", "x": 46.994, "y": 87.689, "actions": {"click": "follow-link", "link": "Entrada.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-1332", "title": "rect-1332", "type": "poly", "x": 64.489, "y": 39.579, "width": 23.434, "height": 58.963, "default_style": {"fill": "#8000ff", "fill_opacity": 0.36612362969190554}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-115911", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Conoce la web de la biblioteca"}, "font": {"font_size": "16", "text_align": "center"}}}]}}, {"id": "sq-container-710931", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe width=\"779\" height=\"438\" src=\"https://www.youtube.com/embed/OPbUZePOwVw?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe></iframe>"}}}]}}]}}, "points": [{"x": 8.294930875576037, "y": 0}, {"x": 100, "y": 5.769230769230777}, {"x": 86.17511520737328, "y": 100}, {"x": 0, "y": 83.24175824175825}]}, {"id": "spot-6656", "title": "spot-6656", "x": 81.444, "y": 23.866, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom"}, "tooltip_content": {"plain_text": "Algunos elementos en la biblioteca contienen informaci�n �til. Revisa todos los que encuentres.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>