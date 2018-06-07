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
                $('#image-map-pro-container').imageMapPro({"id": 9965, "editor": {"selected_shape": "spot-9446", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 683, "naturalWidth": 1476, "naturalHeight": 683}, "image": {"url": "Images/10.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 38.147, "y": 93.066, "actions": {"click": "follow-link", "link": "Escaleras-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-9446", "title": "spot-9446", "x": 12.329, "y": 84.696, "actions": {"click": "follow-link", "link": "Sala-3.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-up", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-549", "title": "spot-9446 Copy", "x": 86.087, "y": 86.329, "actions": {"click": "follow-link", "link": "Estatua.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-up", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>