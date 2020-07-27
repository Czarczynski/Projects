using System;
using System.Collections.Generic;

namespace CompanyApi.Models
{
    public class DepartmentDTO
    {
        public string Name { get; set; }
        public virtual ICollection<Employee> Employee { get; set; }
        public ICollection<int> Employees { get; set; }

    }
}
