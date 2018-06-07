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

    <%
    boolean[] exmCompleted = user.getCompletedExams();
    if(!exmCompleted[4]){
    %>
    
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":4524,"editor":{"selected_shape":"rect-6337","tool":"poly"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/3.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-9527","title":"spot-9527","x":23.128,"y":95.788,"actions":{"click":"follow-link","link":"Pasillo.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-7631","title":"spot-7631","x":40.515,"y":62.257,"default_style":{"icon_fontawesome_id":"info-circle","icon_fill":"#ff0000","icon_is_pin":0},"tooltip_content":{"plain_text":"A veces tienes que completar algunos objetivos para poder avanzar en el recorrido.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-9983","title":"spot-9983","x":14.272,"y":33.747,"default_style":{"icon_fontawesome_id":"lock","icon_fill":"#ffffff","icon_is_pin":0},"tooltip_style":{"position":"right"},"tooltip_content":{"plain_text":"Completa el cuestionario de prueba para acceder a la siguiente sala.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-6337","title":"rect-6337","type":"poly","x":79.824,"y":50.27,"width":11.339,"height":23.164,"default_style":{"fill":"#8000ff"},"tooltip_style":{"auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-607721","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Cuestionario de prueba"},"font":{"font_size":"16","text_align":"center"}}}]}},{"id":"sq-container-361251","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-585691","settings":{"elements":[{"settings":{"name":"Button","iconClass":"fa fa-link"},"options":{"button":{"text":"Comenzar","link_to":"DisplayExamServlet?exam=tema5Exam&points=60"},"font":{"text_align":"center"}}}]}}]}},"points":[{"x":40.95238095238095,"y":100},{"x":100,"y":82.51748251748252},{"x":55.23809523809524,"y":0},{"x":0,"y":16.083916083916083}]}]});
    });
        })(jQuery, window, document);
    </script>

    <%
    }else{
    %>
    
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id":4524,"editor":{"selected_shape":"spot-7631","tool":"poly"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/3.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-9527","title":"spot-9527","x":23.128,"y":95.788,"actions":{"click":"follow-link","link":"Pasillo.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-7631","title":"spot-7631","x":58.55,"y":18.197,"default_style":{"icon_fontawesome_id":"info-circle","icon_fill":"#ff0000","icon_is_pin":0},"tooltip_content":{"plain_text":"Accede a tu perfil pulsado en tu avatar, sobre el menú. En el perfil puedes consultar información sobre tu progreso y cambiar tu imagen.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-9983","title":"spot-9983","x":12.004,"y":34.881,"actions":{"click":"follow-link","link":"Sala-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-left","icon_fill":"#ffffff","icon_is_pin":0},"tooltip_style":{"enable_tooltip":0,"position":"right"},"tooltip_content":{"plain_text":"Completa el cuestionario de prueba para acceder a la siguiente sala.","squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-6337","title":"rect-6337","type":"poly","x":79.824,"y":50.27,"width":11.339,"height":23.164,"default_style":{"fill":"#8000ff"},"tooltip_style":{"auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-148031","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Cuestionario de prueba"},"font":{"font_size":"16","text_align":"center"}}}]}},{"id":"sq-container-286901","settings":{"elements":[{"settings":{"name":"Image","iconClass":"fa fa-camera"},"options":{"image":{"url":"Images/open-leaf-book.jpg"}}}]}},{"id":"sq-container-90441","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"},"options":{"text":{"text":"Has conseguido la máxima nota en este cuestionario, has desbloqueado el acceso a la siguiente sala."}}}]}}]}},"points":[{"x":40.95238095238095,"y":100},{"x":100,"y":82.51748251748252},{"x":55.23809523809524,"y":0},{"x":0,"y":16.083916083916083}]}]});
    });
        })(jQuery, window, document);
    </script>
    
    <%
    }
    %>
    
    <jsp:include page="footer-v2.jsp" />

</body>
</html>