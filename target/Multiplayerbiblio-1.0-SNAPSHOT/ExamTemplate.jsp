
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

        <title>TFG</title>
    </head>
    <body>
        <div class="container">
            <form method="post" action="ReviseExamServlet">
                <%
                    User user = (User)request.getSession().getAttribute("user");
                    
                    int count = 1;
                    Exam exam = (Exam) request.getAttribute("questionnaire");
                %><h2><%= exam.name()%></h2><%
                    for (Question question : exam.getQuestions()) {
                        %><br><p><%= question.statement()%></p>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="<%="options"+count%>" id="<%="question" + count + "first"%>" value="<% if(question.correctOption()==0){%><%= 1 %><% }else{ %><%= 0%><% }%>" checked>
                    <label class="form-check-label" for="exampleRadios1">
                        <%=question.options()[0]%>
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="<%="options"+count%>" id="<%="question" + count + "second"%>" value="<% if(question.correctOption()==1){%><%= 1 %><% }else{ %><%= 0%><% }%>">
                    <label class="form-check-label" for="exampleRadios2">
                        <%=question.options()[1]%>
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="<%="options"+count%>" id="<%="question" + count + "third"%>" value="<% if(question.correctOption()==2){%><%= 1 %><% }else{ %><%= 0%><% }%>">
                    <label class="form-check-label" for="exampleRadios3">
                        <%=question.options()[2]%>
                    </label>
                </div>
                <%
                    count++;}
                %>           
                
                <input type="hidden" name="answersCount" value="<%=count%>">
                <input type="hidden" name="examId" value="<%=exam.id()%>">
                <input type="hidden" name="points" value="<%=request.getParameter("points")%>">
                <br><button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>