
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
        
        Exam exam = new Exam("Cuestionario tema 1",0);
        Question[] questions = new Question[8];
        
        questions[0] = new Question("¿Puedo sacar libros de otra Biblioteca que no sea la de mi facultad?");
        questions[1] = new Question("¿Cómo puedes solicitar la compra de un libro que no está en la Biblioteca Universitaria?");
        questions[2] = new Question("¿Me puedo llevar un portátil a mi casa?");
        questions[3] = new Question("¿Puedo solicitar por Préstamo Intercampus un libro de la Biblioteca Arquitectura desde la Biblioteca de Veterinaria?");
        questions[4] = new Question("¿Puedo dejarle a otra persona mi tarjeta universitaria para que se lleve los libros por mí?");
        questions[5] = new Question("¿Puedo devolver un portátil fin de semana en cualquier biblioteca?");
        questions[6] = new Question("¿Puedo devolver un DVD de la biblioteca de Arquitectura en la biblioteca de Ingeniería?");
        questions[7] = new Question("Si tengo una sanción por retraso en la devolución de un ordenador portátil, ¿puedo sacar libros en préstamo?");
        
        questions[0].options(new String[]{"Sí, siempre y cuando no quede lejos de la mía.","No, porque por algo estoy matriculado en esa facultad con su Biblioteca temática correspondiente.","Sí."});
        questions[1].options(new String[]{"Entrando en la opción Mi Biblioteca del catálogo.","A través del formulario web o en papel.","No, no puedes."});
        questions[2].options(new String[]{"Sí, mientras lo devuelvas al final del día.","No, no puedo sacarlo del recinto universitario.","Sí, en préstamo nocturno, semanal o de fin de semana."});
        questions[3].options(new String[]{"Sí, porque las bibliotecas están en campus diferentes.","Sí, ya que por medio del Préstamo Intercampus puedo solicitar los documentos que yo necesite de otra biblioteca.","Sólo si el libro es de consulta."});
        questions[4].options(new String[]{"No.","Sí, si le entrego también mi DNI.","Sí, siempre y cuando el personal de la biblioteca me conozca."});
        questions[5].options(new String[]{"Sí, ya que puedo devolver cualquier documento en cualquier biblioteca.","No, sólo en la mía.","No, sólo en la biblioteca donde me lo prestaron."});
        questions[6].options(new String[]{"Sí, puedo devolver cualquier documento en cualquier biblioteca.","No, porque se trata de material especial.","No, porque están en el mismo Campus."});
        questions[7].options(new String[]{"Sí, el préstamo de ordenadores portátiles no interfiere en el préstamo de libros.","No.","Sí, siempre que no me exceda del límite de 10, con los libros que ya tengo en préstamo."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        questions[6].correctOption(0);
        questions[7].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema2Exam(){
        
        Exam exam = new Exam("Cuestionario tema 2",1);
        Question[] questions = new Question[8];
        
        questions[0] = new Question("¿Puedo sacar libros de otra Biblioteca que no sea la de mi facultad?");
        questions[1] = new Question("¿Cómo puedes solicitar la compra de un libro que no está en la Biblioteca Universitaria?");
        questions[2] = new Question("¿Me puedo llevar un portátil a mi casa?");
        questions[3] = new Question("¿Puedo solicitar por Préstamo Intercampus un libro de la Biblioteca Arquitectura desde la Biblioteca de Veterinaria?");
        questions[4] = new Question("¿Puedo dejarle a otra persona mi tarjeta universitaria para que se lleve los libros por mí?");
        questions[5] = new Question("¿Puedo devolver un portátil fin de semana en cualquier biblioteca?");
        questions[6] = new Question("¿Puedo devolver un DVD de la biblioteca de Arquitectura en la biblioteca de Ingeniería?");
        questions[7] = new Question("Si tengo una sanción por retraso en la devolución de un ordenador portátil, ¿puedo sacar libros en préstamo?");
        
        questions[0].options(new String[]{"Sí, siempre y cuando no quede lejos de la mía.","No, porque por algo estoy matriculado en esa facultad con su Biblioteca temática correspondiente.","Sí."});
        questions[1].options(new String[]{"Entrando en la opción Mi Biblioteca del catálogo.","A través del formulario web o en papel.","No, no puedes."});
        questions[2].options(new String[]{"Sí, mientras lo devuelvas al final del día.","No, no puedo sacarlo del recinto universitario.","Sí, en préstamo nocturno, semanal o de fin de semana."});
        questions[3].options(new String[]{"Sí, porque las bibliotecas están en campus diferentes.","Sí, ya que por medio del Préstamo Intercampus puedo solicitar los documentos que yo necesite de otra biblioteca.","Sólo si el libro es de consulta."});
        questions[4].options(new String[]{"No.","Sí, si le entrego también mi DNI.","Sí, siempre y cuando el personal de la biblioteca me conozca."});
        questions[5].options(new String[]{"Sí, ya que puedo devolver cualquier documento en cualquier biblioteca.","No, sólo en la mía.","No, sólo en la biblioteca donde me lo prestaron."});
        questions[6].options(new String[]{"Sí, puedo devolver cualquier documento en cualquier biblioteca.","No, porque se trata de material especial.","No, porque están en el mismo Campus."});
        questions[7].options(new String[]{"Sí, el préstamo de ordenadores portátiles no interfiere en el préstamo de libros.","No.","Sí, siempre que no me exceda del límite de 10, con los libros que ya tengo en préstamo."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        questions[6].correctOption(0);
        questions[7].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema3Exam(){
        
        Exam exam = new Exam("Cuestionario tema 3",2);
        Question[] questions = new Question[8];
        
        questions[0] = new Question("¿Puedo sacar libros de otra Biblioteca que no sea la de mi facultad?");
        questions[1] = new Question("¿Cómo puedes solicitar la compra de un libro que no está en la Biblioteca Universitaria?");
        questions[2] = new Question("¿Me puedo llevar un portátil a mi casa?");
        questions[3] = new Question("¿Puedo solicitar por Préstamo Intercampus un libro de la Biblioteca Arquitectura desde la Biblioteca de Veterinaria?");
        questions[4] = new Question("¿Puedo dejarle a otra persona mi tarjeta universitaria para que se lleve los libros por mí?");
        questions[5] = new Question("¿Puedo devolver un portátil fin de semana en cualquier biblioteca?");
        questions[6] = new Question("¿Puedo devolver un DVD de la biblioteca de Arquitectura en la biblioteca de Ingeniería?");
        questions[7] = new Question("Si tengo una sanción por retraso en la devolución de un ordenador portátil, ¿puedo sacar libros en préstamo?");
        
        questions[0].options(new String[]{"Sí, siempre y cuando no quede lejos de la mía.","No, porque por algo estoy matriculado en esa facultad con su Biblioteca temática correspondiente.","Sí."});
        questions[1].options(new String[]{"Entrando en la opción Mi Biblioteca del catálogo.","A través del formulario web o en papel.","No, no puedes."});
        questions[2].options(new String[]{"Sí, mientras lo devuelvas al final del día.","No, no puedo sacarlo del recinto universitario.","Sí, en préstamo nocturno, semanal o de fin de semana."});
        questions[3].options(new String[]{"Sí, porque las bibliotecas están en campus diferentes.","Sí, ya que por medio del Préstamo Intercampus puedo solicitar los documentos que yo necesite de otra biblioteca.","Sólo si el libro es de consulta."});
        questions[4].options(new String[]{"No.","Sí, si le entrego también mi DNI.","Sí, siempre y cuando el personal de la biblioteca me conozca."});
        questions[5].options(new String[]{"Sí, ya que puedo devolver cualquier documento en cualquier biblioteca.","No, sólo en la mía.","No, sólo en la biblioteca donde me lo prestaron."});
        questions[6].options(new String[]{"Sí, puedo devolver cualquier documento en cualquier biblioteca.","No, porque se trata de material especial.","No, porque están en el mismo Campus."});
        questions[7].options(new String[]{"Sí, el préstamo de ordenadores portátiles no interfiere en el préstamo de libros.","No.","Sí, siempre que no me exceda del límite de 10, con los libros que ya tengo en préstamo."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        questions[6].correctOption(0);
        questions[7].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
    
    public static Exam tema4Exam(){
        
        Exam exam = new Exam("Cuestionario tema 4",3);
        Question[] questions = new Question[8];
        
        questions[0] = new Question("¿Puedo sacar libros de otra Biblioteca que no sea la de mi facultad?");
        questions[1] = new Question("¿Cómo puedes solicitar la compra de un libro que no está en la Biblioteca Universitaria?");
        questions[2] = new Question("¿Me puedo llevar un portátil a mi casa?");
        questions[3] = new Question("¿Puedo solicitar por Préstamo Intercampus un libro de la Biblioteca Arquitectura desde la Biblioteca de Veterinaria?");
        questions[4] = new Question("¿Puedo dejarle a otra persona mi tarjeta universitaria para que se lleve los libros por mí?");
        questions[5] = new Question("¿Puedo devolver un portátil fin de semana en cualquier biblioteca?");
        questions[6] = new Question("¿Puedo devolver un DVD de la biblioteca de Arquitectura en la biblioteca de Ingeniería?");
        questions[7] = new Question("Si tengo una sanción por retraso en la devolución de un ordenador portátil, ¿puedo sacar libros en préstamo?");
        
        questions[0].options(new String[]{"Sí, siempre y cuando no quede lejos de la mía.","No, porque por algo estoy matriculado en esa facultad con su Biblioteca temática correspondiente.","Sí."});
        questions[1].options(new String[]{"Entrando en la opción Mi Biblioteca del catálogo.","A través del formulario web o en papel.","No, no puedes."});
        questions[2].options(new String[]{"Sí, mientras lo devuelvas al final del día.","No, no puedo sacarlo del recinto universitario.","Sí, en préstamo nocturno, semanal o de fin de semana."});
        questions[3].options(new String[]{"Sí, porque las bibliotecas están en campus diferentes.","Sí, ya que por medio del Préstamo Intercampus puedo solicitar los documentos que yo necesite de otra biblioteca.","Sólo si el libro es de consulta."});
        questions[4].options(new String[]{"No.","Sí, si le entrego también mi DNI.","Sí, siempre y cuando el personal de la biblioteca me conozca."});
        questions[5].options(new String[]{"Sí, ya que puedo devolver cualquier documento en cualquier biblioteca.","No, sólo en la mía.","No, sólo en la biblioteca donde me lo prestaron."});
        questions[6].options(new String[]{"Sí, puedo devolver cualquier documento en cualquier biblioteca.","No, porque se trata de material especial.","No, porque están en el mismo Campus."});
        questions[7].options(new String[]{"Sí, el préstamo de ordenadores portátiles no interfiere en el préstamo de libros.","No.","Sí, siempre que no me exceda del límite de 10, con los libros que ya tengo en préstamo."});
        
        questions[0].correctOption(0);
        questions[1].correctOption(0);
        questions[2].correctOption(0);
        questions[3].correctOption(0);
        questions[4].correctOption(0);
        questions[5].correctOption(0);
        questions[6].correctOption(0);
        questions[7].correctOption(0);
        
        exam.setQuestions(questions);
        
        return exam;
    }
}
