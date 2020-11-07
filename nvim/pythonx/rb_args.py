import re
from string import Template


def split(args):
    """
    Given the text with the list of args of a ruby initializer it splits the
    name of each one of them and cleans up default values.
    """
    args_list = args.split(',')

    return clean_kw_args(args_list)


def clean_kw_args(args_list):
    """
    Cleans default values from the split of args.
    """
    clean = re.compile('(\\s|(\\s?=|:).*)')

    return list(
        filter(
            lambda x: len(x) > 0,
            map(
                lambda arg: clean.sub('', arg),
                args_list
            )
        )
    )


def to_ruby_initializer(args, indent, snip):
    clean_list = split(args)
    temp = Template('@$arg = $arg')
    snip.shift(indent)

    if not clean_list:
        snip.rv = ''
    else:
        for arg in clean_list:
            ivar = temp.substitute(arg=arg)
            snip += ivar
