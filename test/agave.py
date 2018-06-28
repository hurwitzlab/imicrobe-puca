import json

from requests.auth import HTTPBasicAuth
from oauthlib.oauth2 import BackendApplicationClient
from requests_oauthlib import OAuth2Session


class Agave:

    def __init__(self, host, user):
        self._host = host
        self._user = user

    def authenticate(self, agave_credentials):
        client_id, client_secret = agave_credentials.split(':')
        #print(client_id)
        #print(client_secret)
        token_url = 'https://{}/token'.format(self._host)

        # generate HTTPBasicAuth Header
        basic_auth = HTTPBasicAuth(client_id, client_secret)
        client = BackendApplicationClient(client_id=client_id)

        # start oauth session
        self._oauth = OAuth2Session(client=client)
        token = oauth.fetch_token(token_url=token_url, auth=basic_auth)
        print(token)
