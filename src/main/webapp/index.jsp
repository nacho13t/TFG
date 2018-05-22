<%@page import="db.CareerManagement"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="index-styles.css">
        <link rel="stylesheet" href="image-map-pro.min.css">
        <title>TFG</title>
    </head>
    <body>

        <div class="fixed-top p-4" style="text-align: right">
            <button class="btn btn-outline-info mt-2" type="button" data-toggle="modal" data-target="#loginModal"><span class="font-weight-bold" >Iniciar sesión</span></button>
            <button class="btn btn-success mt-2" type="button" data-toggle="modal" data-target="#registerModal"><span class="font-weight-bold" >Registrarse</span></button>

        </div>
        <div style="z-index: 2; position: absolute">
            <div id="title-div-container" >
                <h1 class="titulo display-1">CONOCE TU BIBLIOTECA</h1>
            </div>
        </div>
        
        <div id="image-map-pro-container" style="z-index: 1; position: absolute" > </div>
        <script src="jquery-3.3.1.min.js"></script>
        <script src="image-map-pro.min.js"></script>
        <script type="text/javascript">
            ;
            (function ($, window, document, undefined) {
                $(document).ready(function () {
                    $('#image-map-pro-container').imageMapPro({"id": 8616, "editor": {"selected_shape": "rect-2444", "tool": "select"}, "general": {"name": "Untitled", "width": 1920, "height": 1000, "naturalWidth": 1920, "naturalHeight": 1000}, "image": {"url": "Images/background-image-v3.jpg"}, "layers": {"layers_list": [{"id": 0, "title": "Main Floor", "image_url": "https://webcraftplugins.com/uploads/image-map-pro/demo.jpg", "image_width": 1280, "image_height": 776}]}, "spots": [{"id": "rect-7029", "title": "rect-7029", "type": "poly", "x": 5.958, "y": 76.679, "width": 2.106, "height": 3.006, "tooltip_content": {"squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 0, "y": 100}, {"x": 100, "y": 0}]}, {"id": "rect-5703", "title": "rect-5703", "type": "poly", "x": 5.688, "y": 62.062, "width": 15.713, "height": 22.6, "default_style": {"fill": "#8000ff", "fill_opacity": 0.051221804511278196, "stroke_opacity": 0.6288638007371945}, "tooltip_style": {"background_opacity": 0.6288638007371945, "position": "right", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-271371", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Aprende sobre los servicios de la biblioteca"}, "font": {"font_size": "20", "text_align": "center"}}}]}}, {"id": "sq-container-885891", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Realiza los cuestionarios situados en determinadas salas de la biblioteca, consigue comodines para que sean más sencillos."}}}]}}]}}, "points": [{"x": 26.11683848797251, "y": 49.08256880733945}, {"x": 17.869415807560138, "y": 59.174311926605505}, {"x": 7.560137457044673, "y": 70.18348623853211}, {"x": 0.6872852233676976, "y": 77.98165137614679}, {"x": 0, "y": 82.11009174311926}, {"x": 3.7800687285223367, "y": 88.53211009174312}, {"x": 8.24742268041237, "y": 88.9908256880734}, {"x": 12.027491408934708, "y": 92.20183486238533}, {"x": 15.807560137457044, "y": 96.3302752293578}, {"x": 21.305841924398624, "y": 99.08256880733946}, {"x": 25.773195876288657, "y": 100}, {"x": 32.64604810996563, "y": 99.08256880733946}, {"x": 38.83161512027492, "y": 96.78899082568807}, {"x": 45.017182130584196, "y": 92.20183486238533}, {"x": 48.797250859106526, "y": 86.69724770642202}, {"x": 51.890034364261176, "y": 81.19266055045871}, {"x": 52.57731958762887, "y": 72.01834862385321}, {"x": 50.171821305841924, "y": 61.92660550458715}, {"x": 50.85910652920962, "y": 57.3394495412844}, {"x": 53.95189003436426, "y": 53.669724770642205}, {"x": 58.075601374570454, "y": 55.5045871559633}, {"x": 64.60481099656357, "y": 58.71559633027523}, {"x": 69.7594501718213, "y": 59.174311926605505}, {"x": 75.94501718213058, "y": 59.63302752293578}, {"x": 81.78694158075601, "y": 57.798165137614674}, {"x": 86.25429553264605, "y": 53.21100917431193}, {"x": 89.69072164948454, "y": 49.54128440366973}, {"x": 93.81443298969072, "y": 44.95412844036697}, {"x": 97.59450171821305, "y": 37.61467889908257}, {"x": 100, "y": 33.02752293577982}, {"x": 100, "y": 26.605504587155966}, {"x": 97.59450171821305, "y": 18.807339449541285}, {"x": 96.21993127147766, "y": 12.844036697247708}, {"x": 94.84536082474226, "y": 8.256880733944955}, {"x": 92.78350515463917, "y": 0.9174311926605505}, {"x": 89.00343642611683, "y": 0}, {"x": 79.03780068728523, "y": 5.045871559633028}, {"x": 70.10309278350515, "y": 12.844036697247708}, {"x": 51.546391752577314, "y": 27.981651376146786}, {"x": 40.20618556701031, "y": 37.15596330275229}]}, {"id": "rect-485", "title": "rect-485", "type": "poly", "x": 2.07, "y": 34.796, "width": 12.419, "height": 19.076, "default_style": {"fill": "#8000ff", "fill_opacity": 0.06761697181185386, "stroke_opacity": 0.618838776323132}, "mouseover_style": {"fill_opacity": 0.10291353383458647, "stroke_opacity": 0.13721804511278196}, "tooltip_style": {"background_opacity": 0.618838776323132, "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-563751", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Sube de nivel"}, "font": {"font_size": "20", "text_align": "center"}}}]}}, {"id": "sq-container-258371", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "A medida que subas de nivel podrás escalar en el ranking de usuarios. También podrás contribuir a las estadísticas de tu biblioteca."}}}]}}]}}, "points": [{"x": 56.52173913043478, "y": 96.73913043478261}, {"x": 68.69565217391305, "y": 100}, {"x": 85.21739130434783, "y": 94.56521739130433}, {"x": 96.52173913043478, "y": 82.60869565217389}, {"x": 100, "y": 65.2173913043478}, {"x": 93.91304347826087, "y": 48.91304347826085}, {"x": 86.08695652173914, "y": 34.782608695652165}, {"x": 77.39130434782608, "y": 21.739130434782602}, {"x": 63.47826086956522, "y": 8.695652173913041}, {"x": 43.47826086956522, "y": 0}, {"x": 27.82608695652174, "y": 5.4347826086956506}, {"x": 12.173913043478262, "y": 9.782608695652172}, {"x": 2.608695652173913, "y": 14.130434782608692}, {"x": 0, "y": 60.86956521739128}, {"x": 8.695652173913043, "y": 72.82608695652172}, {"x": 23.47826086956522, "y": 84.78260869565216}, {"x": 35.65217391304348, "y": 92.39130434782605}]}, {"id": "rect-8755", "title": "rect-8755", "type": "poly", "x": 4.662, "y": -0.038, "width": 24.514, "height": 29.442, "default_style": {"fill": "#8000ff", "fill_opacity": 0.05894946334953595, "stroke_opacity": 0.6070384549019032}, "tooltip_style": {"background_opacity": 0.6070384549019032, "position": "right", "width": 400, "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-764721", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Explora"}, "font": {"font_size": "20", "text_align": "center"}}}]}}, {"id": "sq-container-780851", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Descubre nuevos objetos desbloqueables explorando las diferentes salas y rincones de la biblioteca."}}}]}}]}}, "points": [{"x": 42.29085462555067, "y": 100}, {"x": 100, "y": 38.02861256964486}, {"x": 82.81938325991193, "y": 0}, {"x": 0, "y": 1.4084671322090685}]}, {"id": "rect-2444", "title": "rect-2444", "type": "poly", "x": 84.791, "y": 63.617, "width": 14.039, "height": 25.089, "default_style": {"fill": "#8000ff", "fill_opacity": 0.08176691729323309, "stroke_opacity": 0.6266708947662124}, "tooltip_style": {"background_opacity": 0.6266708947662124, "position": "left", "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-974771", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Participa en el foro"}, "font": {"font_size": "20", "text_align": "center"}}}]}}, {"id": "sq-container-342431", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Plantea y resuelve dudas a otros usuarios en el foro."}}}]}}]}}, "points": [{"x": 0, "y": 37.1900826446281}, {"x": 68.46153846153847, "y": 100}, {"x": 100, "y": 63.63636363636363}, {"x": 36.15384615384615, "y": 4.958677685950414}, {"x": 26.923076923076923, "y": 0}]}, {"id": "rect-1389", "title": "rect-1389", "type": "poly", "x": 22.372, "y": 76.058, "width": 15.227, "height": 23.637, "default_style": {"fill": "#8000ff", "fill_opacity": 0.06129908740968633, "stroke_opacity": 0.6274018251806274}, "tooltip_style": {"background_opacity": 0.6274018251806274, "auto_width": 0}, "tooltip_content": {"content_type": "content-builder", "squares_settings": {"containers": [{"id": "sq-container-141041", "settings": {"elements": [{"settings": {"name": "Heading", "iconClass": "fa fa-header"}, "options": {"heading": {"text": "Recomienda libros"}, "font": {"font_size": "20", "text_align": "center"}}}]}}, {"id": "sq-container-544461", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}, "options": {"text": {"text": "Recomienda tus libros preferidos a otros usuarios y lee sus recomendaciones para descubrir nuevos libros."}}}]}}]}}, "points": [{"x": 39.71631205673757, "y": 0}, {"x": 100, "y": 37.719298245614034}, {"x": 97.87234042553192, "y": 48.24561403508772}, {"x": 75.88652482269504, "y": 100}, {"x": 0, "y": 99.12280701754386}]}]});
                });
            })(jQuery, window, document);
        </script>

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inicio de sesión</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="LoginServlet" onsubmit="return validateLogin(this)">
                            <div class="form-group">
                                <label for="yourName">Nombre</label>
                                <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Contraseña</label>
                                <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary">Entrar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Registro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="RegisterServlet" onsubmit="return validateRegister(this)" accept-charset="UTF-8">
                            <div class="form-group">
                                <label for="yourName">Nombre</label>
                                <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                            </div>
                            <div class="form-group">
                                <label for="inputCareer">Carrera</label>
                                <select id="inputCareer" name="career" class="form-control">
                                    <%
                                        for (String career : CareerManagement.getCareerNames()) {
                                    %><option><%=career%></option><%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Contraseña</label>
                                <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1">Repita la contraseña</label>
                                <input type="password" class="form-control" id="inputPassword1" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary float-left">Entrar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>



    </body>
</html>