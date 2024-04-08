from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from ScrapeStrategy import ScrapeStrategy
import json

class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url):
        
        # Inicializamos el driver de Selenium
        driver = webdriver.Chrome()  # Aquí se puede utilizar el driver del navegador que prefieras
        
        # Accedemos a la página
        driver.get(url)
        
        # Espera a que los elementos carguen
        element_present = EC.presence_of_element_located((By.XPATH, "/html/body/div[1]/div/div/div[1]/div/div[3]/div[1]/div/div[1]/div/div/div/div[2]/div[1]/table/tbody/tr[1]/td[2]"))
        WebDriverWait(driver, 10).until(element_present) 
        
        # Extraemos la información relevante
        previous_close = driver.find_element(By.XPATH,'//*[@id="quote-summary"]/div[1]/table/tbody/tr[1]/td[2]').text
        
        open_value = driver.find_element(By.XPATH,'//*[@id="quote-summary"]/div[1]/table/tbody/tr[2]/td[2]').text
        
        
        volume = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[1]/table/tbody/tr[7]/td[2]').text
        
        market_cap = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[2]/table/tbody/tr[1]/td[2]').text

        # Cerramos el driver
        driver.quit()
        
        # Devolvemos los datos en un diccionario

        return {
            'Open Value': open_value,
            'Previous Close': previous_close,
            'Volume': volume,
            'Market Cap': market_cap
        }
