from pydantic import BaseModel

class Chatbody(BaseModel):
      query: str