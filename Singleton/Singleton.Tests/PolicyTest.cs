using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Singleton.Tests
{
    [TestClass]
    public class PolicyTest
    {
        [TestMethod]
        public void IsPolicySingleton()
        {
            Assert.AreSame(Policy.Instance, Policy.Instance);
        }
    }
}
