using System;

class Problem9
{
    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        int input = 1;
        double[] numbers = new double[10];
	bool ok = false;

        for (int i = 0; i < 10; i++) {

            while (!ok) {

                double number = Math.Cos(input);
                input ++;
                int Digit_third = (int) ( (number * 1000) % 10);

                if ((number > 0.0f) && (Digit_third == x))
                {
                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }
        foreach (double element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}
