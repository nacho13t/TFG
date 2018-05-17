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
            <div class="col-sm-12 col-md-4">
                <div class="row mt-4 mr-1" style="cursor: pointer">
                    <div class="col-5 text-center">
                        <img src="<%=user.image()%>" onClick="location.href = 'Profile-v2.jsp'" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    </div> 
                    <div class="col-7">
                        <h5 style="color: white" mt-2><%= user.nick()%></h5>
                        <h5 style="color: white" mt-2><%= user.career()%></h5>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-center pr-3">

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
                    <a href="#" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro (Nivel 4)</a><%}%>
                </div> 
            </div>
        </div>
    </div>


    <jsp:include page="footer-v2.jsp" />


</body>
</html>