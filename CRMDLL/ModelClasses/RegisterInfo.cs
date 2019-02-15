using System;

namespace CRMDLL.ModelClasses
{
    public class RegisterInfo
    {
        public int Id { get;set; }
        public string LoginId { get;set; }
        public string Password { get;set; }
        public int TypeId { get; set; }
        public string Name { get;set; }
        public DateTime DOB { get;set; }
        public string CNIC { get;set; }
        public string Address { get;set; }
        public string ContactNo { get;set; }
        public string Email { get;set; }
        public bool IsActive { get;set; }
        public bool IsDelete { get; set; }
    }
}