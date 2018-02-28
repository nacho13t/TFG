<%@page import="db.CareerManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%
    User user = (User) session.getAttribute("user");
%>

<div class="container">
    <h4>Estos son algunos de los libros recomendados para tu carrera</h4>
    <%
        String[] books = CareerManagement.getCareerRecommendedBooks(user.career());
        if (books != null) {
            for (String book : books) {
    %><p><%=book.split("½")[0]%> - <a target="_blank" onclick="checkBook()" href="<%=book.split("½")[1]%>">Ver en la biblioteca</a></p>
    <%}
        }%>

</div>

