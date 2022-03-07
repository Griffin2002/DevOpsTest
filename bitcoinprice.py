import json
import requests
import datetime

def get_btc_price():
    url = 'https://api.coindesk.com/v1/bpi/currentprice.json'
    response = requests.get(url)
    response_json = response.json()
    btc_price = response_json['bpi']['USD']['rate']
    return {
        'ticker': 'BTC',
        'current_price': btc_price,
        'timestamp': '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
    }


def lambda_handler(event, context):
    return get_btc_price()