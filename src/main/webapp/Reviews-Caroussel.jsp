<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%@page import="com.mycompany.multiplayerbiblio.Review"%>
<%@page import="java.util.List"%>
<%@page import="db.UserManagement"%>
<div class="container" style="background-color: rgba(0,0,0,0.4); color:white; border-style: solid; border-color: white; border-radius: 1px;">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">

            <% User user = (User) request.getSession().getAttribute("user");
                List<Review> reviews;
                if (request.getSession().getAttribute("reviews") == null) {
                    reviews = UserManagement.getAllReviews();
                } else {
                    reviews = (List<Review>) request.getSession().getAttribute("reviews");
                }


            %>

            <div class="carousel-item active p-4 text-center">
                <blockquote class="blockquote">
                    <a class="mb-0" href="ReviewView.jsp?id_review=<%=reviews.get(0).getId()%>"><%=reviews.get(0).getBook_name()%> - <%=reviews.get(0).getQuote()%></a>
                    <p><%=reviews.get(0).getLikes()%> <i class="fas fa-heart"></i></p>
                </blockquote>
            </div>

            <%
                reviews.remove(0);
                for (Review review : reviews) {%>
            <div class="carousel-item p-4 text-center">
                <blockquote class="blockquote">
                    <a class="mb-0" href="ReviewView.jsp?id_review=<%=review.getId()%>"><%=review.getBook_name()%> - <%=review.getQuote()%></a>
                    <p><%=review.getLikes()%> <i class="fas fa-heart"></i></p>
                </blockquote>
            </div>
            <%}
            %>
            <a class="carousel-control-prev" href="#carouselExampleSlidesOnly" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleSlidesOnly" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>