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
                <div class="container clearfix">
                    <h3 class="text-center" style="color: white;">¡Consigue medallas completando retos!</h3>
                    <%
                        for (Medal medal : UserManagement.getAllMedals()) {
                            if (user.hasMedal(medal.getId())) {
                    %>
                    <img id="medals" class="img-responsive" src="<%=medal.getImage()%>" alt="<%=medal.getName()%>" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<h5><%=medal.getName()%></h5><p><%=medal.getDescription()%></p><p><%=user.getMedalDate(medal.getId())%></p>">
                    <%
                    } else {%>
                    <img style="filter: grayscale(100%);-webkit-filter: grayscale(100%);" id="medals" class="img-responsive" src="<%=medal.getImage()%>" alt="<%=medal.getName()%>" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<h4>Bloqueada</h4><h5><%=medal.getName()%></h5><p><%=medal.getDescription()%></p>">      
                    <%}
                        }
                    %>    
                    <hr>

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