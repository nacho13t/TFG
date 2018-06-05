<%@page import="com.mycompany.multiplayerbiblio.User"%>
<% User user = (User) request.getSession().getAttribute("user");%>

<div class="col-sm-12 col-md-4">
    <div class="row mt-4 mr-1" style="cursor: pointer">
        <div class="col-5 text-center">
            <img src="<%=user.image()%>" onClick="location.href = 'Profile-v2.jsp'" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
        </div> 
        <div class="col-7">
            <h5 style="color: white" mt-2><%= user.nick()%></h5>
            <h5 style="color: white" mt-2><%= user.career()%></h5>
        </div>
    </div>

    <div class="d-flex flex-row justify-content-center pr-2">

        <div class="mt-3"><span class="rounded-circle border border-white" style="background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level()%></span></div>
        <div class="mt-4 progress w-75">
            <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div class="mt-3"><span class="rounded-circle border border-white" style=" background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level() + 1%></span></div>

    </div>

    <div class="list-group align-items-center menu-right align-middle mt-4 pr-3">
        <a href="Content.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Biblioteca</a>
        <a href="Rankings-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Rankings</a>
        <a href="Inventario-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Inventario</a>
        <a href="RecommendedBooks-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Bibliografía recomendada</a>
        <a href="RecommendABook.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Recomienda un libro</a>
        <a href="Messages-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Mensajes</a>
        <a href="Medals-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light ">Medallas</a>
        <% if (user.level() >= 4) { %>
        <a href="Forum-v2.jsp" class="list-group-item list-group-item-action list-group-item-dark border border-light">Foro</a>
        <% } else { %>
        <a href="#" class="list-group-item list-group-item-action list-group-item-dark border border-light disabled">Foro (Nivel 4)</a><%}%>
    </div> 

    <div class="container mt-3">
        <a href="https://twitter.com/bulpgc?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-lang="es" data-show-count="false">Follow @bulpgc</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <a href="https://twitter.com/intent/tweet?screen_name=bulpgc&ref_src=twsrc%5Etfw" class="twitter-mention-button" data-lang="es" data-show-count="false">Tweet to @bulpgc</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <a class="twitter-timeline" data-lang="es" data-height="400" data-theme="dark" href="https://twitter.com/bulpgc?ref_src=twsrc%5Etfw">Tweets by bulpgc</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    </div>
</div>
