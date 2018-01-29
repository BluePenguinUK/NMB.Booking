using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NMB.Booking.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine(new string('=', 60));
            Console.WriteLine("Please select an option from the list below:");
            Console.WriteLine(new string('=', 60));
            Console.WriteLine("1. Get the summary of meeting #1");
            Console.WriteLine("2. Get the details of meeting #1");
            Console.WriteLine("3. Book seats...");
            Console.WriteLine("4. Reset meeting #1");
            Console.WriteLine(new string('=', 60));
            var k = Console.ReadKey();
            Console.WriteLine();
            switch (k.Key)
            {
                case ConsoleKey.D1:
                case ConsoleKey.NumPad1:
                    var summary = Controllers.Meeting.GetMeeting(1);
                    Console.WriteLine($"{summary.MeetingName} in location {summary.LocationName}: Seats: {summary.MeetingSeats.Count} available, {summary.BookedSeats.Count} booked");
                    break;
                case ConsoleKey.D2:
                case ConsoleKey.NumPad2:
                    var meeting = Controllers.Meeting.GetMeeting(1);
                    Console.WriteLine(meeting.ToString());
                    break;
                case ConsoleKey.D3:
                case ConsoleKey.NumPad3:
                    var persons = new Models.Person[] 
                    {
                        new Models.Person() { Row = 1, Seat = 1, Name = "Alan Andrews", Email = "alan@email.com" },
                        new Models.Person() { Row = 1, Seat = 2, Name = "Brian Bertrand", Email = "brian@email.com" },
                        new Models.Person() { Row = 1, Seat = 3, Name = "Clive Cooper", Email = "clive@email.com" },
                        new Models.Person() { Row = 1, Seat = 4, Name = "Dylan Davis", Email = "dylan@email.com" }
                    };
                    var message = Controllers.Meeting.AddPersonsMulti(1, persons);
                    if (string.IsNullOrEmpty(message))
                    {
                        Console.WriteLine("The operation succeeded");
                    }
                    else
                    {
                        Console.WriteLine($"Error: {message}");
                    }
                    break;
                case ConsoleKey.D4:
                case ConsoleKey.NumPad4:
                    var reset = Controllers.Meeting.ResetMeeting(1);
                    Console.WriteLine($"Result: {(reset ? "The operation succeeded" : "The operation failed")}");
                    break;
            }
            Console.WriteLine("");
            Console.WriteLine("Press any key to continue...");
            Console.Read();

        }
    }
}
