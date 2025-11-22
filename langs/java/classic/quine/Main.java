package quine;
public class Main {
    public static void main(String[] args) {
        char q = 34;      // Quotation mark character
        String[] l = {    // Array of source code
            "package quine;",
            "public class Main {",
            "    public static void main(String[] args) {",
            "        char q = 34;      // Quotation mark character",
            "        String[] l = {    // Array of source code",
            "            ",
            "        };",
            "        for (int i = 0; i < 4; i++) {           // Print opening code",
            "            System.out.println(l[i]);",
            "        }",
            "        for (int i = 0; i < l.length; i++) {    // Print string array",
            "            System.out.printf(\"%s%c%s%c,%n\", l[4], q, l[i], q);",
            "        }",
            "        for (int i = 5; i < l.length; i++) {    // Print this code",
            "            System.out.println(l[i]);",
            "        }",
            "    }",
            "}",
        };
        for (int i = 0; i < 4; i++) {           // Print opening code
            System.out.println(l[i]);
        }
        for (int i = 0; i < l.length; i++) {    // Print string array
            System.out.printf("%s%c%s%c,%n", l[4], q, l[i], q);
        }
        for (int i = 5; i < l.length; i++) {    // Print this code
            System.out.println(l[i]);
        }
    }
}

