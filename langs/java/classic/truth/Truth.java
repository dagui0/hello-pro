package truth;

public class Truth {

    public void setValue(int val) {
        if (val == 1)
            execTrueAction();
        else if (val == 0)
            execFalseAction();
        else
            throw new IllegalArgumentException("val must 1 or 0: " + val);
    }

    private void execTrueAction() {
        while (true)
            System.out.println("1");
    }

    private void execFalseAction() {
        System.out.println("0");
    }
}
