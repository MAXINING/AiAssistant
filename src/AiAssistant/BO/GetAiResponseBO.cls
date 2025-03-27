Class AiAssistant.BO.GetAiResponseBO Extends Ens.BusinessOperation
{

Property APIKEY As %String(MAXLEN = "");

Property MODELNAME As %String;

Property URL As %String;

Parameter SETTINGS = "APIKEY:Basic,URL:Basic,MODELNAME:Basic";

Method OnMessage(pInput As AiAssistant.MSG.Request, Output pOutput As Ens.StringResponse) As %Status
{
	set question=pInput.Question
	set vectorinfo=pInput.Simtext
	set Question="Use the following prompt to answer: prompt:"_vectorinfo_";Question："_question
	set Answer=##class(AiAssistant.Util.python).GetAnswer(Question,..APIKEY,..URL,..MODELNAME)
	set pOutput=##class(Ens.StringResponse).%New()
	set pOutput.StringValue=Answer
	Quit $$$OK
}

}
