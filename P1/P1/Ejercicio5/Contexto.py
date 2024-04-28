from BeautifulSoupStrategy import BeautifulSoupStrategy
from SeleniumStrategy import SeleniumStrategy
from ScrapeStrategy import ScrapeStrategy


class Context:
    def __init__(self, strategy):
        self._strategy = strategy

    def scrape(self, url):
        return self._strategy.scrape(url)
    

