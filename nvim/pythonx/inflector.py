import os
import pathlib

DISCARD_LIST = [
    'app',
    'collections',
    'concerns',
    'context_matchers',
    'controllers',
    'event_handlers',
    'interactor',
    'jobs',
    'lib',
    'mailers',
    'models',
    'policies',
    'presenters',
    'services',
    'validators'
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


def outer_ruby_module(path):
    try:
        components = components_list(path, [])
        outer = components[-1]

        return to_ruby_class(outer)
    except RecursionError:
        print('RecursionError: while trying on path:')
        print(path)

        return 'InflectionError'


def inner_ruby_class(path):
    try:
        components = components_list(path, [])
        outer = components[0]

        return to_ruby_class(outer)
    except RecursionError:
        print('RecursionError: while trying on path:')
        print(path)

        return 'InflectionError'


def to_ruby(path):
    try:
        components = components_list(path, [])
        camelcased = list(map(lambda x: to_ruby_class(x), components))
        camelcased.reverse()

        return '::'.join(camelcased)
    except RecursionError:
        print('RecursionError: while trying on path:')
        print(path)

        return 'Inflection::Error'
