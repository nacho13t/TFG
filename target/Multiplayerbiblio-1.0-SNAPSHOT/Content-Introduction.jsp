<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #333333">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div id="image-map-pro-container" class="pt-4 pl-1 pb-4"></div>
            </div>
            <div class="col-sm-12 col-md-4">
                <div class="row mt-4 mr-1">
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
                    <a href="Rankings-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Rankings</a>
                    <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Medallas</a>
                    <a href="Inventario-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
                    <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
                    <% if (user.level() >= 4) { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
                    <% } else { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro</a>
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
                $('#image-map-pro-container').imageMapPro({"id":811,"editor":{"previewMode":1,"selected_shape":"spot-1158"},"general":{"name":"Demo","width":1600,"height":1064,"naturalWidth":1600,"naturalHeight":1064,"pageload_animation":"grow"},"image":{"url":"https://upload.wikimedia.org/wikipedia/commons/9/9a/Biblioteca-montserrat.jpg"},"tooltips":{"tooltip_animation":"grow","fullscreen_tooltips":"mobile-only"},"spots":[{"id":"rect-342","title":"rect-342","type":"poly","x":32.285,"y":54.292,"width":10.828,"height":5.477,"default_style":{"fill":"#0000ff","fill_opacity":0.436},"tooltip_style":{"position":"right"},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-699751","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}},{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Las Bibliotecas Temáticas ofrecen recursos y servicios comunes que puedes utilizar independientemente de los estudios que estés realizando. Como has visto en el vídeo, en ellas encontrarás la bibliografía que necesites para estudiar las asignaturas propias de tu titulación, no sólo los manuales básicos, sino también otras obras más especializadas.            "}}}]}}]}},"points":[{"x":0,"y":66.36363636363637},{"x":1.529051987767584,"y":47.27272727272727},{"x":4.587155963302752,"y":46.36363636363636},{"x":0.3058103975535168,"y":35.45454545454545},{"x":71.25382262996942,"y":0},{"x":100,"y":40},{"x":100,"y":58.18181818181818},{"x":96.94189602446484,"y":63.63636363636363},{"x":29.96941896024465,"y":100},{"x":11.926605504587156,"y":83.63636363636363},{"x":3.3639143730886847,"y":74.54545454545455}]},{"id":"oval-2021","title":"oval-2021","type":"oval","x":71.524,"y":11.32,"width":8.344,"height":12.747,"default_style":{"background_color":"#8000ff"},"tooltip_style":{"position":"left","width":400},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-880761","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/cool-earth.jpg"}}}]}},{"id":"sq-container-84321","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"La Biblioteca de la ULPGC es una entidad única que está formada por 13 Bibliotecas Temáticas (puntos de servicio especializados que generalmente encontrarás en cada escuela o facultad), la Biblioteca General y los Servicios Técnicos Centralizados (desde los que se mantiene la página web, se compran libros electrónicos, se dan clases para ayudarte a localizar la información que necesitas en cada momento, etc.)."}}}]}}]}}},{"id":"spot-7863","title":"spot-7863","x":21.06,"y":24.267,"default_style":{"icon_svg_path":"M365.634,289.891h14.431v24.445h-14.431v0.195H321.6v-0.195h-17.371v-24.445H321.6v-91.419     h-16.365v-25.569H321.6v-0.078h44.034V289.891z M343.338,155.443c14.782,0,23.761-9.848,23.761-22.002     c-0.303-12.477-8.979-22.002-23.175-22.002c-14.186,0-23.458,9.526-23.458,22.002     C320.447,145.595,329.416,155.443,343.338,155.443z M557.686,215.549c0,119.079-215.559,468.724-215.559,468.724     s-215.54-349.645-215.54-468.724C126.587,96.519,223.077,0,342.127,0C461.166,0,557.686,96.519,557.686,215.549z      M508.923,215.549c0-91.957-74.82-166.757-166.796-166.757c-91.947,0-166.757,74.8-166.747,166.757     c0,91.996,74.81,166.796,166.747,166.796C434.103,382.346,508.923,307.545,508.923,215.549z","icon_svg_viewbox":"0 0 684.273 684.273","icon_fill":"#8000ff"},"tooltip_style":{"position":"bottom"},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-384711","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/cool-shelve.jpg"}}}]}},{"id":"sq-container-49041","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"El carné inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios.              "}}}]}}]}}},{"id":"spot-1158","title":"spot-1158","x":90.331,"y":89.198,"width":40,"height":40,"actions":{"click":"follow-link","link":"Content-Hall.jsp","open_link_in_new_window":0},"default_style":{"icon_svg_path":"M109.018,202.995c2.521,22.52-3.253,31.587-18.993,34.196     c-15.73,2.648-31.04-10.855-34.244-30.112c-1.475-8.852-4.367-25.95-6.165-33.815c-2.853-12.535-10.474-28.851-13.434-38.494     c-0.674-2.208-8.383-17.997-10.171-26.712c-2.941-14.157,6.155-28.001,20.293-30.971l24.728-5.12     c3.713-0.791,14.753-1.553,14.753-1.553c15.183-0.098,22.569,7.718,22.647,22.911c0.039,8.783-7.943,22.041-14.128,23.019     c-6.204,0.977-8.93,0.283-13.131,0.303c-6.038,0.029-9.037,9.047-9.721,13.971c-0.371,2.657-0.459,15.095,7.347,30.893     C86.615,177.28,105.657,172.903,109.018,202.995z M90.611,66.476c6.282-0.029,11.353-7.533,11.304-16.746     s-5.178-16.668-11.46-16.629c-6.302,0.039-11.363,7.533-11.304,16.746C79.19,59.051,84.319,66.506,90.611,66.476z M53.358,69.026     c3.752-0.899,5.696-6.038,4.377-11.48c-1.339-5.422-5.393-9.116-9.116-8.236c-3.732,0.909-5.676,6.048-4.367,11.47     C45.581,66.232,49.625,69.935,53.358,69.026z M69.791,64.894c4.475-0.635,7.269-6.429,6.292-12.926     c-0.967-6.468-5.335-11.167-9.76-10.542c-4.426,0.684-7.249,6.468-6.272,12.945C61.037,60.839,65.375,65.538,69.791,64.894z      M27.887,75.748c-1.446-3.634-4.621-5.755-7.083-4.768c-2.511,0.997-3.332,4.739-1.876,8.353c1.456,3.615,4.66,5.725,7.122,4.748     C28.522,83.086,29.362,79.353,27.887,75.748z M38.478,75.738c3.126-1.251,4.172-6.009,2.325-10.581     c-1.847-4.612-5.901-7.318-8.998-6.038c-3.166,1.241-4.191,6.009-2.374,10.581C31.287,74.302,35.322,76.989,38.478,75.738z      M109.018,202.995c2.521,22.52-3.253,31.587-18.993,34.196c-15.73,2.648-31.04-10.855-34.244-30.112     c-1.475-8.852-4.367-25.95-6.165-33.815c-2.853-12.535-10.474-28.851-13.434-38.494c-0.674-2.208-8.383-17.997-10.171-26.712     c-2.941-14.157,6.155-28.001,20.293-30.971l24.728-5.12c3.713-0.791,14.753-1.553,14.753-1.553     c15.183-0.098,22.569,7.718,22.647,22.911c0.039,8.783-7.943,22.041-14.128,23.019c-6.204,0.977-8.93,0.283-13.131,0.303     c-6.038,0.029-9.037,9.047-9.721,13.971c-0.371,2.657-0.459,15.095,7.347,30.893C86.615,177.28,105.657,172.903,109.018,202.995z      M90.611,66.476c6.282-0.029,11.353-7.533,11.304-16.746s-5.178-16.668-11.46-16.629c-6.302,0.039-11.363,7.533-11.304,16.746     C79.19,59.051,84.319,66.506,90.611,66.476z M53.358,69.026c3.752-0.899,5.696-6.038,4.377-11.48     c-1.339-5.422-5.393-9.116-9.116-8.236c-3.732,0.909-5.676,6.048-4.367,11.47C45.581,66.232,49.625,69.935,53.358,69.026z      M69.791,64.894c4.475-0.635,7.269-6.429,6.292-12.926c-0.967-6.468-5.335-11.167-9.76-10.542     c-4.426,0.684-7.249,6.468-6.272,12.945C61.037,60.839,65.375,65.538,69.791,64.894z M27.887,75.748     c-1.446-3.634-4.621-5.755-7.083-4.768c-2.511,0.997-3.332,4.739-1.876,8.353c1.456,3.615,4.66,5.725,7.122,4.748     C28.522,83.086,29.362,79.353,27.887,75.748z M38.478,75.738c3.126-1.251,4.172-6.009,2.325-10.581     c-1.847-4.612-5.901-7.318-8.998-6.038c-3.166,1.241-4.191,6.009-2.374,10.581C31.287,74.302,35.322,76.989,38.478,75.738z      M158.739,128.429c7.816-15.808,7.728-28.246,7.347-30.903c-0.674-4.924-3.674-13.952-9.712-13.981     c-4.211-0.02-6.927,0.674-13.141-0.303c-6.194-0.977-14.157-14.225-14.118-23.019c0.088-15.193,7.474-22.999,22.637-22.921     c0,0,11.04,0.772,14.763,1.563l24.728,5.12c14.118,2.97,23.243,16.814,20.273,30.962c-1.798,8.715-9.497,24.513-10.171,26.712     c-2.97,9.653-10.581,25.969-13.434,38.494c-1.798,7.875-4.68,24.973-6.165,33.815c-3.205,19.267-18.514,32.769-34.244,30.121     c-15.73-2.618-21.504-11.675-18.983-34.196C131.9,139.821,150.932,144.169,158.739,128.429z M158.397,16.746     C158.455,7.523,153.385,0.039,147.102,0c-6.292-0.039-11.421,7.416-11.47,16.629c-0.049,9.213,5.022,16.717,11.304,16.746     C153.219,33.395,158.358,25.94,158.397,16.746z M193.296,27.679c1.309-5.432-0.635-10.571-4.357-11.48     c-3.732-0.879-7.787,2.814-9.145,8.246c-1.309,5.442,0.635,10.581,4.387,11.48C187.912,36.834,191.957,33.121,193.296,27.679z      M177.497,21.26c0.977-6.487-1.847-12.262-6.292-12.945c-4.406-0.625-8.774,4.074-9.751,10.542     c-0.977,6.497,1.837,12.291,6.302,12.926C172.173,32.437,176.501,27.738,177.497,21.26z M211.478,50.981     c2.472,0.977,5.667-1.143,7.122-4.758c1.446-3.615,0.625-7.357-1.866-8.353c-2.462-0.987-5.637,1.124-7.093,4.768     C208.176,46.242,209.016,49.975,211.478,50.981z M208.117,36.589c1.827-4.572,0.791-9.34-2.364-10.581     c-3.087-1.29-7.142,1.417-9.008,6.028c-1.837,4.582-0.811,9.34,2.335,10.591S206.251,41.191,208.117,36.589z M158.739,128.429     c7.816-15.808,7.728-28.246,7.347-30.903c-0.674-4.924-3.674-13.952-9.712-13.981c-4.211-0.02-6.927,0.674-13.141-0.303     c-6.194-0.977-14.157-14.225-14.118-23.019c0.088-15.193,7.474-22.999,22.637-22.921c0,0,11.04,0.772,14.763,1.563l24.728,5.12     c14.118,2.97,23.243,16.814,20.273,30.962c-1.798,8.715-9.497,24.513-10.171,26.712c-2.97,9.653-10.581,25.969-13.434,38.494     c-1.798,7.875-4.68,24.973-6.165,33.815c-3.205,19.267-18.514,32.769-34.244,30.121c-15.73-2.618-21.504-11.675-18.983-34.196     C131.9,139.821,150.932,144.169,158.739,128.429z M158.397,16.746C158.455,7.523,153.385,0.039,147.102,0     c-6.292-0.039-11.421,7.416-11.47,16.629c-0.049,9.213,5.022,16.717,11.304,16.746C153.219,33.395,158.358,25.94,158.397,16.746z      M193.296,27.679c1.309-5.432-0.635-10.571-4.357-11.48c-3.732-0.879-7.787,2.814-9.145,8.246     c-1.309,5.442,0.635,10.581,4.387,11.48C187.912,36.834,191.957,33.121,193.296,27.679z M177.497,21.26     c0.977-6.487-1.847-12.262-6.292-12.945c-4.406-0.625-8.774,4.074-9.751,10.542c-0.977,6.497,1.837,12.291,6.302,12.926     C172.173,32.437,176.501,27.738,177.497,21.26z M211.478,50.981c2.472,0.977,5.667-1.143,7.122-4.758     c1.446-3.615,0.625-7.357-1.866-8.353c-2.462-0.987-5.637,1.124-7.093,4.768C208.176,46.242,209.016,49.975,211.478,50.981z      M208.117,36.589c1.827-4.572,0.791-9.34-2.364-10.581c-3.087-1.29-7.142,1.417-9.008,6.028     c-1.837,4.582-0.811,9.34,2.335,10.591S206.251,41.191,208.117,36.589z","icon_svg_viewbox":"0 0 237.522 237.522","icon_fill":"#ffffff","icon_is_pin":0},"tooltip_style":{"auto_width":1},"tooltip_content":{"content_type":"content-builder","plain_text":"Volver","squares_settings":{"containers":[{"id":"sq-container-941521","settings":{"elements":[{"settings":{"name":"Button","iconClass":"fa fa-link"},"options":{"button":{"text":"Volver","link_to":"Content-Hall.jsp","display":"block","bg_color":"#000000"},"style":{"background_color":"#000000","background_opacity":0.9999854172332377,"opacity":0.9999854172332377,"border_width":2,"border_style":"solid","border_color":"#ffffff","border_radius":12},"font":{"text_align":"center"}}}]}}]}}}]});
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