#!/usr/bin/env python

import sys
import urllib.request

URL = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'

def main():
    domains = set()
    data = ''

    with urllib.request.urlopen(URL) as f:
        data = f.read().decode('utf-8')

    for line in data.splitlines():
        if not line.startswith('0.0.0.0'):
            continue
        _, _, domain = line.partition(' ')
        domain = domain.partition('#')[0].strip()
        if not domain or domain == '0.0.0.0' or domain == 'localhost':
            continue
        domains.add(domain)

    buf = [ 'server:' ]
    for domain in sorted(domains):
        buf.append('\tlocal-zone: "{domain}" redirect'.format(domain=domain))
        buf.append('\tlocal-data: "{domain} A 0.0.0.0"'.format(domain=domain))
        buf.append('\tlocal-data: "{domain} AAAA ::"'.format(domain=domain))

    print('\n'.join(buf))
    return 0

if __name__ == '__main__':
    sys.exit(main())
