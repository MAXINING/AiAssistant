Class AiAssistant.NewProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="AiAssistant.NewProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="AiAssistant.BO.GetAiResponseBO" Category="" ClassName="AiAssistant.BO.GetAiResponseBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="APIKEY"></Setting>
    <Setting Target="Host" Name="MODELNAME"></Setting>
    <Setting Target="Host" Name="URL"></Setting>
  </Item>
  <Item Name="AiAssistant.BO.GetSimilarTextBO" Category="" ClassName="AiAssistant.BO.GetSimilarTextBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AiAssistant.Process" Category="" ClassName="AiAssistant.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AiAssistant.BS.GetQuestionBS" Category="" ClassName="AiAssistant.BS.GetQuestionBS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
