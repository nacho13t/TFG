<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page import="db.UserManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h3>Ranking de usuarios</h3>
<div>
    <ul class="list-group">
        <ul class="list-group">

            <%
            int i = 1;
            for (Entry<String, Integer> entry : UserManagement.getTopLvlUsers().entrySet()) {%>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <%=entry.getKey()%>
                <span class="badge badge-primary badge-pill">Nv. <%=entry.getValue()%></span>
            </li>  
            <%
                if(i>=10) break;
                i++;
            }
            %> 
        </ul>
    </ul>
</div>