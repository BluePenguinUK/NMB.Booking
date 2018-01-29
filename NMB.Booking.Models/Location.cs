using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NMB.Booking.Models
{
    public class Location
    {
        public int LocationId { get; set; }
        public string Name { get; set; }
        public int Rows { get; set; }
        public int Seats { get; set; } // Seats per row
    }
}
