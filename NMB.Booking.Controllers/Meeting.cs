using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NMB.Booking.Controllers
{
    public static class Meeting
    {
        // =======================================================================================================================================
        // Get the full details for the supplied meeting ID:
        // =======================================================================================================================================
        public static Models.MeetingFull GetMeeting(int meetingId)
        {
            try
            {
                var service = new MeetingService.MeetingClient();

                var meeting = service.GetMeetingById(meetingId);
                var location = service.GetLocationById(meeting.LocationId);
                var bookedPersons = service.GetPersonsByMeetingId(meetingId);

                var result = new Models.MeetingFull()
                {
                    MeetingId = meeting.MeetingId,
                    MeetingName = meeting.Name,
                    StartDateTime = meeting.StartDateTime,
                    EndDateTime = meeting.EndDateTime,
                    LocationId = location.LocationId,
                    LocationName = location.Name,
                    Rows = location.Rows,
                    Seats = location.Seats
                };
                
                result.SetPersons(bookedPersons.Select(x => new Models.Person()
                {
                    PersonId = x.PersonId,
                    MeetingId = x.MeetingId,
                    Row = x.Row,
                    Seat = x.Seat,
                    Name = x.Name,
                    Email = x.Email
                }).ToList());

                service = null;

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        // =======================================================================================================================================
        // Book people into the supplied meeting ID:
        // =======================================================================================================================================
        public static string AddPersonsMulti(int meetingId, Models.Person[] persons)
        {
            try
            {
                var service = new MeetingService.MeetingClient();
                var result = service.AddPersonsMulti(meetingId, persons);
                service = null;
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        // =======================================================================================================================================
        // Clear all bookings from the supplied meeting ID. NOTE: This method has been written for testing purposes.
        // =======================================================================================================================================
        public static bool ResetMeeting(int meetingId)
        {
            try
            {
                var service = new MeetingService.MeetingClient();
                var result = service.ResetMeeting(meetingId);
                service = null;
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
