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
                                    $('#image-map-pro-container').imageMapPro({"id": 811, "editor": {"selected_shape": "rect-5766", "tool": "poly"}, "general": {"name": "Demo", "width": 3888, "height": 2592, "naturalWidth": 3888, "naturalHeight": 2592, "preserve_quality": 0}, "image": {"url": "https://www.denverlibrary.org/sites/dplorg/files/IMG_0849.JPG"}, "tooltips": {"tooltip_animation": "grow"}, "spots": [{"id": "rect-5766", "title": "rect-5766", "type": "poly", "x": 68.161, "y": 61.303, "width": 12.959, "height": 24.946, "actions": {"click": "follow-link", "link": "Content-Hall.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"position": "left", "auto_width": 1}, "tooltip_content": {"plain_text": "Entrar", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 100, "y": 4.545454545454547}, {"x": 7.5, "y": 0}, {"x": 0, "y": 90.25974025974025}, {"x": 93.33333333333333, "y": 100}]}]});
                                });
                            })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>