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
                $('#image-map-pro-container').imageMapPro({"id":5820,"editor":{"selected_shape":"rect-2779","tool":"poly"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/3.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-9527","title":"spot-9527","x":23.128,"y":95.788,"actions":{"click":"follow-link","link":"Pasillo.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-9983","title":"spot-9983","x":11.248,"y":34.071,"actions":{"click":"follow-link","link":"Sala-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-left","icon_fill":"#ffffff","icon_is_pin":0},"tooltip_style":{"enable_tooltip":0,"position":"right"},"tooltip_content":{"plain_text":"Completa el cuestionario de prueba para acceder a la siguiente sala.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-6337","title":"rect-6337","type":"poly","x":79.824,"y":50.27,"width":11.339,"height":23.164,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-907031","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"La Biblioteca Universataria"},"font":{"font_size":"16","text_align":"center"}}}]}},{"id":"sq-container-176731","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"El carné inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios."},"font":{"text_align":"justify"}}}]}}]}},"points":[{"x":40.95238095238095,"y":100},{"x":100,"y":82.51748251748252},{"x":55.23809523809524,"y":0},{"x":0,"y":16.083916083916083}]},{"id":"rect-2779","title":"rect-2779","type":"poly","x":62.869,"y":43.79,"width":10.475,"height":19.763,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-808731","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Espacio y equipamientos"},"font":{"text_align":"center"}}}]}},{"id":"sq-container-457591","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"La Biblioteca Universitaria pone a tu alcance más de 2000 puestos de lectura, salas de trabajo en grupo. Además, existen salas de estudio abiertas las 24 horas, en los diferentes campus.\nDispones de ordenadores personales y portátiles con acceso a Internet, herramientas ofimáticas y software adaptado a las necesidades de cada centro, para su uso dentro del campus o para llevártelo a casa.  También tienes a tu disposición iPads.\n\n"},"font":{"text_align":"justify"}}}]}}]}},"points":[{"x":0,"y":72.13127546299789},{"x":35.051546391752616,"y":100},{"x":85.56701030927836,"y":46.7215560322018},{"x":76.28865979381445,"y":30.328188657494675},{"x":100,"y":23.77084170761183},{"x":74.22705154639175,"y":0}]},{"id":"rect-5204","title":"rect-5204","type":"poly","x":88.031,"y":7.343,"width":3.456,"height":7.289,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"bottom"},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-145421","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Horario"},"font":{"text_align":"center"}}}]}},{"id":"sq-container-303121","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"La Biblioteca Universitaria abre 12 horas y media al día, de 8.15 a 20.45 horas, salvo la Biblioteca de Enfermería en Lanzarote, que tiene un horario específico. \nEn periodos vacacionales, el horario de las bibliotecas se reduce, por lo que se recomienda consultarlo en la página Web de la Biblioteca Universitaria y en el Campus Social.\n"},"font":{"text_align":"justify"}}}]}}]}},"points":[{"x":34.375,"y":100},{"x":81.25,"y":93.33333333333333},{"x":96.875,"y":73.33333333333333},{"x":100,"y":26.666666666666668},{"x":75,"y":0},{"x":34.375,"y":2.2222222222222223},{"x":3.125,"y":20},{"x":0,"y":53.333333333333336},{"x":6.25,"y":82.22222222222221}]}]});
    });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>