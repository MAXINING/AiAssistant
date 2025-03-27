Class AiAssistant.Util.initialization
{

ClassMethod initialization() As %Status
{
	Do ##class(AiAssistant.Util.python).test("sentence-transformers/all-MiniLM-L6-v2")
	Do ..CreateConfig("minilm","sentence-transformers/all-MiniLM-L6-v2","a generic open source embedding model")
	Do ..CreateTable("AiAssistant.MSG.Embedding","minilm")
	Do ..InsertData("AiAssistant.MSG.Embedding")
	Quit $$$OK
}

ClassMethod CreateConfig(Name, ModelName, description) As %Status
{
	SET sql=" INSERT INTO %Embedding.Config (Name, Configuration, EmbeddingClass, VectorLength, Description) VALUES ( '"_Name_"', '{""modelName"":"""_ModelName_""",""hfCachePath"":""/home/irisowner/.cache/huggingface/hub"",""maxTokens"": 256,""checkTokenCount"": true}',  '%Embedding.SentenceTransformers', 384, '"_description_"' )"
	Set statement = ##class(%SQL.Statement).%New()
	Set qStatus = statement.%Prepare(sql)
	Set rset = statement.%Execute()
	Quit $$$OK
}

ClassMethod CreateTable(tablename, Name) As %Status
{

    ///创建向量表
    
	set sql= "CREATE TABLE IF NOT EXISTS "_tablename_" ( id INT AUTO_INCREMENT PRIMARY KEY,  sentence VARCHAR(2048),  embedding EMBEDDING('"_Name_"','sentence')  ) "
    Set statement = ##class(%SQL.Statement).%New()
	Set qStatus = statement.%Prepare(sql)
	Set rset = statement.%Execute()
	Quit $$$OK
}

ClassMethod InsertData(tablename) As %Status
{
	
   	
   	set array=["Sudden high fever (above 38-39 °C) with chills, muscle soreness and fatigue, headache, dry cough, sore throat, nasal congestion, runny nose (may be mild), nausea and diarrhea in a few patients were diagnosed as influenza (influenza)",
   	"Upper abdominal burning or bloating pain, aggravated after eating, nausea and vomiting (possibly containing bile or bloody fluids), decreased appetite, belching, and severe cases accompanied by fever and dehydration. The diagnosis is acute bacterial gastritis",
   	"Coughing accompanied by yellow or rusty sputum (Streptococcus pneumoniae infection), high fever, chills, shortness of breath, chest pain (aggravated by deep breathing or coughing), and auscultation of wet rales or consolidation signs in the lungs. The diagnosis result is community-acquired pneumonia (CAP)",
   	"Most asymptomatic individuals with occasional headaches, dizziness, and tinnitus that have not been controlled for a long time may experience blurred vision, severe chest tightness, and hypertension crisis (blood pressure ≥ 180/120 mmHg), diagnosed as primary hypertension",
   	"Paroxysmal sneezing (obvious in the morning) with watery nasal discharge, nasal congestion, nasal itching, conjunctival congestion, and tearing symptoms that worsen seasonally (such as pollen season) is diagnosed as allergic rhinitis",
   	"Numbness or stabbing pain in the thumb, index finger, and middle finger can worsen at night, but shaking the hand can alleviate hand weakness (such as decreased grip strength). In severe cases, the diagnosis of atrophy of the large fish border muscle is carpal tunnel syndrome"
   	]
   	    
	set sql= "insert into "_tablename_" (sentence)values(?) "
    Set statement = ##class(%SQL.Statement).%New()
	Set qStatus = statement.%Prepare(sql)
	
	for i=0:1:array.%Size()-1
	{
	 Set rset = statement.%Execute(array.%Get(i))
	}
}

ClassMethod CreatWepApplication() As %Status
{
	zn "%SYS"
	Set sc("DispatchClass")="AiAssistant.Util.Rest",sc("AutheEnabled")=64,sc("IsNameSpaceDefault")=0,sc("MatchRoles")=":%All",sc("GroupById")="%ISCMgtPortal",sc("NameSpace")="USER",sc("DeepSeeEnabled")=1
	Set tSC=##Class(Security.Applications).Create("/csp/getaianswer",.sc)
	zn "user"
	Quit tsc
}

}
