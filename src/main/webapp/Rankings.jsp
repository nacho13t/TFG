<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page import="db.UserManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h3 class="text-center">Rankings</h3>
<div class="container">
    <div class="row">
        <div class="col-sm">
        <h5 class="text-center">Usuarios</h5>
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
        <div class="col-sm">
            <h5 class="text-center">Carreras</h5>
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