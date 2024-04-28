# Va a ser la interfaz para crear las estrategias

import json
from abc import ABC, abstractmethod
from bs4 import BeautifulSoup

class ScrapeStrategy(ABC):
    @abstractmethod
    def scrape(self,url):
        pass
