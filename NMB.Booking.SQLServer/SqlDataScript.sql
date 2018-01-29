USE NmbBooking
GO

INSERT INTO dbo.[Location] ([Name], [Rows], Seats) VALUES ('Eastleigh', 10, 10)
GO

INSERT INTO dbo.Meeting (LocationId, [Name], StartDateTime, EndDateTime) VALUES (1, 'Developer Meeting', '2018-03-01T09:00:00.000Z', '2018-03-01T17:30:00.000Z')
GO

INSERT INTO dbo.Person (MeetingId, [Row], Seat, [Name], Email) VALUES (1, 1, 3, 'Nick Brice', 'nick.brice@googlemail.com')
GO