<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div id="image-map-pro-container" class="pt-4 pl-1 pb-4"></div>
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
                $('#image-map-pro-container').imageMapPro({"id": 9965, "editor": {"previewMode": 1, "selected_shape": "rect-8576", "tool": "poly"}, "general": {"name": "Untitled", "width": 1903, "height": 1495, "naturalWidth": 1903, "naturalHeight": 1495}, "image": {"url": "Images/1.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "rect-8576", "title": "rect-8576", "type": "poly", "x": 30.148, "y": 14.764, "width": 66.415, "height": 67.769, "actions": {"click": "follow-link", "link": "Pasillo.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#ff00ff", "fill_opacity": 0.15930451127819548}, "tooltip_content": {"plain_text": "Entrar", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 0.975609756097561, "y": 99.18864097363083}, {"x": 99.83739837398375, "y": 100}, {"x": 100, "y": 0}]}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>