Class AiAssistant.BO.GetSimilarTextBO Extends Ens.BusinessOperation
{

Method OnMessage(pInput As AiAssistant.MSG.Request, Output pOutput As Ens.StringResponse) As %Status
{
	set question=pInput.Question
	set sql="SELECT TOP 1 sentence FROM AiAssistant.MSG.Embedding ORDER BY VECTOR_DOT_PRODUCT(embedding , EMBEDDING('"_question_"')) DESC"
	Set statement = ##class(%SQL.Statement).%New()
	Set qStatus = statement.%Prepare(sql)
	Set rset = statement.%Execute()
	SET siminfo=""
	if rset.%Next()
	{
		set siminfo=rset.%Get("sentence")
	}
	set pOutput=##class(Ens.StringResponse).%New()
	set pOutput.StringValue=siminfo
	Quit $$$OK
}

}
