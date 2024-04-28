import json
from Contexto import Context
from BeautifulSoupStrategy import BeautifulSoupStrategy
from SeleniumStrategy import SeleniumStrategy

class Main:
    @staticmethod
    def save_to_json(data):
        with open("BeautifulSoup.json", "w") as f:
            json.dump(data, f, indent=4)
    @staticmethod
    def save_to_json2(data):
        with open("Selenium.json", "w") as f:
            json.dump(data, f, indent=4)

    def main(self):
        # Stock a escrapear
        url = 'https://finance.yahoo.com/quote/TSLA'

        # Selecciona la estrategia de web scraping
        strategy_bs = Context(BeautifulSoupStrategy())
        strategy_sel = Context(SeleniumStrategy())

        # Usa la estrategia de BeautifulSoup
        open_value_bs = strategy_bs.scrape(url)

        
        
        # Usa la estrategia de Selenium
        open_value_sel = strategy_sel.scrape(url)

        # Combina los datos de ambas estrategias
        combined_data = {**open_value_bs, **open_value_sel}

        # Guarda los datos en un archivo JSON
        self.save_to_json(open_value_bs)
        self.save_to_json2(open_value_sel)

if __name__ == "__main__":
    main = Main()
    main.main()


