<%@page import="db.CareerManagement"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container mt-3" style="color:white;">
                    <h3 class="text-center"><%=user.username()%></h3><hr style="border-color: white;">
                    <div id="profileInfo" class="text-center">
                        <h5><i> <%=user.nick()%></i></h5>
                        <h5><i><%=user.career()%></i></h5>
                        <h5><i><%=CareerManagement.getLibraryName(user.career())%></i></h5>
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
                                    %><option <%if (user.career().equals(career)) {
                                            out.write("selected");
                                        }%>><%=career%></option><%
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
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

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