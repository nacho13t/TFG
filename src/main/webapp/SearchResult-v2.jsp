<%@page import="java.util.List"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color: white;">
                    Resultados de la búsqueda:<br>
                    <%List<User> searching = (List<User>) request.getSession().getAttribute("search");%>
                    <div class="list-group">
                        <%for (User result : searching) {%>
                        <a href="ExploreProfile-v2.jsp?username=<%=result.username()%>" class="list-group-item list-group-item-action" style="background-color: #333333; color: white;"><%=result.nick()%>
                            <span class="badge badge-primary badge-pill bg-danger">Nv. <%=result.level()%></span></a>
                            <%}%>
                    </div>
                </div>
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>