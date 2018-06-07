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
                $('#image-map-pro-container').imageMapPro({"id": 256, "editor": {"tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 984, "naturalWidth": 1476, "naturalHeight": 984}, "image": {"url": "Images/5.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-9527", "title": "spot-9527", "x": 18.817, "y": 95.867, "actions": {"click": "follow-link", "link": "Sala-2.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_fill": "#ffffff"}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-1913", "title": "rect-1913", "type": "poly", "x": 45.698, "y": 20.626, "width": 19.006, "height": 68.035, "actions": {"click": "follow-link", "link": "Pasillo-superior-1.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#8000ff", "fill_opacity": 0.19689849624060152}, "tooltip_content": {"plain_text": "Subir", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 1.7045454545454541, "y": 0}, {"x": 100, "y": 0.9523809523809524}, {"x": 95.45454545454545, "y": 98.57142857142858}, {"x": 0, "y": 100}]}, {"id": "spot-6585", "title": "spot-6585", "x": 76.908, "y": 26.944, "default_style": {"icon_fontawesome_id": "info-circle", "icon_fill": "#ff0000", "icon_is_pin": 0}, "tooltip_style": {"position": "bottom", "auto_width": 0}, "tooltip_content": {"plain_text": "Antes de avanzar hasta otra sala, asegúrate de que has explorado la anterior completamente.", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-522", "title": "rect-522", "type": "poly", "x": 17.837, "y": 61.285, "width": 5.508, "height": 7.775, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-908341", "settings": {"elements": [{"settings": {"name": "YouTube", "iconClass": "fa fa-youtube"}, "options": {"youtube": {"embed_code": "<iframe id=\"iframe_container\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\" allow=\"autoplay; fullscreen\" width=\"550\" height=\"400\" src=\"https://prezi.com/embed/yi8vxy80f27g/?bgcolor=ffffff&amp;lock_to_path=0&amp;autoplay=0&amp;autohide_ctrls=0&amp;landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE1vbktFKzVyWDBhSmhHVzdYN0tDNzFpYUF1Tk1OU3FMY1lFMVlQa3lCYz0&amp;landing_sign=6v4VFrcp2RY64J3LAvs_vnj0_CwtgCNiv7Ta2nzjfwI\"></iframe>", "iframe_width": 400}}}]}}]}}, "points": [{"x": 0, "y": 0}, {"x": 100, "y": 0}, {"x": 80.39190465284814, "y": 100}, {"x": 0.00031372450598305844, "y": 97.91552431888294}]}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>