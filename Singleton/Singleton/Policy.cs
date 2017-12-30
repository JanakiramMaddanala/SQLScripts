using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Singleton
{
    public class Policy
    {
        public int ID { get; set; }

        public string Type { get; set; }

        private static readonly Policy instance = new Policy();

        public static Policy Instance
        {
            get { return instance; }
        }

        private Policy()
        {
        }

        public string GetPolicyNumber()
        {
            return "PN123456";
        }
    }
}
