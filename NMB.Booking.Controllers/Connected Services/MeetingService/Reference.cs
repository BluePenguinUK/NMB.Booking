﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NMB.Booking.Controllers.MeetingService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="MeetingService.IMeeting")]
    public interface IMeeting {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetLocationById", ReplyAction="http://tempuri.org/IMeeting/GetLocationByIdResponse")]
        NMB.Booking.Models.Location GetLocationById(int locationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetLocationById", ReplyAction="http://tempuri.org/IMeeting/GetLocationByIdResponse")]
        System.Threading.Tasks.Task<NMB.Booking.Models.Location> GetLocationByIdAsync(int locationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetMeetingById", ReplyAction="http://tempuri.org/IMeeting/GetMeetingByIdResponse")]
        NMB.Booking.Models.Meeting GetMeetingById(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetMeetingById", ReplyAction="http://tempuri.org/IMeeting/GetMeetingByIdResponse")]
        System.Threading.Tasks.Task<NMB.Booking.Models.Meeting> GetMeetingByIdAsync(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetPersonsByMeetingId", ReplyAction="http://tempuri.org/IMeeting/GetPersonsByMeetingIdResponse")]
        NMB.Booking.Models.Person[] GetPersonsByMeetingId(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/GetPersonsByMeetingId", ReplyAction="http://tempuri.org/IMeeting/GetPersonsByMeetingIdResponse")]
        System.Threading.Tasks.Task<NMB.Booking.Models.Person[]> GetPersonsByMeetingIdAsync(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/ResetMeeting", ReplyAction="http://tempuri.org/IMeeting/ResetMeetingResponse")]
        bool ResetMeeting(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/ResetMeeting", ReplyAction="http://tempuri.org/IMeeting/ResetMeetingResponse")]
        System.Threading.Tasks.Task<bool> ResetMeetingAsync(int meetingId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/AddPersonsMulti", ReplyAction="http://tempuri.org/IMeeting/AddPersonsMultiResponse")]
        string AddPersonsMulti(int meetingId, NMB.Booking.Models.Person[] persons);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IMeeting/AddPersonsMulti", ReplyAction="http://tempuri.org/IMeeting/AddPersonsMultiResponse")]
        System.Threading.Tasks.Task<string> AddPersonsMultiAsync(int meetingId, NMB.Booking.Models.Person[] persons);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IMeetingChannel : NMB.Booking.Controllers.MeetingService.IMeeting, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class MeetingClient : System.ServiceModel.ClientBase<NMB.Booking.Controllers.MeetingService.IMeeting>, NMB.Booking.Controllers.MeetingService.IMeeting {
        
        public MeetingClient() {
        }
        
        public MeetingClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public MeetingClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public MeetingClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public MeetingClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public NMB.Booking.Models.Location GetLocationById(int locationId) {
            return base.Channel.GetLocationById(locationId);
        }
        
        public System.Threading.Tasks.Task<NMB.Booking.Models.Location> GetLocationByIdAsync(int locationId) {
            return base.Channel.GetLocationByIdAsync(locationId);
        }
        
        public NMB.Booking.Models.Meeting GetMeetingById(int meetingId) {
            return base.Channel.GetMeetingById(meetingId);
        }
        
        public System.Threading.Tasks.Task<NMB.Booking.Models.Meeting> GetMeetingByIdAsync(int meetingId) {
            return base.Channel.GetMeetingByIdAsync(meetingId);
        }
        
        public NMB.Booking.Models.Person[] GetPersonsByMeetingId(int meetingId) {
            return base.Channel.GetPersonsByMeetingId(meetingId);
        }
        
        public System.Threading.Tasks.Task<NMB.Booking.Models.Person[]> GetPersonsByMeetingIdAsync(int meetingId) {
            return base.Channel.GetPersonsByMeetingIdAsync(meetingId);
        }
        
        public bool ResetMeeting(int meetingId) {
            return base.Channel.ResetMeeting(meetingId);
        }
        
        public System.Threading.Tasks.Task<bool> ResetMeetingAsync(int meetingId) {
            return base.Channel.ResetMeetingAsync(meetingId);
        }
        
        public string AddPersonsMulti(int meetingId, NMB.Booking.Models.Person[] persons) {
            return base.Channel.AddPersonsMulti(meetingId, persons);
        }
        
        public System.Threading.Tasks.Task<string> AddPersonsMultiAsync(int meetingId, NMB.Booking.Models.Person[] persons) {
            return base.Channel.AddPersonsMultiAsync(meetingId, persons);
        }
    }
}
