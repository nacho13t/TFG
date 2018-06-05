<%@page import="com.mycompany.multiplayerbiblio.Review"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <%
        User user = (User) request.getSession().getAttribute("user");
        int last_review_likes = UserManagement.getLastReviewLikes(user.id());
    %>
    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color: white;">
                    <h3 class="mt-2 mb-4">Recomienda un libro</h3>
                    <form action="AddReviewServlet" onsubmit="return validateReview(this)" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="book_name_input">Título del libro</label>
                            <input name="book_name" type="text" class="form-control" id="book_name_input" placeholder="Escribe aquí el título del libro del que vas a hablar.">
                        </div>
                        <div class="form-group">
                            <label for="book_name_input_2">Autor</label>
                            <input name="quote" type="text" class="form-control" id="book_name_input_2" placeholder="Autor del libro.">
                        </div>
                        <div class="form-group">
                            <label for="review_text_area">Escribe tu recomendación aquí.</label>
                            <textarea name="review_content" class="form-control" id="review_text_area" rows="10"></textarea>
                        </div>

                        <%if (last_review_likes < 10) {%>
                        <label for="button">Necesitas más 'me gusta' en tu anterior recomendación para escribir una nueva.</label>
                        <br><button class="btn btn-secondary" disabled>Enviar</button>
                        <%} else {%>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <%}%>

                    </form>
                </div>
                <hr class="mt-4" style="border-color: white; ">
                <div class="container" style="color: white;">
                    <h3 class="mt-2 mb-4">Tus otras recomendaciones</h3>
                    <%
                        for (Review review : UserManagement.getUserReviews(user.id())) {%>

                    <div class="jumbotron" style="background-color: #333333; color:white;">
                        <h1 class="display-5"><%=review.getBook_name()%></h1>
                        <p class="lead"><%=review.getQuote()%></p>
                        <hr class="my-4" style="border-color: white;">
                        <p><%=review.getReview_content()%></p>
                        <p style="text-align: right"><%=review.getLikes()%> <i class="fas fa-heart"></i></p>
                        <p class="lead">
                            <a class="btn btn-danger"  onclick='confirmDelete(<%=review.getId()%>)' role="button">Eliminar recomendación</a>
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
            var ask = confirm("¿Seguro que quieres borrar esta recomendación?");
            if (ask) {
                window.location = "RemoveReviewServlet?id=" + id;
            }
        }

        function validateReview(form) {
            if (form.elements[0].value === "") {
                alert("Introduce el título del libro");
                return false;
            }
            
            if (form.elements[1].value === "") {
                alert("Escribe el autor del libro");
                return false;
            }
            
            if (form.elements[2].value === "") {
                alert("Escribe tu opinión sobre el libro.");
                return false;
            }

            if (form.elements[2].value.length > 10000) {
                alert("El texto es demasiado extenso.");
                return false;
            }

            return true;
        }
    </script>

</body>
</html>