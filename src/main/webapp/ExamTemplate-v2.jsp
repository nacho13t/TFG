<%@page import="com.mycompany.multiplayerbiblio.Question"%>
<%@page import="com.mycompany.multiplayerbiblio.Exam"%>
<%@page import="com.mycompany.multiplayerbiblio.Medal"%>
<%@page import="db.UserManagement"%>
<%@page import="db.CareerManagement"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="en">
    <jsp:include page="header-v2.jsp" />

    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="container-fluid p-4" style="background-color: #000">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <div class="container" style="color:white;">
                    <form method="post" action="ReviseExamServlet">
                        <%
                            int avaiableJokers = 0;
                            if ((user.inventory().getJokers() > 0) && ((request.getSession().getAttribute("examInProgress") == null) || (request.getSession().getAttribute("examInProgress").equals("false")))) {
                                avaiableJokers = 1;
                            }
                            int count = 1;
                            Exam exam = (Exam) request.getAttribute("questionnaire");
                        %><h2><%= exam.name()%></h2><%
                            for (Question question : exam.getQuestions()) {
                        %><br><p><%= question.statement()%>
                            <%
                                if (avaiableJokers != 0) {
                            %><img src="Images/joker.png" class="img-responsive examJoker rounded-circle p-2" alt="joker" id="<%="jkr" + count%>" onclick="showJokerButton(<%="btn" + count%>)">
                            <button style="display: none" type="button" id="<%="btn" + count%>" class="btn btn-info btn-sm jokerButton" onclick="useJoker(<%="spn" + count%>)">Usar comodín</button>
                            <%}%>
                            <span style="color: blueviolet; display: none" id="<%="spn" + count%>">Respuesta correcta: <%=question.correctOption() + 1%> </span>
                        </p>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="<%="options" + count%>" id="<%="question" + count + "first"%>" value="<% if (question.correctOption() == 0) {%><%= 1%><% } else {%><%= 0%><% }%>" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                1. <%=question.options()[0]%>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="<%="options" + count%>" id="<%="question" + count + "second"%>" value="<% if (question.correctOption() == 1) {%><%= 1%><% } else {%><%= 0%><% }%>">
                            <label class="form-check-label" for="exampleRadios2">
                                2. <%=question.options()[1]%>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="<%="options" + count%>" id="<%="question" + count + "third"%>" value="<% if (question.correctOption() == 2) {%><%= 1%><% } else {%><%= 0%><% }%>">
                            <label class="form-check-label" for="exampleRadios3">
                                3. <%=question.options()[2]%>
                            </label>
                        </div>
                        <%count++;
                            }%> 


                        <input type="hidden" name="answersCount" value="<%=count%>">
                        <input type="hidden" name="examId" value="<%=exam.id()%>">
                        <input type="hidden" name="points" value="<%=request.getParameter("points")%>">
                        <input type="hidden" name="jokerUsed" value="false">
                        <br><button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>

            <div class="col-sm-12 col-md-4">
                <div class="row mt-4 mr-1">
                    <div class="col-5 text-center">
                        <img src="<%=user.image()%>" class="img-responsive profileImageContainer rounded-circle" alt="Profile image">
                    </div> 
                    <div class="col-7">
                        <h5 style="color: white" mt-2><%= user.nick()%></h5>
                        <h5 style="color: white" mt-2><%= user.career()%></h5>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-center pr-2">
                    <div class="mt-3"><span class="rounded-circle border border-white" style="background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level()%></span></div>
                    <div class="mt-4 progress w-75">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=user.percetage()%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%=user.percetage()%> %</div>
                    </div>
                    <div class="mt-3"><span class="rounded-circle border border-white" style=" background-color:#333333; border-width: 3px !important; font-size: 23px; color:white;"><%= user.level() + 1%></span></div>
                </div>

                <div style="color: white" class="mt-4">
                    Comodines totales: <%=user.inventory().getJokers()%><br>
                    Puedes usar <%=avaiableJokers%> comodín(es) en este cuestionario.
                </div>
            </div>
        </div>
    </div>

    <script src="jquery-3.3.1.min.js"></script>
    <script src="image-map-pro.min.js"></script>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script type='text/javascript' src="imageMapResizer.min.js"></script>


    <script>
                                function validateSearch(form) {
                                    if (form.elements[0].value === "") {
                                        alert("Introduce algún texto en el campo de búsqueda");
                                        return false;
                                    }
                                }

    </script>

    <footer style="background-color: black; color:white; height: 100px">

    </footer>



    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

    <script>
        function showJokerButton(id) {
            jQuery(".jokerButton").hide();
            jQuery(id).show();

        }
    </script>

    <script>
        function useJoker(id) {
            jQuery(".jokerButton").hide();
            jQuery(".examJoker").hide();
            jQuery(id).show();
            $('input[name="jokerUsed"]').val("true");
        }


    </script>
    <%
        request.getSession().setAttribute("examInProgress", true);
    %>

</body>
</html>