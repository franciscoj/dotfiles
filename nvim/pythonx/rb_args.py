import re
from string import Template


def split(args):
    args_list = args.split(',')

    return clean_kw_args(args_list)


def clean_kw_args(args_list):
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


def add_and_indent(snip, indent, line, newline="\n"):
    snip.rv += snip.mkline(line, indent) + newline


def calculate_indent(match, tabstop):
    spaces = match.group(1)

    return spaces + tabstop * ' '


def to_ruby_initializer(args, match, tabstop, snip):
    indent = calculate_indent(match, tabstop)
    clean_list = split(args)
    temp = Template('@$arg = $arg')

    for arg in clean_list[:-1]:
        add_and_indent(
            snip,
            indent,
            temp.substitute(arg=arg)
        )

    add_and_indent(
        snip,
        indent,
        temp.substitute(arg=clean_list[-1]),
        ''
    )
