Class AiAssistant.MSG.Request Extends Ens.Request
{

Property Question As %String(MAXLEN = "");

Property Simtext As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Question</Value>
</Value>
<Value name="2">
<Value>Simtext</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
