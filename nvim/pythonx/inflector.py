import os
import pathlib
import string

DISCARD_LIST=[
    'models',
    'controllers',
    'services',
    'concerns',
    'interactor',
    'lib'
]

def camelcase(string):
    pieces = string.split('_')
    return ''.join(x.title() for x in pieces)

def unspec(string):
    return string.replace('_spec', '')

def unext(string):
    return string.replace('.rb', '')

def on_discard_list(component):
    try:
        return DISCARD_LIST.index(component)
    except ValueError:
        return -1

def components_list(path, components):
    (tail, component) = os.path.split(path)

    if on_discard_list(component) != -1:
        return components
    else:
        components.append(component)

        return components_list(
            pathlib.Path(tail),
            components
        )

def to_ruby_class(name):
    class_name = unspec(unext(name))

    return camelcase(class_name)

def to_ruby(path):
    try:
        components = components_list(os.path.abspath(path), [])
        camelcased = list(map(lambda x: to_ruby_class(x), components))
        camelcased.reverse()

        return '::'.join(camelcased)
    except RecursionError:
        print('RecursionError: while trying on path:')
        print(path)

        return 'Inflection::Error'
