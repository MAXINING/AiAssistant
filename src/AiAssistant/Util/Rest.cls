Class AiAssistant.Util.Rest Extends %CSP.REST
{

Parameter HandleCorsRequest = "true";

XData UrlMap [ XMLNamespace = "http://www.bjgoodwill.com/urlmap" ]
{
<Routes>
  <Route Url="/getAnswer" Method="POST" Call="GetAnswer"/>


 
</Routes>
}

ClassMethod GetAnswer() As %Status
{
	
 Set BS =##class(AiAssistant.BS.GetQuestionBS).%New()
	
    	 Set tSC=##class(Ens.Director).CreateBusinessService("AiAssistant.BS.GetQuestionBS",.BS)
       Set request =##class(Ens.StringRequest).%New()
       set request.StringValue=$zcvt(%request.Content.Read(),"I","UTF8")
       set output =##class(Ens.StringResponse).%New()
       Set tSC1=BS.ProcessInput(request,.output)
       set message =output.StringValue
       Do %response.SetHeader("Content-Type", "application/json;charset=UTF-8")   
       w $ZCVT(message,"O","UTF8")
	Quit $$$OK
}

}
