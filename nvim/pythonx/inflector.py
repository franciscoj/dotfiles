import os
import pathlib

DISCARD_LIST = [
    'app',
    'boundaries',
    'collections',
    'concerns',
    'context_matchers',
    'controllers',
    'event_handlers',
    'interactors',
    'jobs',
    'lib',
    'loaders',
    'mailers',
    'models',
    'policies',
    'presenters',
    'queries',
    'services',
    'validators'
]


def camelcase(string):
    """
    Transforms "snake_case" string into "SnakeCase"
    """
    pieces = string.split('_')
    return ''.join(x.title() for x in pieces)


def unspec(string):
    """
    Transforms "some_file_spec.rb" info "some_file.rb"
    """
    return string.replace('_spec', '')


def unext(string):
    """
    Removes the extension from a ruby file name
    """
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
