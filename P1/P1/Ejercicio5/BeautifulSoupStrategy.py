import json
import requests
from bs4 import BeautifulSoup
from ScrapeStrategy import ScrapeStrategy

class BeautifulSoupStrategy(ScrapeStrategy):
    def scrape(self, url):
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            
            open_value_td = soup.find('td', {'data-test': 'OPEN-value'}).text
            if open_value_td == None:
                open_value_td = 'Open Value not found'

            precio_cierre_anterior = soup.find('td',{'data-test': 'PREV_CLOSE-value'}).text
            if precio_cierre_anterior == None:
                precio_cierre_anterior = 'Precio cierre anterior not found'
            
            volumen = soup.find('td',{'data-test': 'TD_VOLUME-value'}).text
            if volumen == None:
                volumen = 'Volumen not found'

            capitalizacion_mercado = soup.find('td',{'data-test': 'MARKET_CAP-value'}).text
            if capitalizacion_mercado == None:
                capitalizacion_mercado = 'Capitalizacion Mercado Value not found'

            # Crear un diccionario con la información
            return {
                'Open Value': open_value_td,
                'Previous Close': precio_cierre_anterior,
                'Volume': volumen,
                'Market Cap': capitalizacion_mercado
            }

        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'

