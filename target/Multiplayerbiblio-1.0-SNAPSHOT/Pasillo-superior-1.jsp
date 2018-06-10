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
                $('#image-map-pro-container').imageMapPro({"id": 5820, "editor": {"selected_shape": "rect-8897", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 683, "naturalWidth": 1476, "naturalHeight": 683}, "image": {"url": "Images/10.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 38.147, "y": 93.066, "actions": {"click": "follow-link", "link": "Escaleras-1.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-9446", "title": "spot-9446", "x": 12.329, "y": 84.696, "actions": {"click": "follow-link", "link": "Sala-3.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-up", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "spot-549", "title": "spot-9446 Copy", "x": 86.087, "y": 86.329, "actions": {"click": "follow-link", "link": "Estatua.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-up", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-8897", "title": "rect-8897", "type": "poly", "x": 37.167, "y": 20.751, "width": 11.447, "height": 21.937, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-518251", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe id=\"iframe_container\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\" allow=\"autoplay; fullscreen\" width=\"550\" height=\"400\" src=\"https://prezi.com/embed/yi8vxy80f27g/?bgcolor=ffffff&amp;lock_to_path=0&amp;autoplay=0&amp;autohide_ctrls=0&amp;landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE1vbktFKzVyWDBhSmhHVzdYN0xFVlpRZ0piWEtFYWsvOWdOR3V3ZVNBMD0&amp;landing_sign=KhCSETLUleXNTLz3m0JsRV_tINR3pS-JT4JMMQ6D-SY\"></iframe>"}}}]}}]}}, "points": [{"x": 0.9433940904284746, "y": 1.0609997232586976}, {"x": 0, "y": 100}, {"x": 100, "y": 84.04228027565284}, {"x": 99.05645496651711, "y": 0}]}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>