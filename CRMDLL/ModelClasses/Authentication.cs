using CRMDLL.FactoryMethods;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRMDLL.ModelClasses
{
    public class Authentication
    {
        public String LoginId { get; set; }
        public String Password { get; set; }
        public UserTypeEnum Type { get; set; }
    }

    public class AuthenticationModel
    {
        public bool Authenticated { get; set; }
        public UserTypeEnum AccountType { get; set; }
        public RegisterInfo RegisteredUsers { get; set; }
        public EmployeeInfo EmployeeInfo { get; set; }
    }

    public enum UserTypeEnum
    {
        Admin = 1,
        User = 2,
        Employee = 3
    }
}