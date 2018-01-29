using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Dapper;
using NMB.Booking.Models;
using NMB.Booking.Service.Classes;
using System.Data;

namespace NMB.Booking.Service
{
    public class Meeting : IMeeting
    {
        // =======================================================================================================================================
        // Get the location details for the supplied ID:
        // =======================================================================================================================================
        public Location GetLocationById(int locationId)
        {
            try
            {
                using (var db = new DapperService())
                {
                    var parameters = new DynamicParameters(new { @locationId = locationId });
                    var results = db.Connection.Query<Models.Location>(sql: "dbo.sp_location_by_id", param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return results.FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        // =======================================================================================================================================
        // Get the meeting details for the supplied ID:
        // =======================================================================================================================================
        public Models.Meeting GetMeetingById(int meetingId)
        {
            try
            {
                using (var db = new DapperService())
                {
                    var parameters = new DynamicParameters(new { @meetingId = meetingId });
                    var results = db.Connection.Query<Models.Meeting>(sql: "dbo.sp_meeting_by_id", param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return results.FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        // =======================================================================================================================================
        // Get the persons booked into the supplied meeting ID:
        // =======================================================================================================================================
        public Person[] GetPersonsByMeetingId(int meetingId)
        {
            try
            {
                using (var db = new DapperService())
                {
                    var parameters = new DynamicParameters(new { @meetingId = meetingId });
                    var results = db.Connection.Query<Models.Person>(sql: "dbo.sp_persons_by_meetingid", param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return results.ToArray();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        // =======================================================================================================================================
        // Clear all bookings from the supplied meeting ID. NOTE: This method has been written for testing purposes:
        // =======================================================================================================================================
        public bool ResetMeeting(int meetingId)
        {
            try
            {
                using (var db = new DapperService())
                {
                    var parameters = new DynamicParameters(new { @meetingId = meetingId });
                    var results = db.Connection.Query<Models.Person>(sql: "dbo.sp_reset_meeting", param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        // =======================================================================================================================================
        // Book people into the supplied meeting ID:
        // =======================================================================================================================================
        public string AddPersonsMulti(int meetingId, Person[] persons)
        {
            try
            {
                var table = new DataTable();
                table.Columns.Add("Row", typeof(int));
                table.Columns.Add("Seat", typeof(int));
                table.Columns.Add("Name", typeof(string));
                table.Columns.Add("Email", typeof(string));

                foreach (var p in persons)
                {
                    table.Rows.Add(new object[] { p.Row, p.Seat, p.Name, p.Email });
                }
                
                using (var db = new DapperService())
                {
                    var parameters = new DynamicParameters(new { @meetingId = meetingId, @persons = table.AsTableValuedParameter("PersonType") });
                    parameters.Add(name: "@message", dbType: DbType.String, size: 1000, direction: ParameterDirection.Output);
                    var results = db.Connection.Query<Models.Person>(sql: "dbo.sp_person_add_multi", param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return parameters.Get<string>("@message") ?? "";
                }
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }

    }
}
