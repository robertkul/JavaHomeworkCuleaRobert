/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculatorbasic;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Basic calculator running in console
 *
 * @author Robert Culea
 */
public class Calculator {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        int firstNumber = 0;
        int secondNumber = 0;
        int result = 0;
        String operator = "";
        String equal = "";

        try (Scanner key = new Scanner(System.in)) {
            System.out.println("******CALCULATOR******");

            System.out.println("Please introduce your first number and press enter:");
            firstNumber = key.nextInt();
            key.nextLine();

            System.out.println("Please introduce operator and press enter:");
            operator = key.nextLine();

            System.out.println("Please introduce your second number and press enter:");
            secondNumber = key.nextInt();
            key.nextLine();

            System.out.println("Please introduce equal and press enter:");
            equal = key.nextLine();

            switch (operator) {
                case "+":
                    result = firstNumber + secondNumber;
                    break;
                case "-":
                    result = firstNumber - secondNumber;
                    break;
                case "*":
                    result = firstNumber * secondNumber;
                    break;
                case "/":
                    result = firstNumber / secondNumber;
                    break;
                default:
                    System.out.println("Invalid operator.");
                    break;
            }
            System.out.println("Result is:" + result);
            
        } catch (InputMismatchException exception) {
            System.out.println("Sorry, you introduced wrong data. I quit :)");
        }

    }
}
