# NMB.Booking
Technical test for Zupa Group

NOTES:
1. I've assumed each row has the same number of seats (as this was the case in the brief). If this were to change then an additional table would be needed in the database for Row/Seat.
2. I've used Dapper for the data access as it's like using Entity Framework without the hassle!!
3. The database indexes have been designed based on the current queries only. Depending on the requirement further indexes may be required.
4. There is currently no link between the users booked in a single transaction. This could easily be added or, if a payment reference were to be added at a later date (as mentioned in the brief) this could be used to link the users.
5. As this is a test I didn't add logging but this will be easy to implement using Log4Net.
