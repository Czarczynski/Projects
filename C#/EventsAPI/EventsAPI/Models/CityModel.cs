using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace EventsAPI.Models
{
    public class CityModel
    {
        [Key]
        [JsonIgnore]
        public int CityId { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        public VoivodeshipModel Voivodeship { get; set; }

    }
}