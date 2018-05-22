<%@page import="com.mycompany.multiplayerbiblio.Review"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <%
        User user = (User) request.getSession().getAttribute("user");
        int last_review_likes = UserManagement.getLastReviewLikes(user.id());
        System.out.println(last_review_likes);
    %>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color: white;">
                    <h3 class="mt-2 mb-4">Recomienda un libro</h3>
                    <form action="AddReviewServlet">
                        <div class="form-group">
                            <label for="book_name_input">Nombre del libro</label>
                            <input name="book_name" type="text" class="form-control" id="book_name_input" placeholder="Escribe aquí el nombre del libro del que vas a hablar.">
                        </div>
                        <div class="form-group">
                            <label for="book_name_input_2">Frase resumen</label>
                            <input name="quote" type="text" class="form-control" id="book_name_input_2" placeholder="Una frase directa con la que resumirías el libro.">
                        </div>
                        <div class="form-group">
                            <label for="review_text_area">Escribe tu crítica aquí.</label>
                            <textarea name="review_content" class="form-control" id="review_text_area" rows="10"></textarea>
                        </div>

                        <%if (last_review_likes < 10) {%>
                        <label for="button">Necesitas más 'me gusta' en tu anterior análisis para escribir uno nueva.</label>
                        <br><button class="btn btn-secondary" disabled>Enviar</button>
                        <%} else {%>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <%}%>

                    </form>
                </div>
                <hr class="mt-4" style="border-color: white; ">
                <div class="container" style="color: white;">
                    <h3 class="mt-2 mb-4">Tus otros análisis</h3>
                    <%
                        for (Review review : UserManagement.getUserReviews(user.id())) {%>

                    <div class="jumbotron" style="background-color: #333333; color:white;">
                        <h1 class="display-5"><%=review.getBook_name()%></h1>
                        <p class="lead"><%=review.getQuote()%></p>
                        <hr class="my-4" style="border-color: white;">
                        <p><%=review.getReview_content()%></p>
                        <p class="lead">
                            <a class="btn btn-danger"  onclick='confirmDelete(<%=review.getId()%>)' role="button">Eliminar análisis</a>
                        </p>
                    </div>
                    <%}
                    %>  
                </div>
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>


    <jsp:include page="footer-v2.jsp" />

    <script>
        function confirmDelete(id) {
            var ask = confirm("¿Seguro que quieres borrar este análisis?");
            if (ask) {
                window.location = "RemoveReviewServlet?id="+id;
            }
        }
    </script>

</body>
</html>