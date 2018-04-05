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
                            Tema 1 <%if (!user.getCompletedExams()[0]) {%><span class="badge badge-info">�Nuevo!</span><%}%>
                        </button>
                    </h5>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Introducci�n</a>
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
                                <br><p>La _________________ es una entidad �nica que est� formada por 13 Bibliotecas Tem�ticas (puntos de servicio especializados que generalmente encontrar�s en cada escuela o facultad), la Biblioteca General y los Servicios T�cnicos Centralizados (desde los que se mantiene la p�gina web, se compran libros electr�nicos, se dan clases para ayudarte a localizar la informaci�n que necesitas en cada momento, etc.).</p>
                                <p>Las Bibliotecas Tem�ticas ofrecen recursos y servicios comunes que puedes utilizar independientemente de los estudios que est�s realizando. Como has visto en el v�deo, en ellas encontrar�s la bibliograf�a que necesites para estudiar las asignaturas propias de tu titulaci�n, no s�lo los manuales b�sicos, sino tambi�n otras obras m�s especializadas.</p>
                                <p>El carn� inteligente y la cuenta institucional que obtienes cuando te matriculas en la ULPGC, te dan acceso a todos los servicios.</p>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <br>
                                La _________________ abre 12 horas y media al d�a, de 8.15 a 20.45 horas, salvo la Biblioteca de Enfermer�a en Lanzarote, que tiene un horario espec�fico. 
                                En periodos vacacionales, el horario de las bibliotecas se reduce, por lo que se recomienda consultarlo en la p�gina Web de la _________________ y en el Campus Social.</p>
                                <p>
                                    La _________________ pone a tu alcance m�s de 2000 puestos de lectura, salas de trabajo en grupo. Adem�s, existen salas de estudio abiertas las 24 horas, en los diferentes campus.</p>
                                <p>Dispones de ordenadores personales y port�tiles con acceso a Internet, herramientas ofim�ticas y software adaptado a las necesidades de cada centro, para su uso dentro del campus o para llev�rtelo a casa.  Tambi�n tienes a tu disposici�n iPads.</p>
                            </div>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                <br><p>
                                    La Biblioteca pone a tu disposici�n una gran variedad de informaci�n, seleccionada y organizada para atender tus necesidades acad�micas. Puedes encontrar libros, revistas, v�deos, DVDs, CD-ROMs, CDs, mapas, separatas, tesis doctorales, microformas, etc. El cat�logo de la Biblioteca te permite localizar todos estos documentos (ver Tema 4).</p>
                                <p>Nuestro fondo digital te ofrece revistas electr�nicas, libros electr�nicos, enciclopedias y diccionarios electr�nicos, prensa y boletines oficiales, bases de datos y recursos web, etc. Faro es el portal que te da acceso a este fondo (consultar Tema 5).</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Tema 2 <%if (!user.getCompletedExams()[1]) {%><span class="badge badge-info">�Nuevo!</span><%}%>
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
                            Tema 3 <%if (!user.getCompletedExams()[2]) {%><span class="badge badge-info">�Nuevo!</span><%}%>
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
                            Tema 4 <%if (!user.getCompletedExams()[3]) {%><span class="badge badge-info">�Nuevo!</span><%}%>
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