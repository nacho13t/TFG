
package com.mycompany.multiplayerbiblio;

public class Question{
        private String statement;
        private String[] options;
        private int correctOption;

        public Question(String statement) {
            this.statement = statement;
        }

        public void statement(String statement) {
            this.statement = statement;
        }

        public void options(String[] options) {
            this.options = options;
        }

        public void correctOption(int correctOption) {
            this.correctOption = correctOption;
        }

        public String statement() {
            return statement;
        }

        public String[] options() {
            return options;
        }

        public int correctOption() {
            return correctOption;
        }
    }