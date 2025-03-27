Class AiAssistant.Util.python
{

ClassMethod GetAnswer(Question, key, URL, MODELNAME) As %String [ Language = python ]
{
 import requests


 API_KEY = key 

 url = URL
 headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {API_KEY}"
 }

 data = {
    "model": MODELNAME, 
    "messages": [
        {"role": "system", "content": "You are a professional medical assistant. Please diagnose the patient and make medical recommendations based on similar cases provided"},
        {"role": "user", "content": Question}
    ],
    "stream": False  
 }

 response = requests.post(url, headers=headers, json=data)

 if response.status_code == 200:
    result = response.json()
    print(result['choices'][0]['message']['content'])
    return str(result['choices'][0]['message']['content'])
 else:
    print("Error：", response.status_code)
    return "Error"
}

ClassMethod test(ModelName) [ Language = python ]
{
  
   from sentence_transformers import SentenceTransformer
   m = SentenceTransformer(ModelName)
   sentences = ['test', 'test']
   sentence_embeddings = m.encode(sentences)
   print("Sentence embeddings:")
   print(sentence_embeddings)
}

}
