<%@page import="db.UserManagement"%>
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



    <% if (!UserManagement.isUnlocked(user.id(), "coolbooks.jpg")) {%>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 9632, "editor": {"selected_shape": "rect-4734", "tool": "select"}, "general": {"name": "Untitled", "width": 860, "height": 496, "naturalWidth": 860, "naturalHeight": 496}, "image": {"url": "Images/4.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 23.893, "y": 90.521, "actions": {"click": "follow-link", "link": "Sala-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-7841", "title": "spot-7841", "x": 13.377, "y": 53.402, "actions": {"click": "follow-link", "link": "Escaleras-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-left", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-4734", "title": "rect-4734", "type": "poly", "x": 2.81, "y": 14.046, "width": 4.651, "height": 33.064, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-537181", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Nueva imagen de perfil"}}}]}}, {"id": "sq-container-777491", "settings": {"elements": [{"settings": {"name": "Image", "iconClass": "fa fa-camera"}, "options": {"image": {"url": "https://c1.staticflickr.com/9/8078/8314929977_28fd740070_b.jpg"}}}]}}, {"id": "sq-container-288221", "settings": {"elements": [{"settings": {"name": "Button", "iconClass": "fa fa-link"}, "options": {"button": {"text": "Recoger", "link_to": "AddItemServlet", "display": "block"}, "general": {"id": "loot-button"}}}]}}]}}, "points": [{"x": 4.999999999999998, "y": 0}, {"x": 92.506, "y": 2.438553238900169}, {"x": 100, "y": 87.19503450267464}, {"x": 0, "y": 100}]}]});
            });
        })(jQuery, window, document);
    </script>
    <%} else {%>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 256, "editor": {"tool": "select"}, "general": {"name": "Untitled", "width": 860, "height": 496, "naturalWidth": 860, "naturalHeight": 496}, "image": {"url": "Images/4.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 23.893, "y": 90.521, "actions": {"click": "follow-link", "link": "Sala-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-7841", "title": "spot-7841", "x": 13.377, "y": 53.402, "actions": {"click": "follow-link", "link": "Escaleras-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-left", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}]});
            });
        })(jQuery, window, document);
    </script>
    <%}%>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>