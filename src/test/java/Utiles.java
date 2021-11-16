import java.util.Random;

public class Utiles {

    public static int getRandomNumber(){
        Random rand = new Random(); //instance of random class
        int upperbound = 25;
        //generate random values from 0-24
        int int_random = rand.nextInt(upperbound);
        return int_random;
    }

    public static String getMessage(String message){
       return "Mensaje: "+message;
    }

    public static void saludar(){
        System.out.println("Hola Mundo");
    }


}
