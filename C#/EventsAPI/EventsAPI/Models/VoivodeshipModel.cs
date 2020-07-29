using System;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace EventsAPI.Models
{
    public class VoivodeshipModel
    {
        [Key]
        [JsonIgnore]
        public int VoivodeshipId { get; set; }

        [Required]
        public string Voivodeship { get; set; }

    }
}
