package truth;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        String intro = "\n" +
          "Java implementation of the Truth Machine\n" +
          "\n" +
          "The Truth Machine is a simple program for learning\n" +
          "a programing language that takes only two inputs.\n" +
          "\n" +
          "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>.\n" +
          "* 0: Outputs \"0\" and terminates.\n\n";

        System.out.print(intro);

        Scanner sc = new Scanner(System.in);
        Truth tm = new Truth();

        System.out.print("Enter 1 or 0: ");
        while (sc.hasNextLine()) {
            String line = sc.nextLine();
            try {
                Integer val = Integer.valueOf(line);
                tm.setValue(val.intValue());
                break;
            }
            catch (NumberFormatException e) {
                // retry
            }
            catch (IllegalArgumentException e) {
                // retry
            }

            System.out.print("Enter 1 or 0: ");            
        }
        sc.close();
    }
}
