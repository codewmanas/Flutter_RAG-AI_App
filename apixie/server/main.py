from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService
from pydantic_models.chat_body import Chatbody
from fastapi import FastAPI

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

@app.post("/chat")
def chat_endpoint(body: Chatbody):
    

    # Search Web and Find Appropriate sources
    search_results = search_service.web_search(body.query)


    # sort The Sources
    sorted_results = sort_source_service.sort_sources(body.query, search_results)
    print(sorted_results)


    # Generate Response using the LLM
    response = llm_service.generate_response(body.query, sorted_results)

    return response