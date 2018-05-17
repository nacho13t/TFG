<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <%
                    User target = UserManagement.getUser(request.getParameter("username"));
                    if (target.id() == user.id()) {
                        request.getRequestDispatcher("Profile-v2.jsp").forward(request, response);
                    }
                %>
                <div class="container mt-3" style="color: white; background-color: #333333">
                    <div class="p-2">
                        <img src="<%=target.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    </div> 
                    <div id="profileInfo" class=" p-2">
                        <h5><i><%=target.nick()%></i></h5>
                        <h5><i>Nombre de usuario: <%=target.username()%></i></h5>
                        <h5><i> Nv. <%=target.level()%></i></h5>
                        <h5><i>Carrera: <%=target.career()%></i></h5>
                        <h5><i><%=target.examStats()%> cuestionarios completados</i></h5>
                        <h5><i><%=target.medalStats()%> medallas obtenidas</i></h5>
                    </div>
                    <hr style="border-color: white">
                    <div class="p-2">
                        <% for (Medal medal : target.medals()) {
                               if (medal != null) {%>
                        <img id="medals" class="img-responsive" src="<%=medal.getImage()%>" alt="<%=medal.getName()%>" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<h5><%=medal.getName()%></h5><p><%=medal.getDescription()%></p><p><%=medal.getDate()%></p>">
                        <% }
                               }%>

                    </div>
                </div>
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

    <jsp:include page="footer-v2.jsp" />

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

</body>
</html>