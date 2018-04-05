<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    
    <h3 class="text-center">Contenido</h3>

    <div class="container">

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
    
</body>
</html>