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
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 110, "editor": {"selected_shape": "spot-170", "tool": "select"}, "general": {"name": "Untitled", "width": 1903, "height": 1495, "naturalWidth": 1903, "naturalHeight": 1495}, "image": {"url": "Images/1.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "rect-8576", "title": "rect-8576", "type": "poly", "x": 30.256, "y": 14.764, "width": 66.415, "height": 67.769, "actions": {"click": "follow-link", "link": "Pasillo.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#ff00ff", "fill_opacity": 0.15930451127819548}, "tooltip_content": {"plain_text": "Entrar", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 0.975609756097561, "y": 99.18864097363083}, {"x": 99.83739837398375, "y": 100}, {"x": 100, "y": 0}]}, {"id": "spot-7052", "title": "spot-7052", "x": 46.023, "y": 89.406, "actions": {"click": "follow-link", "link": "Content.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-4499", "title": "spot-4499", "x": 16.109, "y": 27.411, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_content": {"plain_text": "Los iconos con flechas te permiten moverte entre pantallas.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-170", "title": "spot-4499 Copy", "x": 84.361, "y": 88.857, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_content": {"plain_text": "Pulsa las zonas coloreadas de fucsia para interactuar con la imagen.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>