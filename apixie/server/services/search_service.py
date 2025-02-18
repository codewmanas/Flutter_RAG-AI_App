from config import Settings


settings = Settings()

class SearchService:
      def web_search(self, query: str):
          print(Settings().TAVILY_API_KEY)