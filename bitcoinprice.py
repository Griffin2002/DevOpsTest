import json
import requests
import datetime

def get_btc_price():
    url = 'https://api.coindesk.com/v1/bpi/currentprice.json'
    response = requests.get(url)
    response_json = response.json()
    btc_price = response_json['bpi']['USD']['rate']
    return btc_price


def lambda_handler(event, context):
    return json.JSONEncoder().encode({
        'ticker': 'BTC',
        'price': get_btc_price(),
        'timestamp': datetime.datetime.now().isoformat()
    })
    