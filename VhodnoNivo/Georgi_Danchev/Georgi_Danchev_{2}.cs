﻿using System;

namespace Task1
{
    class Task1
    {
        static void Main()
        {
            int x = Convert.ToInt32(Console.ReadLine());
            int y = Convert.ToInt32(Console.ReadLine());
            int sum = 0;

            if (x > y)
            {
                for (int i = y; i < x; i++)
                {
                    if (i % 17 != 0)
                    {
                        sum += i;
                    }
                }
            }
            else if (y > x)
            {
                for (int i = x; i < y; i++)
                {
                    if (i % 17 != 0)
                    {
                        sum += i;
                    }
                }
            }
            Console.WriteLine(sum);
        }
    }
}
