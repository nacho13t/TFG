<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.UserManagement"%>
<%@page import="com.mycompany.multiplayerbiblio.ForumThread"%>
<%@page import="db.ForumManagement"%>

<h3 class="text-center">Foro</h3>
<%
    for (ForumThread thread : ForumManagement.getThreads()) {
%><a href="ThreadDisplay.jsp?name=<%=thread.getTitle()%>&threadid=<%=thread.getId()%>"><%=thread.getTitle()%> - <%=UserManagement.getUserNick(thread.getUser_id())%> - <%=new SimpleDateFormat("dd/MM/yyyy").format(thread.getDate())%></a><%
    }
%>
