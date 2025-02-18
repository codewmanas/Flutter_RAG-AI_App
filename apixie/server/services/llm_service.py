from typing import List
from config import Settings
import google.generativeai as genai


settings = Settings()


class LLMService:
      def __init__(self):
           genai.configure(api_key=settings.GEMINI_API_KEY)
           self.model = genai.GenerativeModel("gemini-2.0-flash")

      def generate_response(self,query: str, search_results: List[dict]):
          # Source 1: <url>
          # <content>
          content_text ="\n\n".join([
               f"Source {i+1} {result['url']}:\n{result['content']}"
               for i, result in enumerate(search_results)
          ]) 

          full_prompt = f"""
          Context from Web Search:
          {content_text}

          Query: {query}

           Please provide a comprehensive , detailed well cited  accurate response using the above context.
           Think and Reason deeply Ensure  it answers the query user is asking . Do not use your knowledge until it is absolutely necessary. 
          """

          response = self.model.generate_content(full_prompt)

          return response.text
