using System.Linq;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;

namespace CRMDLL.FactoryMethods
{
    public class LoginClass
    {
        public AuthenticationModel Login(Authentication Auth)
        {
            CRMDataContext db = new CRMDataContext();

            var getAuthModel = new AuthenticationModel();
            object obj = null;


            if (Auth.Type == UserTypeEnum.Admin)
            {
                var data = db.Registers.Where(x => x.LoginId == Auth.LoginId && x.Password == Auth.Password && x.TypeId == 1 && x.IsDelete == false).FirstOrDefault();

                if (data != null)
                {
                    var admin = new RegisterInfo();
                    admin.Id = data.Id;
                    admin.LoginId = data.LoginId;
                    admin.TypeId = data.TypeId;
                    admin.Name = data.Name;
                    admin.Address = data.Address;
                    admin.DOB = data.DOB;
                    admin.ContactNo = data.ContactNo;
                    admin.Email = data.Email;
                    admin.IsActive = data.IsActive;
                    admin.IsDelete = data.IsDelete;

                    obj = admin;
                    getAuthModel.RegisteredUsers = admin;
                }
            }
            else if (Auth.Type == UserTypeEnum.User)
            {
                var data = db.Registers.Where(x => x.LoginId == Auth.LoginId && x.Password == Auth.Password && x.TypeId == 2 && x.IsDelete == false).FirstOrDefault();

                if (data != null)
                {
                    var user = new RegisterInfo();
                    user.Id = data.Id;
                    user.LoginId = data.LoginId;
                    user.TypeId = data.TypeId;
                    user.Name = data.Name;
                    user.Address = data.Address;
                    user.DOB = data.DOB;
                    user.ContactNo = data.ContactNo;
                    user.Email = data.Email;
                    user.IsActive = data.IsActive;
                    user.IsDelete = data.IsDelete;

                    obj = user;
                    getAuthModel.RegisteredUsers = user;
                }
            }

            else if (Auth.Type == UserTypeEnum.Employee)
            {
                var data = db.Employees.Where(x => x.LoginId == Auth.LoginId && x.Password == Auth.Password && x.UserTypeId == 3 && x.IsDeleted == false).FirstOrDefault();

                if (data != null)
                {
                    var emp = new EmployeeInfo();
                    emp.Id = data.Id;
                    emp.LoginId = data.LoginId;
                    emp.UserTypeId = data.UserTypeId;
                    emp.Name = data.Name;
                    emp.Address = data.Address;
                    emp.DOB = data.DOB;
                    emp.Email = data.Email;
                    emp.DepartmnetId = data.DepartmnetId;

                    obj = emp;
                    getAuthModel.EmployeeInfo = emp;
                }
            }

            getAuthModel.Authenticated = obj != null;
            getAuthModel.AccountType = Auth.Type;

            SessionService.Save(SessionService.Keys.AuthenticationInfo, getAuthModel);
            return getAuthModel;
        }
    }
}
