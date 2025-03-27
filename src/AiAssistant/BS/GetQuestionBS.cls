Class AiAssistant.BS.GetQuestionBS Extends Ens.BusinessService
{

Parameter ADAPTER;

Method OnProcessInput(pInput As Ens.StringRequest, Output pOutput As %RegisteredObject) As %Status
{

	SET pRequest=##class(AiAssistant.MSG.Request).%New()
	SET pRequest.Question=pInput.StringValue
	Set tSC=..SendRequestSync("AiAssistant.Process",pRequest,.pOutput)
	
	Quit $$$OK
}

}
