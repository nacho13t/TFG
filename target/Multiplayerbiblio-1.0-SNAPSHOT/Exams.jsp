<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">

    <jsp:include page="header.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    
    <h3 class="text-center">Cuestionarios</h3>

    
    <div class="container">
        <div class="row">
            <div class="nav flex-column nav-pills col-sm" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Tema 1 <%if (user.getCompletedExams()[0]) {%><span class="badge badge-success">¡Completado!</span><%}%></a>
                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Tema 2 <%if (user.getCompletedExams()[1]) {%><span class="badge badge-success">¡Completado!</span><%}%></a>
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Tema 3 <%if (user.getCompletedExams()[2]) {%><span class="badge badge-success">¡Completado!</span><%}%></a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Tema 4 <%if (user.getCompletedExams()[3]) {%><span class="badge badge-success">¡Completado!</span><%}%></a>
            </div>
            <div class="tab-content col-sm" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                    <p>En este cuestionario evaluarás tus conocimientos sobre el Tema 1. ¡Complétalo con la máxima nota para obtener 100 puntos de experiencia!</p>
                    <form name="loginForm" method="post" action="DisplayExamServlet">
                        <input type="hidden" name="exam" value="tema1Exam">
                        <input type="hidden" name="points" value="100">
                        <button type="submit" class="btn btn-success">Comenzar</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                    <p>En este cuestionario evaluarás tus conocimientos sobre el Tema 2. ¡Complétalo con la máxima nota para obtener 200 puntos de experiencia!</p>
                    <form name="loginForm" method="post" action="DisplayExamServlet">
                        <input type="hidden" name="exam" value="tema2Exam">
                        <input type="hidden" name="points" value="200">
                        <button type="submit" class="btn btn-success">Comenzar</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                    <p>En este cuestionario evaluarás tus conocimientos sobre el Tema 3. ¡Complétalo con la máxima nota para obtener 250 puntos de experiencia!</p>
                    <form name="loginForm" method="post" action="DisplayExamServlet">
                        <input type="hidden" name="exam" value="tema3Exam">
                        <input type="hidden" name="points" value="1500">
                        <button type="submit" class="btn btn-success">Comenzar</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                    <p>En este cuestionario evaluarás tus conocimientos sobre el Tema 4. ¡Complétalo con la máxima nota para obtener 300 puntos de experiencia!</p>
                    <form name="loginForm" method="post" action="DisplayExamServlet">
                        <input type="hidden" name="exam" value="tema4Exam">
                        <input type="hidden" name="points" value="1000">
                        <button type="submit" class="btn btn-success">Comenzar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>