
<%@page import="com.mycompany.multiplayerbiblio.Question"%>
<%@page import="com.mycompany.multiplayerbiblio.Exam"%>
<%@page import="com.mycompany.multiplayerbiblio.User"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>TFG</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-9">
                    <form method="post" action="ReviseExamServlet">
                        <%
                            User user = (User) request.getSession().getAttribute("user");
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
                        <%
                                count++;
                            }
                        %>           
                </div>
                <div class="col-3 mt-2">
                    Comodines totales: <%=user.inventory().getJokers()%><br>
                    Puedes usar <%=avaiableJokers%> comodín(es) en este cuestionario.
                </div>
            </div>
            <input type="hidden" name="answersCount" value="<%=count%>">
            <input type="hidden" name="examId" value="<%=exam.id()%>">
            <input type="hidden" name="points" value="<%=request.getParameter("points")%>">
            <input type="hidden" name="jokerUsed" value="false">
            <br><button type="submit" class="btn btn-primary">Enviar</button>
        </form>

    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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