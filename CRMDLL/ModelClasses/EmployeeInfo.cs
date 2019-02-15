using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRMDLL.ModelClasses
{
    public class EmployeeInfo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime DOB { get; set; }
        public string CNICNo { get; set; }
        public string Address { get; set; }
        public string CellNo { get; set; }
        public string Email { get; set; }
        public System.Nullable<double> CurrentSalary { get; set; }
        public DateTime JoiningDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public int DesignationId { get; set; }
        public string DesignationName { get; set; }
        public int DepartmnetId { get; set; }
        public string DepartmnetName { get; set; }
        public int SalaryId { get; set; }
        public string SalaryName { get; set; }
        public string LoginId { get; set; }
        public string Password { get; set; }
        public int UserTypeId { get; set; }
    }
}