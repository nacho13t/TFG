
package com.mycompany.multiplayerbiblio;

public class ExamsInstances {
    
    public static Exam tema5Exam(){
        
        Exam exam = new Exam("Cuestionario de prueba",4);
        Question[] questions = new Question[3];
        
        questions[0] = new Question("Las zonas interactivas en las imágenes se muestran de color...");
        questions[1] = new Question("Los iconos que se utilizan para avanzar entre pantallas muestran...");
        questions[2] = new Question("La plataforma para buscar recursos de la bilbioteca se llama...");
        
        questions[0].options(new String[]{"Verde","Azul","Fucsia"});
        questions[1].options(new String[]{"Flechas","Huellas","Libros"});
        questions[2].options(new String[]{"Catálogo","Bibliotecas","Faro"});
        
        questions[0].correctOption(2);
        questions[1].correctOption(0);
        questions[2].correctOption(2);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema1Exam(){
        
        Exam exam = new Exam("Cuestionario 1",0);
        Question[] questions = new Question[7];
        
        questions[0] = new Question("¿Puedo sacar libros de otra Biblioteca que no sea la de mi facultad?");
        questions[1] = new Question("¿Cómo puedes solicitar la compra de un libro que no está en la Biblioteca Universitaria?");
        questions[2] = new Question("¿Me puedo llevar un portátil a mi casa?");
        questions[3] = new Question("¿Puedo solicitar por Préstamo Intercampus un libro de la Biblioteca Arquitectura desde la Biblioteca de Veterinaria?");
        questions[4] = new Question("¿Puedo dejarle a otra persona mi tarjeta universitaria para que se lleve los libros por mí?");
        questions[5] = new Question("¿Puedo devolver un portátil fin de semana en cualquier biblioteca?");
        questions[6] = new Question("¿Puedo devolver un DVD de la biblioteca de Arquitectura en la biblioteca de Ingeniería?");
        
        questions[0].options(new String[]{"Sí, siempre y cuando no quede lejos de la mía.","No, porque por algo estoy matriculado en esa facultad con su Biblioteca temática correspondiente.","Sí."});
        questions[1].options(new String[]{"Entrando en la opción Mi Biblioteca del catálogo.","A través del formulario web o en papel.","No, no puedes."});
        questions[2].options(new String[]{"Sí, mientras lo devuelvas al final del día.","No, no puedo sacarlo del recinto universitario.","Sí, en préstamo nocturno, semanal o de fin de semana."});
        questions[3].options(new String[]{"Sí, porque las bibliotecas están en campus diferentes.","Sí, ya que por medio del Préstamo Intercampus puedo solicitar los documentos que yo necesite de otra biblioteca.","Sólo si el libro es de consulta."});
        questions[4].options(new String[]{"No.","Sí, si le entrego también mi DNI.","Sí, siempre y cuando el personal de la biblioteca me conozca."});
        questions[5].options(new String[]{"Sí, ya que puedo devolver cualquier documento en cualquier biblioteca.","No, sólo en la mía.","No, sólo en la biblioteca donde me lo prestaron."});
        questions[6].options(new String[]{"Sí, puedo devolver cualquier documento en cualquier biblioteca.","No, porque se trata de material especial.","No, porque están en el mismo Campus."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        questions[6].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema2Exam(){
        
        Exam exam = new Exam("Cuestionario 2",1);
        Question[] questions = new Question[4];
        
        questions[0] = new Question("¿En qué apartado de la página web tienes un menú hecho a tu medida como estudiante?");
        questions[1] = new Question("¿Dónde puedo consultar la oferta formativa que me ofrece la Biblioteca Universitaria?");
        questions[2] = new Question("Puedes comunicarte con la Bilbioteca a través de:");
        questions[3] = new Question("¿Dónde puedo encontrar el Reglamento de Préstamo de la Biblioteca Universitaria?");
        
        questions[0].options(new String[]{"En Servicios.","No existe.","En Tu Biblioteca, información por perfiles."});
        questions[1].options(new String[]{"En el menú Servicios de su página web.","En el menú Conócenos de su página web.","En el menú Formación de su página web."});
        questions[2].options(new String[]{"Chat, WhatsApp, correo electrónico y redes sociales.","Presencialmente y por teléfono.","Las otras dos son correctas."});
        questions[3].options(new String[]{"En la página web de la Universidad, menú Servicios, Reglamentos.","En la página web de la Biblioteca Universitaria, pestaña Formación.","En la página web de la Biblioteca Universitaria, pestaña  Conócenos, Normativa."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema3Exam(){
        
        Exam exam = new Exam("Cuestionario tema 3",2);
        Question[] questions = new Question[6];
        
        questions[0] = new Question("¿Qué datos necesitas para localizar el documento en la estantería?");
        questions[1] = new Question("Si tienes tres libros en préstamo y sólo uno de ellos está sobrepasado en la fecha de devolución, ¿puedes renovar los otros dos?");
        questions[2] = new Question("¿Puedo reservar un libro que no esté prestado?");
        questions[3] = new Question("¿Puedes renovar tus préstamos desde Mi Biblioteca?");
        questions[4] = new Question("¿En qué campo del catálogo buscarías un documento sobre botánica?");
        questions[5] = new Question("¿En qué parte del catálogo puedes encontrar los documentos que el profesorado ha seleccionado para la asignatura?");
        
        questions[0].options(new String[]{"El título del documento.","El código de barras del documento.","La signatura topográfica (ejemplo: ECO 658 ALB emp)."});
        questions[1].options(new String[]{"Depende del tiempo que me haya sobrepasado.","No.","Si, porque los que quiero renovar están bien de fecha."});
        questions[2].options(new String[]{"Depende si el libro es de punto rojo o no.","No.","Sí."});
        questions[3].options(new String[]{"Sí, 3 días antes de la fecha final del préstamo.","Sí, 3 días antes o 3 días después de la fecha final del préstamo.","No puedes."});
        questions[4].options(new String[]{"En el campo autor.","En el campo título.","En el campo materia."});
        questions[5].options(new String[]{"No existe.","En el enlace Bibliografía recomendada.","En el campo título."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema4Exam(){
        
        Exam exam = new Exam("Cuestionario tema 4",3);
        Question[] questions = new Question[3];
        
        questions[0] = new Question("Si quieres consultar Faro desde fuera de la ULPGC, ¿cómo lo harías?");
        questions[1] = new Question("¿Dispone Faro de búsqueda avanzada?");
        questions[2] = new Question("¿Qué es Faro?");
        
        questions[0].options(new String[]{"Hay que registrarse en MiULPGC.","Entrando en Faro directamente.","A través de Accceso remoto en la web de la Biblioteca Universitaria."});
        questions[1].options(new String[]{"No.","Sólo sencilla.","Sí."});
        questions[2].options(new String[]{"Una plataforma de libros electrónicos.","El buscador de los recursos de información que te ofrece la Biblioteca.","El catálogo de la Biblioteca."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
}
