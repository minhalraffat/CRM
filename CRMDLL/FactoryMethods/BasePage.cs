using CRMDLL.FactoryMethods;


namespace CRMDLL
{
    public class BasePage : System.Web.UI.Page
    {
        private LoginClass _accountService = null;
        protected LoginClass AccountService
        {
            get
            {
                if (_accountService == null)
                {
                    _accountService = new LoginClass();
                }
                return _accountService;
            }
        }
    }
}
