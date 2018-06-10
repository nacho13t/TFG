<%@page import="com.mycompany.multiplayerbiblio.Book"%>
<%@page import="db.CareerManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container">
                    <h4 style="color:white;">Estos son algunos de los libros recomendados para tu carrera</h4>
                    <%for (Book book : CareerManagement.getCareerRecommendedBooks(user.career())) {
                    %><p style="color:white;"><%=book.getName()%> - <a target="_blank" onclick="checkBook()" href="<%=book.getUrl()%>">Ver en la biblioteca</a></p>
                    <%}%>
                </div>
            </div>
            <jsp:include page="Sidebar.jsp" />
        </div>
    </div>
    <jsp:include page="footer-v2.jsp" />
</body>
</html>