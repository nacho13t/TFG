<%@page import="db.UserManagement"%>
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #333333">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="row">
                    <div class="col-sm mt-2">
                        <h5 class="text-center" style="color: white">Usuarios</h5>
                        <ul class="list-group">
                            <ul class="list-group">

                                <%
                                    int i = 1;
                                    for (Entry<String, Integer> entry : UserManagement.getTopLvlUsers().entrySet()) {%>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <%=entry.getKey()%>
                                    <span class="badge badge-primary badge-pill bg-danger">Nv. <%=entry.getValue()%></span>
                                </li>  
                                <%
                                        if (i >= 10) {
                                            break;
                                        }
                                        i++;
                                    }
                                %> 
                            </ul>
                        </ul>
                    </div>
                    <div class="col-sm mt-2">
                        <h5 class="text-center" style="color: white">Carreras</h5>
                        <ul class="list-group">
                            <ul class="list-group">

                                <%
                                    i = 1;
                                    for (Entry<String, Integer> entry : CareerManagement.getTopCareers().entrySet()) {%>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <%=entry.getKey()%>
                                    <span class="badge badge-primary badge-pill bg-success"><%=entry.getValue()%> usuarios</span>
                                </li>  
                                <%
                                        if (i >= 10) {
                                            break;
                                        }
                                        i++;
                                    }
                                %> 
                            </ul>
                        </ul>
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
                    <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Medallas</a>
                    <a href="Inventario-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
                    <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Libros recomendados</a>
                    <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
                    <% if (user.level() >= 4) { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
                    <% } else { %>
                    <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro</a>
                    <%}%>
                </div> 
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>