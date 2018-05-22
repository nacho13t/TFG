<%@page import="com.mycompany.multiplayerbiblio.Review"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color: white;">

                    <% Review review = UserManagement.getReview(Integer.parseInt(request.getParameter("id_review")));%>
                    <div class="jumbotron" style="background-color: #333333; color:white;">
                        <h1 class="display-5"><%=review.getBook_name()%> - Recomendado por <%=UserManagement.getUserNick(review.getUser_id())%></h1>
                        <p class="lead"><%=review.getQuote()%></p>
                        <hr class="my-4" style="border-color: white;">
                        <p><%=review.getReview_content()%></p><br>
                        <% if (!review.likeByUser(user.id())) {%>
                        <a href="GiveLikeServlet?id=<%=review.getId()%>&url=<%=request.getRequestURI()%>"><i class="far fa-heart fa-3x"></i></a>
                            <%} else {%>
                        <a href="RemoveLikeServlet?id=<%=review.getId()%>&url=<%=request.getRequestURI()%>"><i class="fas fa-heart fa-3x"></i></a>
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