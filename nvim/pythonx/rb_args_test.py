import inspect
import rb_args
import re
import unittest

class SnipMock:
    def __init__(self):
        self.rv = ''

    def __iadd__(self, other):
        return self.mkline(line)

    def mkline(self, line="", indent = None):
        return indent + line

class TestRbArgs(unittest.TestCase):
    def test_split_kw_arguments(self):
        args = 'first:, second:, third:'

        self.assertEqual(
            ['first', 'second', 'third'],
            rb_args.split(args)
        )

    def test_split_with_default_args(self):
        args = 'first = first, second: sec'

        self.assertEqual(
            ['first', 'second'],
            rb_args.split(args)
        )

    def test_build_init_from_kw_args(self):
        args = 'first:, second:, third:'
        match = re.search(r'(\s*)defi', '      defi')
        tabstop = 2
        snip = SnipMock()

        rb_args.to_ruby_initializer(
            args,
            match,
            tabstop,
            snip
        )

        expected = '''\
        @first = first
        @second = second
        @third = third'''

        self.assertEqual(
            snip.rv,
            expected
        )

if __name__ == '__main__':
    unittest.main()


