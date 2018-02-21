<%@page import="com.mycompany.multiplayerbiblio.Utilities"%>
<%@page import="com.mycompany.multiplayerbiblio.Book"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<%
    User user = (User) session.getAttribute("user");
%>

<div class="container">
    <h4>Estos son algunos de los libros recomendados para tu carrera</h4>
    <%
        Book[] books = Utilities.books(user.carreer());
        if (books != null) {
            for (Book book : books) {
    %><p><%= book.getName()%> - <a target="_blank" onclick="checkBook()" href="<%=book.getUrl()%>">Ver en la biblioteca</a></p>
    <%}
        }%>
        
</div>

