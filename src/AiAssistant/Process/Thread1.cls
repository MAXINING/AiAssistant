/// This class is generated by the AiAssistant.Process BPL class.
/// This class should not be edited or modified in any way.
/// Do not make direct use of this class in your application.
Class AiAssistant.Process.Thread1 Extends Ens.BP.Thread [ ClassType = persistent, CompileAfter = AiAssistant.Process, GeneratedBy = Ens.BPL.Compiler.CLS, ProcedureBlock ]
{

Method S1(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 #; --- Begin Call Get similar text ---
 #; --- Begin Request ---
 Set callrequest=##class(AiAssistant.MSG.Request).%New()
 If '$IsObject(callrequest) Set status=%objlasterror Quit
 Set status=$$$OK,callrequest=request
 If $$$ISERR(status) Quit
 Set status=..MakeAsyncCall("OnResponse1","AiAssistant.BO.GetSimilarTextBO",callrequest,"Get similar text",1,0,"Get similar text",1)
 If $$$ISERR(status) Quit
 Kill callrequest
 #; --- End Request ---
 #; --- End Call Get similar text ---
 Do ..%PendingResponses.Clear(),..%SyncResponses.Clear()
 Set ..%SyncTimedOut=0,..%PendingTimeout="",..%PendingAlarmHandle="",..%SyncName=""
 If ..%Process.IsResponsePending("Get similar text") Do ..%PendingResponses.SetAt("","Get similar text")
 If ..%PendingResponses.Count()=0 {
    Set ..%NextState="S3"
 } else {
    Set ..%NextState="S2",..%Wait=1
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S1") Goto Exit
}

Method S2(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 If ..%PendingResponses.Count()=0 {
    Set ..%NextState="S3"
 } else {
    Set ..%NextState="S2",..%Wait=1
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S2") Goto Exit
}

Method S3(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 Do ##class(Ens.DataTransform).instantiateProps(context,"context.NewRequest.Question")
 Set status=$$$OK,context.NewRequest.Question=request.Question
 If $$$ISERR(status) Quit
 #; --- Begin Call Get answers ---
 #; --- Begin Request ---
 Set callrequest=##class(Ens.Request).%New()
 If '$IsObject(callrequest) Set status=%objlasterror Quit
 Set status=$$$OK,callrequest=context.NewRequest
 If $$$ISERR(status) Quit
 Set status=..MakeAsyncCall("OnResponse2","AiAssistant.BO.GetAiResponseBO",callrequest,"Get answers",1,0,"Get answers",1)
 If $$$ISERR(status) Quit
 Kill callrequest
 #; --- End Request ---
 #; --- End Call Get answers ---
 Do ..%PendingResponses.Clear(),..%SyncResponses.Clear()
 Set ..%SyncTimedOut=0,..%PendingTimeout="",..%PendingAlarmHandle="",..%SyncName=""
 If ..%Process.IsResponsePending("Get answers") Do ..%PendingResponses.SetAt("","Get answers")
 If ..%PendingResponses.Count()=0 {
    Set ..%NextState="S5"
 } else {
    Set ..%NextState="S4",..%Wait=1
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S3") Goto Exit
}

Method S4(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 If ..%PendingResponses.Count()=0 {
    Set ..%NextState="S5"
 } else {
    Set ..%NextState="S4",..%Wait=1
 }
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S4") Goto Exit
}

Method S5(process As Ens.BusinessProcess, context As Ens.BP.Context, synctimedout As %Boolean, syncresponses As %ArrayOfObjects(ELEMENTTYPE="%Library.Persistent"), request As %Library.Persistent, response As %Library.Persistent) As %Status [ Language = objectscript, PublicList = (process, context) ]
{
 Set $ZT="Trap",status=$$$OK do {
 Do process.ClearAllPendingResponses()
 Set ..%NextState="Stop"
 } while (0)
Exit Quit ..ManageState(status)
Trap Set $ZT="",status=..ManageStatus(status,"S5") Goto Exit
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
