    <%@page import="com.mycompany.multiplayerbiblio.User"%>
<div class=" container fixed-bottom justify-content-center">
    <% User user = (User) request.getSession().getAttribute("user");%>

</div>


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
            alert("Introduce alg�n texto en el campo de b�squeda");
            return false;
        }
    }

</script>

<footer style="background-color: black; color:white; height: 100px">
    <!--    <div class="container">
            <p>2018 I.A.B.</p>
        </div>-->

    <div class="search-user p-4">
        <form action="SearchUserServlet" onsubmit="return validateSearch(this)" class="form-inline p-1">
            <div class="form-group mb-2">
                <input type="text" name="search" placeholder="Busca un usuario" class="form-control">
            </div>
            <button type="submit" class="btn btn-info mb-2">Buscar</button>
        </form>

    </div>

</footer>

