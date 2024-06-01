#!/usr/bin/python3
"""
A script to renew the GSLT token for an Unturned server.
"""

import os
import json
import requests

# set working directory to the directory of this script
os.chdir(os.path.dirname(os.path.realpath(__file__)))

STEAM_API = 'https://api.steampowered.com'
TIMEOUT = 10

def get_config():
    """
    Get the config from config.json
    """
    with open('config.json', 'r', encoding='UTF-8') as config_file:
        return json.load(config_file)

class Requester:
    """
    Class for making requests to Steam WebAPI
    """
    def __init__(self, steam_webapi_key):
        self.steam_webapi_key = steam_webapi_key

    def get(self, interface, method, params):
        """
        Make a GET request to Steam WebAPI
        """
        url = f'{STEAM_API}/{interface}/{method}/v1/?key={self.steam_webapi_key}'
        for key, value in params.items():
            url += f'&{key}={value}'
        return requests.get(url, timeout=TIMEOUT).json()

    def post(self, interface, method, params):
        """
        Make a POST request to Steam WebAPI
        """
        url = f'{STEAM_API}/{interface}/{method}/v1/?key={self.steam_webapi_key}'
        # steam sends POST params as normal params, not JSON.
        for key, value in params.items():
            url += f'&{key}={value}'

        return requests.post(url, timeout=TIMEOUT).json()


class GameServersInterface:
    """
    Interface for IGameServersService
    """
    def __init__(self, requester):
        self.requester = requester
        self.interface = 'IGameServersService'

    def get_account_list(self):
        """
        Returns a list of game server accounts.
        """
        return self.requester.get(self.interface, 'GetAccountList', {})

    def reset_login_token(self, steamid):
        """
        Resets the login token for a game server account.
        """
        return self.requester.post(self.interface, 'ResetLoginToken', {'steamid': steamid})


def main():
    """
    The main function
    """
    # get steam webapi key
    config = get_config()
    steam_webapi_key = config['steam_webapi_key']
    requester = Requester(steam_webapi_key)

    # print accounts list
    gsi = GameServersInterface(requester)

    accounts_list = gsi.get_account_list()

    # get one with 'memo' including 'Unturned'
    unturned_account = None
    for account in accounts_list['response']['servers']:
        if 'Unturned' in account['memo']:
            unturned_account = account
            break

    if unturned_account is None:
        print('No Unturned account found')
        # exit with error
        exit(1)

    print('Unturned account found! Resetting login token...')

    try:
        token_response = gsi.reset_login_token(unturned_account['steamid'])
        login_token = token_response['response']['login_token']

        unturned_config_path = config['unturned_config_path']

        # Load the Unturned's server config
        with open(unturned_config_path, 'r', encoding='UTF-8') as server_config_file:
            server_config = json.load(server_config_file)

        # replace the GSLT token in Browser.Login_Token
        server_config['Browser']['Login_Token'] = login_token

        # save the config
        with open(unturned_config_path, 'w', encoding='UTF-8') as server_config_file:
            json.dump(server_config, server_config_file, indent=4)
    except requests.exceptions.RequestException:
        print('Request failed')
        # exit with error
        exit(1)

    print('Login token reset successfully!')
    exit(0)

if __name__ == '__main__':
    main()
