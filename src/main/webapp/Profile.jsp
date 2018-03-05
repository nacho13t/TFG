<%@page import="db.CareerManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>

<%
    User user = (User) session.getAttribute("user");
%>   

<h3 class="text-center"><%=user.username()%></h3><hr>
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
                %><option><%=career%></option><%
                    }
                %>
            </select>
            <small id="careerHelp" class="form-text text-muted">La carrera que estudias</small>
        </div>

            
        <div class="form-group">
            <label>
                <input type="radio" name="img-select" value="Images/avatar.png"/>
                <img class="img-responsive profileImageContainer rounded-circle" src="Images/avatar.png">
            </label>
            <label>
                <input type="radio" name="img-select" value="Images/virus.png" />
                <img class="img-responsive profileImageContainer rounded-circle" src="Images/virus.png">
            </label>
         <small id="imageHelp" class="form-text text-muted">Tu imagen de perfil, desbloquea más subiendo de nivel</small>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>

<div class="mt-2 text-center" id="editProfileButtonContainer">
    <button type="button" class="btn btn-secondary" id="editProfileButton" onClick="toggleEdit()">Editar</button>
</div>


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