import asyncio
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService
from pydantic_models.chat_body import Chatbody
from fastapi import FastAPI, WebSocket

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


#chat Websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
       await asyncio.sleep(0.1)
       data = await websocket.receive_json()
       print(data)
       query = data.get("query")
       print(query) 
       search_results = search_service.web_search(query)
       print(search_results)
       sorted_results = sort_source_service.sort_sources(query, search_results)
       print(sorted_results)
       await asyncio.sleep(0.1)
       await websocket.send_json({'type': 'search_result','data': sorted_results})
       print("hi")  

            
       for chunk in llm_service.generate_response(query, sorted_results):
           await asyncio.sleep(0.1)
           await websocket.send_json({
               'type': 'content',
               'data': chunk
           })
    except:
        print("Unexpected Error Occurred")
    finally:
        await websocket.close()


@app.post("/chat")
def chat_endpoint(body: Chatbody):
    search_results = search_service.web_search(body.query)
    sorted_results = sort_source_service.sort_sources(body.query, search_results)
    response = llm_service.generate_response(body.query, sorted_results)

    return response