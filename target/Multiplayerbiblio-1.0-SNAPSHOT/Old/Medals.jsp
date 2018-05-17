
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<!doctype html>
<html lang="en">

    <jsp:include page="header.jsp" />

    <div class="container clearfix">
        <h3 class="text-center">¡Consigue medallas completando retos!</h3>
        <%
            User user = (User) session.getAttribute("user");
            for (Medal medal : user.medals()) {
                if (medal != null) {
        %>

        <div class="float-left">
            <div class="card" style="width: 10rem;">
                <img class="img-responsive" src="<%=medal.getImage()%>" alt="<%=medal.getName()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=medal.getName()%></h5>
                    <p class="card-text"><%=medal.getDescription()%></p>
                    <p class="card-text">Conseguido el <%=medal.getDate()%></p>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>    
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>