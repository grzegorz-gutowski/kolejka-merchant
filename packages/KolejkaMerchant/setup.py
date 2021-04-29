#!/usr/bin/env python3
# vim:ts=4:sts=4:sw=4:expandtab

import os
import re
from setuptools import setup, find_packages

def sub_find_packages(module):
    return [ module ] + [ module + '.' + submodule for submodule in find_packages(re.sub(r'\.', r'/', module)) ]

kolejka_merchant = {
        'name' : 'KolejkaMerchant',
        'description' : 'Kolejka Merchant',
        'packages' : sub_find_packages('kolejka.merchant'),
        'install_requires' : [
            'setproctitle',
            'pyyaml',
            'thriftpy2',
            'KolejkaCommon',
            'KolejkaClient',
            'KolejkaJudge',
        ],
        'entry_points' : {
            'console_scripts' : [
                'kolejka-merchant = kolejka.merchant:main',
            ],
        },
    }

if __name__ == '__main__':
    assert os.path.isfile(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'setup.cfg'))
    setup(**kolejka_merchant)
