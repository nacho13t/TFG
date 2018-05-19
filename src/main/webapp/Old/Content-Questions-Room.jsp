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
                                    $('#image-map-pro-container').imageMapPro({"id": 811, "editor": {"selected_shape": "rect-4414", "tool": "select"}, "general": {"name": "Demo", "width": 2362, "height": 1757, "naturalWidth": 2362, "naturalHeight": 1757, "pageload_animation": "grow"}, "image": {"url": "https://upload.wikimedia.org/wikipedia/commons/e/e1/Duke_Humfrey%27s_Library_Interior_6%2C_Bodleian_Library%2C_Oxford%2C_UK_-_Diliff.jpg"}, "tooltips": {"constrain_tooltips": 0, "tooltip_animation": "grow"}, "spots": [{"id": "rect-4414", "title": "rect-4414", "type": "poly", "x": 77.421, "y": 55.648, "width": 1.822, "height": 6.86, "actions": {"click": "run-script", "script": "$('#button-modal-1').click();"}, "default_style": {"fill": "#8000ff"}, "tooltip_content": {"plain_text": "Pregunta 1", "squares_settings": {"containers": [{"id": "sq-container-630881"}, {"id": "sq-container-351981"}, {"id": "sq-container-974121"}]}}, "points": [{"x": 6.66630321030721, "y": 1.0641879749506749}, {"x": 100, "y": 0}, {"x": 88.8612872755112, "y": 100}, {"x": 0, "y": 99.47948370403905}]}]});
                                });
                            })(jQuery, window, document);
    </script>

    <!-- Button trigger modal -->
    <button type="button" id="button-modal-1" class="btn btn-primary" data-toggle="modal" data-target="#question-one-modal" style="display: none">
        Pregunta 1
    </button>

    <!-- Modal 1 -->
    <div class="modal fade" id="question-one-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #333333; color:white;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pregunta 1</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="Images/open-leaf-book.jpg" class="img-responsive" width="100%">
                    <h6 class="mt-2">Libro: Libro de Ejemplo (pag 56)</h6>
                    <p>
                        ¿Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.?
                    </p>
                    <form action="ReviseQuestionServlet">
                        <div class="form-group">
                            <label for="answer">Respuesta</label>
                            <input type="text" class="form-control" name="answer" aria-describedby="emailHelp" placeholder="Escribe tu respuesta aquí">
                        </div>
                        <input type="hidden" name="number" value="1">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Close -->

    <jsp:include page="footer-v2.jsp" />

</body>
</html>