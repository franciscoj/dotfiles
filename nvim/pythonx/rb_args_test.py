import rb_args
import unittest


class SnipMock:
    def __init__(self):
        self.rv = ''
        self.indent = ''

    def mkline(self, line="", indent=None):
        return indent + line

    def shift(self, shiftwidth):
        self.indent = shiftwidth * '  '
        return

    # This allows doing snip += 'line'
    def __add__(self, val):
        self.rv += self.indent + val + "\n"
        return self

    def __str__(self):
        return self.rv


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
        args = 'first:, second:'
        snip = SnipMock()
        rb_args.to_ruby_initializer(args, 1, snip)
        expected = '  @first = first\n  @second = second\n'

        self.assertEqual(snip.rv, expected)

    def test_build_init_without_args(self):
        args = ''
        snip = SnipMock()
        rb_args.to_ruby_initializer(args, 3, snip)
        expected = ''

        self.assertEqual(snip.rv, expected)


if __name__ == '__main__':
    unittest.main()
