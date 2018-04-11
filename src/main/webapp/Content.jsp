<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>

    <div id="image-map-pro-container" class="container"></div>


    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>
    <script type="text/javascript">
        ;
        (function ($, window, document, undefined) {
            $(document).ready(function () {
                $('#image-map-pro-container').imageMapPro({"id": 811, "editor": {"tool": "poly"}, "general": {"name": "Demo", "width": 600, "height": 400, "naturalWidth": 600, "naturalHeight": 400, "pageload_animation": "grow"}, "image": {"url": "https://www.ulpgc.es/sites/default/files/styles/foto_noticia_crop/public/ArchivosULPGC/noticia/2018/Mar/biblioteca.jpg?itok=Cdat-Y2s"}, "spots": [{"id": "poly-8616", "title": "poly-8616", "type": "poly", "x": 76.333, "y": 53.2, "width": 8, "height": 7,"actions":{"click":"follow-link","link":"Content-Hall.jsp","open_link_in_new_window":0}, "default_style": {"fill": "#ff0000", "fill_opacity": 0.16541353383458646}, "tooltip_content": {"plain_text": "Entrar", "squares_settings": {"containers": [{"id": "sq-container-403761", "settings": {"elements": [{"settings": {"name": "Paragraph", "iconClass": "fa fa-paragraph"}}]}}]}}, "points": [{"x": 10.416666666666668, "y": 85.71428571428571}, {"x": 100, "y": 100}, {"x": 100, "y": 3.571428571428571}, {"x": 0, "y": 0}]}]});
            });
        })(jQuery, window, document);
    </script>


    <div class="container-fluid p-2 text-center" style="background-color: #333333; display: none">
        <img src="Images/tema-uno-1.jpg" width="75%" border="0" usemap="#map" class="img-tema-1"/>

        <map name="map">
            <!-- #$-:Image map file created by GIMP Image Map plug-in -->
            <!-- #$-:GIMP Image Map plug-in by Maurits Rijk -->
            <!-- #$-:Please do not edit lines starting with "#$" -->
            <!-- #$VERSION:2.3 -->
            <!-- #$AUTHOR:nacho -->
            <area shape="poly" coords="92,99,248,74,257,96,420,113,578,79,592,87,582,286,565,282,565,268,546,266,465,310,466,367,463,763,453,1020,424,1045,349,1057,230,1062,104,1042,93,1022,93,768,90,423,85,229,86,103,86,105" data-toggle="modal" data-target="#exampleModal" onclick="updateImg(this.id)" id="tema-1-1"/>
            <area shape="poly" coords="953,471,962,369,948,368,953,251,977,271,1047,279,1170,273,1176,251,1281,298,1284,331,1276,737,1266,1053,1217,1062,1131,1078,1012,1066,997,1062,982,1034,964,937,956,885" data-toggle="modal" data-target="#exampleModal" onclick="updateImg(this.id)" id="tema-1-2" />
            <area shape="poly" coords="1547,1025,1620,1050,1740,1056,1858,1041,1860,305,1858,141,1876,99,1824,84,1692,78,1675,62,1676,48,1679,44,1689,48,1676,35,1647,42,1636,59,1640,74,1655,84,1660,106,1567,103,1568,96,1431,80,1431,223,1457,227,1557,267,1550,879,1551,879,1553,881,1553,879,1552,906" data-toggle="modal" data-target="#exampleModal" onclick="updateImg(this.id)" id="tema-1-3" />
        </map>

    </div>

    <div class="container" style="display: none">
        <div class="row">
            <div class="col-sm">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="Images/shelve-1.png" width="100%" class="img-responsive" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="Images/shelve-2.png" width="100%" class="img-responsive" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="Images/shelve-3.png" width="100%" class="img-responsive" alt="Third slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="Images/shelve-4.png" width="100%" class="img-responsive" alt="Fourth slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-sm">

            </div>
        </div>
    </div>

    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tema 1</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container image-modal">
                    <div class="row" style="position: absolute; top: 0; width: 100%; padding-top: 3%; padding-left: 7%; padding-right: 7%;">
                        <div class="col">
                            <p class="book-text" id="left-page">
                                La Biblioteca de la ULPGC es una entidad única que está formada por 13 Bibliotecas Temáticas (puntos de servicio especializados que generalmente encontrarás en cada escuela o facultad), la Biblioteca General y los Servicios Técnicos Centralizados (desde los que se mantiene la página web, se compran libros electrónicos, se dan clases para ayudarte a localizar la información que necesitas en cada momento, etc.).
                            </p>
                        </div>
                        <div class="col">
                            <p class="book-text" id="right-page">
                                Las Bibliotecas Temáticas ofrecen recursos y servicios comunes que puedes utilizar independientemente de los estudios que estés realizando. Como has visto en el vídeo, en ellas encontrarás la bibliografía que necesites para estudiar las asignaturas propias de tu titulación, no sólo los manuales básicos, sino también otras obras más especializadas.
                                El carné inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios.
                            </p>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="display: none">

        <div id="accordion">

            <div class="card">
                <div class="card-header" id="headingOne">
                    <h5 class="mb-0">
                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Tema 1 <%if (!user.getCompletedExams()[0]) {%><span class="badge badge-info">¡Nuevo!</span><%}%>
                        </button>
                    </h5>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Introducción</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Horario y equipamientos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Fondos</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <br><p>La _________________ es una entidad única que está formada por 13 Bibliotecas Temáticas (puntos de servicio especializados que generalmente encontrarás en cada escuela o facultad), la Biblioteca General y los Servicios Técnicos Centralizados (desde los que se mantiene la página web, se compran libros electrónicos, se dan clases para ayudarte a localizar la información que necesitas en cada momento, etc.).</p>
                                <p>Las Bibliotecas Temáticas ofrecen recursos y servicios comunes que puedes utilizar independientemente de los estudios que estés realizando. Como has visto en el vídeo, en ellas encontrarás la bibliografía que necesites para estudiar las asignaturas propias de tu titulación, no sólo los manuales básicos, sino también otras obras más especializadas.</p>
                                <p>El carné inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios.</p>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <br>
                                La _________________ abre 12 horas y media al día, de 8.15 a 20.45 horas, salvo la Biblioteca de Enfermería en Lanzarote, que tiene un horario específico. 
                                En periodos vacacionales, el horario de las bibliotecas se reduce, por lo que se recomienda consultarlo en la página Web de la _________________ y en el Campus Social.</p>
                                <p>
                                    La _________________ pone a tu alcance más de 2000 puestos de lectura, salas de trabajo en grupo. Además, existen salas de estudio abiertas las 24 horas, en los diferentes campus.</p>
                                <p>Dispones de ordenadores personales y portátiles con acceso a Internet, herramientas ofimáticas y software adaptado a las necesidades de cada centro, para su uso dentro del campus o para llevártelo a casa.  También tienes a tu disposición iPads.</p>
                            </div>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                <br><p>
                                    La Biblioteca pone a tu disposición una gran variedad de información, seleccionada y organizada para atender tus necesidades académicas. Puedes encontrar libros, revistas, vídeos, DVDs, CD-ROMs, CDs, mapas, separatas, tesis doctorales, microformas, etc. El catálogo de la Biblioteca te permite localizar todos estos documentos (ver Tema 4).</p>
                                <p>Nuestro fondo digital te ofrece revistas electrónicas, libros electrónicos, enciclopedias y diccionarios electrónicos, prensa y boletines oficiales, bases de datos y recursos web, etc. Faro es el portal que te da acceso a este fondo (consultar Tema 5).</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Tema 2 <%if (!user.getCompletedExams()[1]) {%><span class="badge badge-info">¡Nuevo!</span><%}%>
                        </button>
                    </h5>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Tema 3 <%if (!user.getCompletedExams()[2]) {%><span class="badge badge-info">¡Nuevo!</span><%}%>
                        </button>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingFour">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Tema 4 <%if (!user.getCompletedExams()[3]) {%><span class="badge badge-info">¡Nuevo!</span><%}%>
                        </button>
                    </h5>
                </div>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <!--
        <script>
                    $(document).ready(function () {
                        $('map').imageMapResize();
                    });
    
        </script>-->
    <script>
        function updateImg(id) {

            if (id === "tema-1-1") {
                $('#left-page').text('La Biblioteca de la ULPGC es una entidad única que está formada por 13 Bibliotecas Temáticas (puntos de servicio especializados que generalmente encontrarás en cada escuela o facultad), la Biblioteca General y los Servicios Técnicos Centralizados (desde los que se mantiene la página web, se compran libros electrónicos, se dan clases para ayudarte a localizar la información que necesitas en cada momento, etc.).');
                $('#right-page').text('Las Bibliotecas Temáticas ofrecen recursos y servicios comunes que puedes utilizar independientemente de los estudios que estés realizando. Como has visto en el vídeo, en ellas encontrarás la bibliografía que necesites para estudiar las asignaturas propias de tu titulación, no sólo los manuales básicos, sino también otras obras más especializadas. El carné inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios.');
            }


            if (id === "tema-1-2") {

                $('#left-page').text('La Biblioteca de la ULPGC abre 12 horas y media al día, de 8.15 a 20.45 horas, salvo la Biblioteca de Enfermería en Lanzarote, que tiene un horario específico. En periodos vacacionales, el horario de las bibliotecas se reduce, por lo que se recomienda consultarlo en la página Web de la Biblioteca de la ULPGC y en el Campus Social.');
                $('#right-page').text('La Biblioteca de la ULPGC pone a tu alcance más de 2000 puestos de lectura, salas de trabajo en grupo. Además, existen salas de estudio abiertas las 24 horas, en los diferentes campus. Dispones de ordenadores personales y portátiles con acceso a Internet, herramientas ofimáticas y software adaptado a las necesidades de cada centro, para su uso dentro del campus o para llevártelo a casa.  También tienes a tu disposición iPads.');

            }

            if (id === "tema-1-3") {
                $('#left-page').text('La Biblioteca pone a tu disposición una gran variedad de información, seleccionada y organizada para atender tus necesidades académicas. Puedes encontrar libros, revistas, vídeos, DVDs, CD-ROMs, CDs, mapas, separatas, tesis doctorales, microformas, etc. El catálogo de la Biblioteca te permite localizar todos estos documentos (ver Tema 4).');
                $('#right-page').text('Nuestro fondo digital te ofrece revistas electrónicas, libros electrónicos, enciclopedias y diccionarios electrónicos, prensa y boletines oficiales, bases de datos y recursos web, etc. Faro es el portal que te da acceso a este fondo (consultar Tema 5)');
            }
        }
    </script>

</body>
</html>