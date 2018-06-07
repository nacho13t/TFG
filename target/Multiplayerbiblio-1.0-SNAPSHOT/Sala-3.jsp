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
                $('#image-map-pro-container').imageMapPro({"id":256,"editor":{"selected_shape":"spot-4587","tool":"select"},"general":{"name":"Untitled","width":1476,"height":984,"naturalWidth":1476,"naturalHeight":984},"image":{"url":"Images/12.jpg"},"layers":{"layers_list":[{"id":0,"title":"Main Floor","image_url":"https://webcraftplugins.com/uploads/image-map-pro/demo.jpg","image_width":1280,"image_height":776}]},"spots":[{"id":"spot-5482","title":"spot-5482","x":76.8,"y":86.441,"actions":{"click":"follow-link","link":"Pasillo-superior-1.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-down","icon_is_pin":0},"mouseover_style":{"icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-4587","title":"spot-4587","x":77.987,"y":51.08,"actions":{"click":"follow-link","link":"Escaleras-2.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-up","icon_is_pin":0},"mouseover_style":{"icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"spot-9208","title":"spot-4587 Copy","x":58.225,"y":73.434,"actions":{"click":"follow-link","link":"Sala-4.jsp","open_link_in_new_window":0},"default_style":{"icon_fontawesome_id":"chevron-circle-left","icon_is_pin":0},"mouseover_style":{"opacity":0.8007518796992481,"icon_fill":"#ffffff"},"tooltip_style":{"enable_tooltip":0},"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}}},{"id":"rect-7179","title":"rect-7179","type":"poly","x":25.882,"y":60.718,"width":7.235,"height":10.61,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"right","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-324931","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"779\" height=\"438\" src=\"https://www.youtube.com/embed/OPbUZePOwVw?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":4.477194029850743,"y":97.7102290076336},{"x":71.64179104477611,"y":100},{"x":82.08955223880598,"y":96.94656488549606},{"x":79.8507462686567,"y":30.534351145038137},{"x":88.80597014925374,"y":16.030534351145057},{"x":100,"y":11.450381679389334},{"x":100,"y":4.58015267175572},{"x":82.08955223880598,"y":7.633587786259534},{"x":81.34328358208955,"y":0},{"x":64.92537313432831,"y":3.053435114503814},{"x":58.2089552238806,"y":0.763358778625987},{"x":46.26865671641791,"y":4.58015267175572},{"x":22.388059701492537,"y":0.763358778625987},{"x":7.462686567164178,"y":9.923664122137428},{"x":2.9850746268656714,"y":17.55725190839696},{"x":4.47725373134326,"y":38.16793893129774},{"x":0,"y":38.16793893129774}]},{"id":"rect-9086","title":"rect-9086","type":"poly","x":45.05,"y":31.641,"width":4.752,"height":7.289,"default_style":{"fill":"#8000ff","fill_opacity":0.5728905469851386},"tooltip_style":{"position":"right"},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-148371","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe src=\"https://bustreaming.ulpgc.es/bustreaming/reproducirEmbed.php?idpublicacion=32475\" allowfullscreen style=\"width:100%;height:440px;border-style: none;border: 0px;\"></iframe>"}}}]}}]}},"points":[{"x":0,"y":100},{"x":100,"y":95.55555555555556},{"x":97.72727272727273,"y":2.2222222222222223},{"x":63.63636363636363,"y":0},{"x":2.272727272727273,"y":6.666666666666667}]},{"id":"rect-8739","title":"rect-8739","type":"poly","x":65.137,"y":41.523,"width":2.376,"height":4.374,"default_style":{"fill":"#8000ff"},"tooltip_style":{"position":"left","auto_width":0},"tooltip_content":{"content_type":"content-builder","squares_settings":{"containers":[{"id":"sq-container-526521","settings":{"elements":[{"settings":{"name":"YouTube","iconClass":"fa fa-youtube"},"options":{"youtube":{"embed_code":"<iframe width=\"779\" height=\"438\" src=\"https://www.youtube.com/embed/vkT6N7sJ4n4?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"}}}]}}]}},"points":[{"x":0,"y":100},{"x":100,"y":99.99940741091908},{"x":90.90919008156274,"y":11.111045267879899},{"x":0.001090897190135,"y":0}]}]});
    });
        })(jQuery, window, document);
    </script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>