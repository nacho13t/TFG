<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.ForumPost"%>
<%@page import="db.ForumManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TFG Foros</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    </head>
    <body>
        <% User user = (User) request.getSession().getAttribute("user");%>
        <div class="mb-2 text-white top-bar container-fluid">
            <div class="row">
                <div class="col text-center">
                    <img src="<%=user.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    <h5><%=user.nick()%></h5>
                </div> 
                <div class="text-center col d-inline-flex justify-content-center align-self-center">
                    <div>
                        <h5><%=user.career()%></h5>
                        <h5>Nivel <%=user.level()%></h5>
                    </div>
                </div>
                <div class="text-center col d-inline-flex justify-content-center align-self-center">

                    <form action="LogoutServlet">
                        <button class="btn btn-outline-light mb-2 btn-sm" type="submit"><span class="font-weight-bold" >Cerrar sesión</span></button>
                    </form>

                </div>
            </div>
        </div>

                    <div class="container">
            <h3><%=request.getParameter("name")%></h3>
            <%
                for (ForumPost post : ForumManagement.getPosts(Integer.parseInt(request.getParameter("threadid")))) {
                    %>
                    <hr>
                    <h4><%=UserManagement.getUserNick(post.getUser_id())%></h4>
                    <p><%= post.getBody()%></p>
            <%
                }
            %>
            <a href="mainScreen.jsp">Volver</a>
                    </div>            

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    </body>
</html>
