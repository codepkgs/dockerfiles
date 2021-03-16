import requests
import sys
import json


def get_ip(ip=None):
    api = 'http://ip-api.com/json/{}'.format(ip) if ip is not None else 'http://ip-api.com/json'
    try:
        r = requests.get(api)
        if r.ok:
            data = r.json()
            print(json.dumps(data, indent=4))
            print()
    except Exception as e:
        print(e)

if __name__ == '__main__':
    if len(sys.argv) != 1:
        ips = sys.argv[1:]
        for ip in ips:
            get_ip(ip)
    else:
        get_ip()
