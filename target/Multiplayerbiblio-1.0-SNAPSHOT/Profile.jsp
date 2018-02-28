<%@page import="db.CareerManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%
    User user = (User) session.getAttribute("user");
%>   

<div id="profileInfo">
    <h5>Nombre de usuario: <%=user.username()%></h5>
    <h5>Nick: <%=user.nick()%></h5>
    <h5>Carrera: <%=user.career()%></h5>
    <h5>Cuestionarios completados: <%=user.examStats()%></h5>
    <h5>Medallas obtenidas: <%=user.medalStats()%></h5>
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
                %><option><%=career%></option><%
                                }
                %>
            </select>
            <small id="careerHelp" class="form-text text-muted">La carrera que estudias</small>
        </div>
        <div class="form-group">
            <label for="inputImage">Imagen</label>
            <input type="userImage" class="form-control" id="inputImage" name="inputImage"  aria-describedby="imageHelp" value="<%=user.image()%>">
            <small id="imageHelp" class="form-text text-muted">Tu imagen de perfil, añade la ruta al archivo en tu pc</small>
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>

<div class="mt-2">
    <button type="button" class="btn btn-secondary" id="editProfileButton" onClick="toggleEdit()">Editar</button>
</div>


<script>
    function toggleEdit() {
        jQuery('#editProfile').toggle();
        jQuery('#profileInfo').toggle();
        if ($('#editProfile').is(':visible')) {
            jQuery('#editProfileButton').text("Cancelar");
        } else {
            jQuery('#editProfileButton').text("Editar");
        }
    }
</script>