import re
import vim
from string import Template

def split(args):
    args_list = args.split(',')

    return clean_kw_args(args_list)

def clean_kw_args(args_list):
    return list(
        map(
            lambda arg: arg.replace(':', '').replace(' ', ''),
            args_list
        )
    )

def add_and_indent(snip, line):
    print(vim.current.window.cursor)
    column = snip.column
    indent = column / 2

    snip.rv += snip.mkline(line, indent) + "\n"

def to_ruby_initializer(args, snip):
    clean_list = split(args)
    temp = Template('@$arg = $arg')

    for arg in clean_list:
        add_and_indent(snip, temp.substitute(arg=arg))
