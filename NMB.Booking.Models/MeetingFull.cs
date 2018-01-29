using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NMB.Booking.Models
{
    public class MeetingFull
    {
        public int MeetingId { get; set; }
        public string MeetingName { get; set; }
        public DateTime StartDateTime { get; set; }
        public DateTime EndDateTime { get; set; }
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int Rows { get; set; }
        public int Seats { get; set; }
        public List<RowSeat> MeetingSeats { get; set; } = new List<RowSeat>();
        public List<RowSeat> BookedSeats    // The list of seats that are now unavailable
        {
            get
            {
                return MeetingSeats.Where(x => !string.IsNullOrEmpty(x.Name)).ToList();
            }
        }

        // =======================================================================================================================================
        // This will be called when the list of persons who have booked seats on this meeting have been retrieved. It will reset all seats in this
        // class. If the seats have been booked the name and email address will be populated, if not they will be null:
        // =======================================================================================================================================
        public void SetPersons(List<Person> persons)
        {
            MeetingSeats.Clear();

            for (int r = 1; r <= Rows; r++)
            {
                for (int s = 1; s <= Seats; s++)
                {
                    var p = persons.FirstOrDefault(x => x.Row == r && x.Seat == s);

                    MeetingSeats.Add(new RowSeat()
                    {
                        Row = r,
                        Seat = s,
                        Name = p?.Name,
                        Email = p?.Email
                    });
                }
            }
        }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }

        public class RowSeat
        {
            public int Row { get; set; }
            public int Seat { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }

            // =======================================================================================================================================
            // Return the seat name/number, e.g. Row 1, Seat 1 will be A1; Row 10, Seat 10 will be J10:
            // =======================================================================================================================================
            public string SeatName
            {
                get
                {
                    char r = (char)(Row + 65);
                    return $"{r.ToString()}{Seat}";
                }
            }
        }

    }

}
