/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anonymousclasseshomework;

/**
 *
 * @author Rob C
 */
public class HelloWorldAnonymousClasses {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Greeting englishGreeting = new Greeting();
        englishGreeting.greetSomeone("world!");
        Greeting frenchGreeting = new Greeting();
        frenchGreeting.hello = "Salut";
        frenchGreeting.greetSomeone("tout le monde!");
        Greeting spanishGreeting = new Greeting();
        spanishGreeting.hello = "Hola";
        spanishGreeting.greetSomeone("mundo!");
    }

}
