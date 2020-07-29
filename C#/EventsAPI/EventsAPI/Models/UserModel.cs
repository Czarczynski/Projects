using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace EventsAPI.Models
{
    public class UserModel
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Password{ get; set; }

        [Required]
        public string Name{ get; set; }

        [Required]
        public string Surname{ get; set; }

        [DefaultValue("")]
        public string PhotoPath { get; set; }

        [Required]
        public CityModel City{ get; set; }

        [Required]
        public DateTime Birthday { get; set; }

        //[Required]
        //public DateTime CreatedAt{ get; set; }
        public List<EventsUsersModel> Events { get; set; }

    }
}
