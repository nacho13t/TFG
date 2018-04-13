<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid" style="background-color: #333333">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div id="image-map-pro-container" class="pt-4 pl-3 pb-4"></div>
            </div>
            <div class="col-sm-12 col-md-4">

                <div class="row mt-4 mr-2">
                    <div class="col-5 text-center">
                        <img src="<%=user.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    </div> 
                    <div class="col-7">
                        <h5 style="color: white" mt-2><%= user.nick()%></h5>
                        <h5 style="color: white" mt-2><%= user.career()%></h5>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-center pr-3">

                    <div class="mt-3"><span class="rounded-circle border border-white" style="background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level()%></span></div>
                    <div class="mt-4 progress w-75">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
                    </div>
                    <div class="mt-3"><span class="rounded-circle border border-white" style=" background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level() + 1%></span></div>

                </div>

                <div class="list-group align-items-center menu-right align-middle mt-4 pr-3">
                    <a href="mainScreen.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Rankings</a>
                    <a href="Medals.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Medallas</a>
                    <a href="Inventario.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
                    <a href="RecommendedBooks.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
                    <% if (user.level() >= 4) { %>
                    <a href="Forum.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
                    <% } else { %>
                    <a href="Forum.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro</a>
                    <%}%>
                </div> 
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 811, "editor": {"previewMode": 1, "selected_shape": "rect-5766", "tool": "poly"}, "general": {"name": "Demo", "width": 3888, "height": 2592, "naturalWidth": 3888, "naturalHeight": 2592, "preserve_quality": 0}, "image": {"url": "https://www.denverlibrary.org/sites/dplorg/files/IMG_0849.JPG"}, "tooltips": {"constrain_tooltips": 0, "fullscreen_tooltips": "mobile-only"}, "spots": [{"id": "rect-5766", "title": "rect-5766", "type": "poly", "x": 68.161, "y": 61.303, "width": 12.959, "height": 24.946, "actions": {"click": "follow-link", "link": "Content-Hall.jsp", "open_link_in_new_window": 0}, "default_style": {"fill": "#8000ff"}, "tooltip_style": {"auto_width": 1}, "tooltip_content": {"plain_text": "Entrar", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 100, "y": 4.545454545454547}, {"x": 7.5, "y": 0}, {"x": 0, "y": 90.25974025974025}, {"x": 93.33333333333333, "y": 100}]}]});
            });
        })(jQuery, window, document);
    </script>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer-v2.jsp" />

    <script>
        function alertar() {
            $('#exampleModal').modal('show');
        }

    </script>
</body>
</html>