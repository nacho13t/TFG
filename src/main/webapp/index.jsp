<%@page import="com.mycompany.multiplayerbiblio.Utilities"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>TFG</title>
    </head>
    <body>

        <div class="p-2 bg-primary text-white sticky-top">
            <div class="container"><h1>Conoce tu biblioteca</h1></div>
        </div>

        <div class="p-3 bg-dark text-white" id="content">
            <div class="container">
                <form action="LoginServlet" onsubmit="return validateLogin(this)">
                    <div class="form-group">
                        <label for="yourName">Nombre</label>
                        <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword1">Contraseña</label>
                        <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                    </div>
                    <button type="submit" class="btn btn-primary">Entrar</button>
                </form>
            </div>
        </div>
        
        <div class="p-3 bg-dark text-white"  id="welcomeDiv">
            <div class="container text-center p-3">
 
                <button type="button" class="btn btn-success btn-lg" id="hideshow">Registrarse</button>
            </div>
        </div>

        <div class="p-3 bg-dark text-white" id="chooseNameDiv" style="display: none;">
            <div class="container text-center">
                <h2>Crea tu usuario:</h2>
                <form action="RegisterServlet" onsubmit="return validateRegister(this)">
                    <div class="form-group">
                        <label for="yourName">Nombre</label>
                        <input type="userName" class="form-control" name="name" placeholder="Introduce tu nombre">
                    </div>
                    <div class="form-group">
                        <label for="inputCareer">Carrera</label>
                        <select id="inputCareer" name="career" class="form-control">
                            <%
                                for (String career : Utilities.careers()) {
                            %><option><%=career%></option><%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword1">Contraseña</label>
                        <input type="password" class="form-control" name="pass" id="inputPassword1" placeholder="Contraseña">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword1">Repita la contraseña</label>
                        <input type="password" class="form-control" id="inputPassword1" placeholder="Contraseña">
                    </div>
                    <button type="submit" class="btn btn-primary float-left">Entrar</button>
                </form>
                        <button class="btn btn-danger float-left ml-1" id="hideshowCancel">Cancelar</button>
            </div>
        </div>  

        <div class="p-3 bg-dark text-white" id="content">
            <div class="container text-center p-3">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non nibh sollicitudin, semper mauris tincidunt, viverra massa. Vestibulum id fermentum nulla, sed mollis ex. Phasellus semper convallis pretium. Curabitur consectetur viverra pellentesque. Etiam eu rhoncus lacus. Aliquam eget urna ac neque auctor iaculis sit amet eu dolor. Proin maximus nibh at neque bibendum, in pretium lorem volutpat. Phasellus ornare fermentum dolor, vitae tincidunt mauris tincidunt ut.

                    Donec non suscipit eros. Praesent at varius est. Phasellus convallis dignissim orci. Aliquam elementum eget leo in ultrices. In dignissim ligula vel vulputate tristique. Integer eu iaculis ipsum. Phasellus finibus libero non eleifend condimentum. Morbi maximus urna eget tincidunt venenatis. Nulla vitae neque nibh. Quisque a lorem est.

                    Phasellus mollis nunc ac nisi suscipit mattis. Cras at felis tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed non nunc eu augue pulvinar molestie. Vivamus et consectetur est. Quisque fermentum vel neque vel mattis. Etiam euismod nisi est, non ullamcorper leo interdum at.

                </p>
            </div>
        </div> 

        <div class="bg-dark text-white slide  p-3 d-flex justify-content-center">
            <div id="carouselExampleControls" class="carousel w-50" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Images/carousel1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Images/carousel2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Images/carousel3.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>  
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
                    jQuery(document).ready(function () {
                        jQuery('#hideshow').on('click', function () {
                            jQuery('#chooseNameDiv').show();
                            jQuery('#welcomeDiv').hide();
                            jQuery('#content').hide();
                            jQuery('#carouselExampleControls').hide();
                        });
                    });
        </script>
        
        <script>
                    jQuery(document).ready(function () {
                        jQuery('#hideshowCancel').on('click', function () {
                            jQuery('#chooseNameDiv').hide();
                            jQuery('#welcomeDiv').show();
                            jQuery('#content').show();
                            jQuery('#carouselExampleControls').show();
                        });
                    });
        </script>

        <script>
            function validateRegister(form) {
                if (form.elements[0].value === "") {
                    alert("Introduce un nombre de usuario");
                    return false;
                }

                if (form.elements[1].value === "") {
                    alert("Introduce la carrera que estudias");
                    return false;
                }

                if (form.elements[2].value !== form.elements[3].value) {
                    alert("Las contraseñas no coinciden");
                    return false;
                }

                return true;
            }
        </script>
        
        <script>
            function validateLogin(form) {
                if (form.elements[0].value === "") {
                    alert("Introduce un nombre de usuario");
                    return false;
                }

                if (form.elements[1].value === "") {
                    alert("Introduce la contraseña");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>