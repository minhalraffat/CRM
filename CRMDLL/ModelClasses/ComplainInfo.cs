using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRMDLL.ModelClasses
{
    public class ComplainInfo
    {
        public int Id { get;set;}
        public int ComplainTypeId { get; set; }
        public string ComplainTypeName { get; set; }
        public string ComplainNumber {get;set;}
        public string Description {get;set;}
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Status { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
    }
}