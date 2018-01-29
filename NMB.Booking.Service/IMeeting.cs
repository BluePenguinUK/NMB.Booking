using System.ServiceModel;

namespace NMB.Booking.Service
{

    [ServiceContract]
    public interface IMeeting
    {
        [OperationContract]
        Models.Location GetLocationById(int locationId);

        [OperationContract]
        Models.Meeting GetMeetingById(int meetingId);

        [OperationContract]
        Models.Person[] GetPersonsByMeetingId(int meetingId);

        [OperationContract]
        bool ResetMeeting(int meetingId);

        [OperationContract]
        string AddPersonsMulti(int meetingId, Models.Person[] persons);
    }

}
