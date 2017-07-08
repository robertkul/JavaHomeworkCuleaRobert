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
class Greeting implements HelloWorld {

    String hello = "Hello";

    @Override
    public void greet() {
        greetSomeone("world");
    }

    @Override
    public void greetSomeone(String someone) {
        System.out.println(hello + " " + someone);
    }
}
