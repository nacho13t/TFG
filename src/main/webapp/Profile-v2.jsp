<%@page import="com.mycompany.multiplayerbiblio.ForumPost"%>
<%@page import="db.ForumManagement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<%@page import="db.UserManagement"%>
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8" style="color: white;">
                <div class="container mt-3">
                    <h3 class="text-center"><%=user.username()%></h3><hr style="border-color: white;">
                    <div id="profileInfo" class="text-center">
                        <h5><i> <%=user.nick()%></i></h5>
                        <h5><i><%=user.career()%></i></h5>
                        <h5><i><%=user.examStats()%> cuestionarios completados</i></h5>
                        <h5><i><%=user.medalStats()%> medallas obtenidas</i></h5>
                    </div>

                    <div id="editProfile" style="display: none">
                        <h4>Edita tu perfil</h4>
                        <form action="UpdateProfileServlet" accept-charset="UTF-8">
                            <div class="form-group">
                                <label for="inputName">Nick</label>
                                <input type="userName" class="form-control" id="inputName" name="inputName" aria-describedby="nameHelp" value="<%=user.nick()%>">
                                <small id="nameHelp" class="form-text text-muted">Este es tu Nick</small>
                            </div>
                            <div class="form-group">
                                <label for="inputCareer">Carrera</label>
                                <select id="inputCareer" name="inputCareer" class="form-control" aria-describedby="careerHelp" value="<%=user.career()%>">
                                    <%
                                        for (String career : CareerManagement.getCareerNames()) {
                                    %><option <%if(user.career().equals(career))out.write("selected");%>><%=career%></option><%
                                        }
                                    %>
                                </select>
                                <small id="careerHelp" class="form-text text-muted">La carrera que estudias</small>
                            </div>


                            <div class="form-group">
                                <%
                        for (String image : UserManagement.unlockedImages(user.id())) {%>
                                <label>
                                    <input type="radio" name="img-select" <% if (user.image().equals("Images/" + image)) {
                                            out.write("checked");
                                        }%> value="Images/<%=image%>"/>
                                    <img class="img-responsive profileImageContainer rounded-circle" src="Images/<%=image%>">
                                </label>
                                <%}%>  
                                <small id="imageHelp" class="form-text text-muted">Tu imagen de perfil.</small>
                                <div>
                                    <%
                            for (String image : UserManagement.lockedImages(user.id())) {%>

                                    <img src="Images/<%=image%>" class="img-responsive profileImageContainer lockImg rounded-circle" alt="Todas las imágenes desbloqueadas">

                                    <%}%>
                                </div>
                                <small id="imageHelp" class="form-text text-muted">Desbloquea imágenes subiendo de nivel, consiguiendo medallas o abriendo cajas de recompensa.</small>
                            </div>

                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </form>

                    </div>

                    <div class="mt-2 text-center" id="editProfileButtonContainer">
                        <button type="button" class="btn btn-secondary" id="editProfileButton" onClick="toggleEdit()">Editar</button>
                    </div>

                </div>
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

                <div class="d-flex flex-row justify-content-center pr-2">

                    <div class="mt-3"><span class="rounded-circle border border-white" style="background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level()%></span></div>
                    <div class="mt-4 progress w-75">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
                    </div>
                    <div class="mt-3"><span class="rounded-circle border border-white" style=" background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level() + 1%></span></div>

                </div>

                <div class="list-group align-items-center menu-right align-middle mt-4 pr-3">
                    <a href="Content.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Biblioteca</a>
                    <a href="Rankings-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Rankings</a>
                    <a href="Inventario-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
                    <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
                    <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Medallas</a>
                    <% if (user.level() >= 4) { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
                    <% } else { %>
                    <a href="#" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro (Nivel 4)</a> <%}%>
                </div> 
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>

    <jsp:include page="footer-v2.jsp" />
    
        <script>
        function toggleEdit() {
            jQuery('#editProfile').toggle();
            jQuery('#profileInfo').toggle();
            if ($('#editProfile').is(':visible')) {
                jQuery('#editProfileButton').text("Cancelar");
                jQuery('#editProfileButtonContainer').removeClass("text-center");
            } else {
                jQuery('#editProfileButton').text("Editar");
                jQuery('#editProfileButtonContainer').addClass("text-center");
            }
        }
    </script>

</body>
</html>