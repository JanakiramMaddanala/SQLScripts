using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Singleton
{
    class Program
    {
        static void Main(string[] args)
        {
            var policy1 = Policy.Instance;
            var policy2 = Policy.Instance;

            Console.WriteLine(ReferenceEquals(policy1, policy2));

            policy1.Type = "X";

            Console.WriteLine(policy2.Type);
        }
    }
}
