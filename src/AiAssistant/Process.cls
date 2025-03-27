/// 
Class AiAssistant.Process Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='simtext' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='NewRequest' type='AiAssistant.MSG.Request' instantiate='0' />
</context>
<sequence xend='169' yend='750' >
<call name='Get similar text' target='AiAssistant.BO.GetSimilarTextBO' async='0' xpos='196' ypos='325' >
<request type='AiAssistant.MSG.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' >
<assign property="context.NewRequest.Simtext" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
<assign property="context.NewRequest.Question" value="request.Question" action="set" languageOverride="" xpos='194' ypos='437' />
<call name='Get answers' target='AiAssistant.BO.GetAiResponseBO' async='0' xpos='177' ypos='556' >
<request type='Ens.Request' >
<assign property="callrequest" value="context.NewRequest" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
