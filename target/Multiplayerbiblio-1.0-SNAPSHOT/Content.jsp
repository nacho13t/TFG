<%@page import="java.util.List"%>
<%@page import="com.mycompany.multiplayerbiblio.Review"%>
<%@page import="db.UserManagement"%>
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
                $('#image-map-pro-container').imageMapPro({"id": 110, "editor": {"tool": "select"}, "general": {"name": "Untitled", "width": 2048, "height": 1417, "naturalWidth": 2048, "naturalHeight": 1417}, "image": {"url": "Images/exterior.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "rect-237", "title": "rect-237", "type": "poly", "x": -0.09, "y": 21.559, "width": 87.149, "height": 62.744, "actions": {"click": "follow-link", "link": "Entrada.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#8000ff", "fill_opacity": 0.06907894736842106}, "tooltip_content": {"plain_text": "Acceder", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 3.0979429987608436, "y": 36.069137476679124}, {"x": 6.071871127633209, "y": 27.86069651741294}, {"x": 7.187112763320942, "y": 10.696517412935327}, {"x": 10.90458488228005, "y": 0.7462686567164173}, {"x": 34.572490706319705, "y": 17.661691542288565}, {"x": 48.57496902106567, "y": 0}, {"x": 100, "y": 49.50248756218906}, {"x": 98.88475836431226, "y": 49.75124378109454}, {"x": 99.62825278810409, "y": 51.49253731343284}, {"x": 99.38042131350682, "y": 84.57711442786072}, {"x": 94.17596034696406, "y": 86.318407960199}, {"x": 91.69764560099131, "y": 89.80099502487563}, {"x": 88.59970260223048, "y": 93.2831963910914}, {"x": 86.36910037174722, "y": 96.26801388564988}, {"x": 49.31848327137547, "y": 100}, {"x": 15.241635687732341, "y": 99.50248756218907}, {"x": 0, "y": 98.2587064676617}]}, {"id": "spot-2966", "title": "spot-2966", "x": 75.288, "y": 15.454, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom"}, "tooltip_content": {"plain_text": "Pulsa en la biblioteca para acercarte.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-9800", "title": "spot-9800", "x": 49.695, "y": 15.298, "actions": {"click": "follow-link", "link": "tutorial.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "question-circle", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom", "auto_width": 0}, "tooltip_content": {"plain_text": "Pulsa en este icono para acceder al tutorial.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>