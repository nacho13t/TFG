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
                $('#image-map-pro-container').imageMapPro({"id": 3148, "editor": {"selected_shape": "spot-5482", "tool": "select"}, "general": {"name": "Untitled", "width": 1476, "height": 984, "naturalWidth": 1476, "naturalHeight": 984}, "image": {"url": "Images/13.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "spot-5482", "title": "spot-5482", "x": 77.773, "y": 80.123, "actions": {"click": "follow-link", "link": "Sala-3.jsp", "open_link_in_new_window": 0}, "default_style": {"icon_fontawesome_id": "chevron-circle-down", "icon_is_pin": 0}, "tooltip_style": {"enable_tooltip": 0}, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}}, {"id": "rect-9477", "title": "rect-9477", "type": "poly", "x": 24.964, "y": 30.993, "width": 19.222, "height": 19.438, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-354001", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Cuestionario 1"}, "font": {"text_align": "center"}}}]}}]}}, "points": [{"x": 26.96629213483145, "y": 0}, {"x": 52.80898876404494, "y": 2.4999999999999996}, {"x": 52.80898876404494, "y": 7.499999999999998}, {"x": 100, "y": 9.999999999999998}, {"x": 100, "y": 77.5}, {"x": 77.52808988764045, "y": 78.33333333333334}, {"x": 77.52808988764045, "y": 83.33333333333334}, {"x": 98.31460674157303, "y": 87.5}, {"x": 94.3820224719101, "y": 91.66666666666667}, {"x": 75.84269662921348, "y": 90}, {"x": 66.85393258426966, "y": 90}, {"x": 48.876404494382015, "y": 90}, {"x": 65.16853932584269, "y": 83.33333333333334}, {"x": 55.05617977528089, "y": 81.66666666666667}, {"x": 26.96629213483145, "y": 100}, {"x": 4.49438202247191, "y": 99.16666666666667}, {"x": 0, "y": 12.499999999999996}]}, {"id": "rect-7037", "title": "rect-7037", "type": "poly", "x": 12.329, "y": 29.698, "width": 11.771, "height": 16.037, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-943451", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Cuestionario 2"}, "font": {"text_align": "center"}}}]}}]}}, "points": [{"x": 0, "y": 100}, {"x": 54.12844036697248, "y": 100}, {"x": 100, "y": 38.38383838383837}, {"x": 98.1651376146789, "y": 12.121212121212118}, {"x": 59.63302752293578, "y": 0}, {"x": 57.798165137614674, "y": 7.070707070707069}, {"x": 9.174311926605505, "y": 8.08080808080808}, {"x": 0, "y": 12.121212121212118}]}, {"id": "rect-4403", "title": "rect-4403", "type": "poly", "x": 46.346, "y": 25.324, "width": 8.315, "height": 20.41, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-908991", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Cuestionario 3"}, "font": {"text_align": "center"}}}]}}]}}, "points": [{"x": 83.11688311688312, "y": 100}, {"x": 100, "y": 94.44444444444444}, {"x": 96.1038961038961, "y": 75.39682539682538}, {"x": 54.54545454545454, "y": 72.22222222222221}, {"x": 55.84415584415584, "y": 62.69841269841269}, {"x": 68.83116883116884, "y": 56.34920634920634}, {"x": 64.93506493506493, "y": 0}, {"x": 24.675324675324674, "y": 5.5555555555555545}, {"x": 19.480519480519483, "y": 24.603174603174597}, {"x": 6.493506493506493, "y": 30.95238095238095}, {"x": 0, "y": 41.269841269841265}, {"x": 7.792207792207792, "y": 49.206349206349195}, {"x": 19.480519480519483, "y": 46.825396825396815}, {"x": 51.94805194805194, "y": 48.412698412698404}, {"x": 53.246753246753244, "y": 57.14285714285713}]}, {"id": "rect-6176", "title": "rect-6176", "type": "poly", "x": 66.865, "y": 19.006, "width": 3.78, "height": 7.775, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-264671", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Cuestionario 4"}, "font": {"text_align": "center"}}}]}}]}}, "points": [{"x": 0, "y": 95.83333333333334}, {"x": 94.28571428571428, "y": 100}, {"x": 100, "y": 64.58333333333334}, {"x": 100, "y": 0}, {"x": 11.428571428571429, "y": 0}, {"x": 11.428571428571429, "y": 64.58333333333334}]}]});
            });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>