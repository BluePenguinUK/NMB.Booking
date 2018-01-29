using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Common;
using System.Configuration;
using System.Data.SqlClient;

namespace NMB.Booking.Service.Classes
{
    public class DapperService : IDisposable
    {
        // Logger...

        public DbConnection Connection;
        public DapperService()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            Connection = new SqlConnection(connectionString);
            Connection.Open();
        }
        
        public void Dispose()
        {
            Connection.Dispose();
            Connection = null;
        }
    }
}