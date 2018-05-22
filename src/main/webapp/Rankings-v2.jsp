
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                 <div class="row">
                    <div class="col-sm mt-2">
                        <h5 class="text-center" style="color: white">Usuarios</h5>
                        <ul class="list-group">
                            <div class="list-group">

                                <%
                                    int i = 1;
                                    for (Entry<String, Integer> entry : UserManagement.getTopLvlUsers().entrySet()) {%>
                                <a href="ExploreProfile-v2.jsp?username=<%=entry.getKey()%>" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" style="background-color: #333333; color: white;"><%=entry.getKey()%>
                                    <span class="badge badge-primary badge-pill bg-danger">Nv. <%=entry.getValue()%></span></a>
                                    <%
                                            if (i >= 10) {
                                                break;
                                            }
                                            i++;
                                        }
                                    %> 
                            </div>
                        </ul>
                    </div>
                    <div class="col-sm mt-2">
                        <h5 class="text-center" style="color: white">Carreras</h5>
                        <ul class="list-group">
                            <ul class="list-group">

                                <%
                                    i = 1;
                                    for (Entry<String, Integer> entry : CareerManagement.getTopCareers().entrySet()) {%>
                                <li class="list-group-item d-flex justify-content-between align-items-center" style="background-color: #333333; color: white;">
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
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>

    <jsp:include page="footer-v2.jsp" />

</body>
</html>