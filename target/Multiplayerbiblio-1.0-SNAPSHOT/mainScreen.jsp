<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.LevelUnlocks"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">

    <jsp:include page="header.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>


    <div class="container">
        <img src="Images/worldmap.jpg" width="100%" border="0" usemap="#map" />

        <map name="map">
            <!-- #$-:Image map file created by GIMP Image Map plug-in -->
            <!-- #$-:GIMP Image Map plug-in by Maurits Rijk -->
            <!-- #$-:Please do not edit lines starting with "#$" -->
            <!-- #$VERSION:2.3 -->
            <!-- #$AUTHOR:nacho -->
            <area shape="poly" coords="711,483,710,476,708,472,711,468,711,456,709,453,714,450,713,448,715,449,742,451,762,458,754,463,749,467,748,471,749,475,746,479,743,481,738,485,730,484,726,486,723,489,718,481,715,482" data-toggle="tooltip" title="Tooltip on top"/>
            <area shape="poly" coords="1380,797,1387,801,1393,797,1401,801,1409,793,1414,794,1416,783,1423,778,1422,771,1427,765,1429,754,1430,748,1427,738,1415,727,1411,720,1400,712,1392,695,1384,690,1383,679,1378,689,1378,701,1373,706,1350,695,1356,685,1340,683,1337,680,1339,684,1331,683,1324,691,1327,695,1318,696,1312,691,1287,713,1255,723,1255,739,1254,749,1261,769,1261,778,1275,783,1285,776,1299,778,1310,769,1335,767,1341,767,1351,783,1362,772,1371,791" data-toggle="popover" title="Arquitectura" data-content="Número de alumnos: 5 Nivel medio: 10"/>
        </map>

    </div>


    <h3 class="text-center">Rankings</h3>

    <div class="container">
        <div class="row">
            <div class="col-sm mt-2">
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
            <div class="col-sm mt-2">
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

    <jsp:include page="footer.jsp" />

    <script>
        $(document).ready(function () {
            $('map').imageMapResize();
        });
    </script>

</body>
</html>