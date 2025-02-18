from services.search_service import SearchService
from pydantic_models.chat_body import Chatbody
from fastapi import FastAPI

app = FastAPI()

search_service = SearchService()

# chat 
# /chat?query=Who%20is%20Manas?%20.
@app.post("/chat")
def chat_endpoint(body: Chatbody):
    # Search Web and Find Appropriate sources
    search_service.web_search(body.query)
    # sort The Sources
    # Generate Response using the LLM
    return body.query