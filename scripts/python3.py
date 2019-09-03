#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
repo: https://github.com/...
"""

import argparse
import collections

"""
Notes:

Exit Codes -  Any unhandled exception will result in a non-zero exit code.

References:

1.  https://docs.python.org/3/howto/argparse.html
2.  https://docs.python.org/3/library/argparse.html
"""

__author__      = 'author name'
__copyright__   = 'Copyright <year>, {}'.format(__author__)
__credits__     = [__author__]
__license__     = 'MIT'
__version__     = '0.1.0'               # major.minor.hotfix/patch
__maintainer__  = __author__
__email__       = 'author email'
__status__      = '<status>'            # 'Pre-Alpha'. 'Alpha', 'Beta', 'Production/Stable'
__doc__         = '<short descripion>'  # will be displayed in --help message


def _cli():
    """Parse cli options and return a dictionary."""
    parser = argparse.ArgumentParser(
            description=__doc__,
            formatter_class=argparse.ArgumentDefaultsHelpFormatter,
            argument_default=argparse.SUPPRESS)

    # optional arguments
    parser.add_argument('-f', '--foo', help="This is the foo argument")
    parser.add_argument('-b', '--bar', help="This is the bar argument")

    qux_help = ("This argument will show its default in the help due to "
                "ArgumentDefaultsHelpFormatter")
    parser.add_argument('-q', '--qux', default=3, help=qux_help)

    # required positional args
    parser.add_argument('echo', help="echo string here.")

    args = parser.parse_args()

    return vars(args)


def setup(app):
    """Do any required setup actions like read config file, create tmp dir, etc."""
    pass


def cleanup(app):
    """Perform any necessary cleanup operations like deleting a tmp dir."""
    pass


def main(app):
    """Actual business logic goes here."""
    pass


if __name__ == '__main__':
    app = collections.defaultdict(dict)

    try:
        app['args'] = _cli()
        main(app)

    except ExpectedException:
        """Optional - An expected exception that requires special handeling."""
        # handle_exception(app)
        # raise (re-raise exception if non-zero exit code is desired)

    finally:
        """This always runs; if, and if not, and exception was raised."""
        cleanup(app)
