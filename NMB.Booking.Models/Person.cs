using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NMB.Booking.Models
{
    public class Person
    {
        public int PersonId { get; set; }
        public int MeetingId { get; set; }
        public int Row { get; set; }
        public int Seat { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }
}
