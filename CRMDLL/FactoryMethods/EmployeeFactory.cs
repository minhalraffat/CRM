using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;

namespace CRMDLL.FactoryMethods
{
    public class EmployeeFactory
    {
        public bool AddEmployee(EmployeeInfo oo)
        {
            bool result = false;

            CRMDataContext oContect = new CRMDataContext();

            try
            {
                var data = oContect.Employees.Where(e => e.Id == oo.Id).FirstOrDefault();
                if (data != null)
                {
                    data.Name = oo.Name;
                    data.Address = oo.Address;
                    data.CellNo = oo.CellNo;
                    data.DOB = oo.DOB;
                    data.Email = oo.Email;
                    data.DesignationId = oo.DesignationId;
                    data.SalaryId = oo.SalaryId;

                }
                else
                {
                    Employee eEmployee = new Employee();
                    eEmployee.Name = oo.Name;
                    eEmployee.Address = oo.Address;
                    eEmployee.CellNo = oo.CellNo;
                    eEmployee.DOB = oo.DOB;
                    eEmployee.Email = oo.Email;
                    eEmployee.DesignationId = oo.DesignationId;
                    eEmployee.SalaryId = oo.SalaryId;
                    eEmployee.DepartmnetId = oo.DepartmnetId;
                    eEmployee.LoginId = oo.LoginId;
                    eEmployee.Password = oo.Password;
                    eEmployee.UserTypeId = oo.UserTypeId;
                    eEmployee.JoiningDate = DateTime.Now;
                    eEmployee.IsActive = true;
                    eEmployee.IsDeleted = false;

                    oContect.Employees.InsertOnSubmit(eEmployee);
                }
            }
            catch (Exception x)
            {
                throw x;
            }
            oContect.SubmitChanges();
            result = true;
            return result;
        }

        public EmployeeInfo GetEmployeeById(int EmployeeId)
        {
            EmployeeInfo oEmployeeInfo = new EmployeeInfo();
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var empData = oContect.Employees.Where(e => e.Id == EmployeeId & e.IsDeleted == false & e.IsActive == true).FirstOrDefault();
            if (empData == null)
            {
                throw new Exception("No Employee found with provided employee id " + EmployeeId);
            }

            try
            {
                oEmployeeInfo.Id = empData.Id;
                oEmployeeInfo.Name = empData.Name;
                oEmployeeInfo.Address = empData.Address;
                oEmployeeInfo.CellNo = empData.CellNo;
                oEmployeeInfo.DOB = empData.DOB;
                oEmployeeInfo.Email = empData.Email;
                oEmployeeInfo.IsActive = empData.IsActive;
                oEmployeeInfo.IsDeleted = empData.IsDeleted;
                oEmployeeInfo.JoiningDate = empData.JoiningDate;
                oEmployeeInfo.DesignationId = empData.DesignationId;
                oEmployeeInfo.SalaryId = empData.SalaryId;
                oEmployeeInfo.DepartmnetId = empData.DepartmnetId;
            }
            catch (Exception)
            {
                throw;
            }
            return oEmployeeInfo;
        }
        public List<EmployeeInfo> GetAllEmployee()
        {
            List<EmployeeInfo> oEmployeeInfoList = new List<EmployeeInfo>();
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var data = oContect.Employees.Where(e => e.IsDeleted == false & e.IsActive == true).ToList();
            try
            {
                if (data != null)
                {
                    foreach (var empData in data)
                    {
                        EmployeeInfo oEmployeeInfo = new EmployeeInfo();

                        oEmployeeInfo.Id = empData.Id;
                        oEmployeeInfo.Name = empData.Name;
                        oEmployeeInfo.Address = empData.Address;
                        oEmployeeInfo.CellNo = empData.CellNo;
                        oEmployeeInfo.DOB = empData.DOB;
                        oEmployeeInfo.Email = empData.Email;
                        oEmployeeInfo.JoiningDate = empData.JoiningDate;
                        oEmployeeInfo.DesignationId = empData.DesignationId;
                        oEmployeeInfo.DesignationName = empData.Designation.DesignationName;
                        oEmployeeInfo.SalaryId = empData.SalaryId;
                        oEmployeeInfo.SalaryName = empData.EmployeeSalary.Salary;

                        oEmployeeInfoList.Add(oEmployeeInfo);
                    }
                }
            }
            catch (Exception x)
            {
                throw x;
            }
            return oEmployeeInfoList;
        }

        public bool DeleteEmployee(int empid)
        {
            bool res = false;

            CRMDataContext db = new CRMDataContext();

            var data = db.Employees.Where(c => c.Id == empid).FirstOrDefault();

            if (data != null)
            {
                db.Employees.DeleteOnSubmit(data);
                db.SubmitChanges();
                return true;
            }
            return res;
        }
    }
}