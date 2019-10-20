import unittest
import inspect
import rb_args

class SnipMock:
    def __init__(self, column):
        self.column = column

    def __iadd__(self, other):
        return self.mkline(line)

    def mkline(self, line="", indent = None):
        return "\n" + line

class RbArgs(unittest.TestCase):
    def test_split_kw_arguments(self):
        args = 'first:, second:, third:'

        self.assertEqual(
            ['first', 'second', 'third'],
            rb_args.split(args)
        )

    def test_build_init_from_kw_args(self):
        args = 'first:, second:, third:'

        self.assertEqual(
            inspect.cleandoc(f'''\

                @first = first
                @second = second
                @third = third'''),
            rb_args.to_ruby_initializer(args, SnipMock(4))
        )

if __name__ == '__main__':
    unittest.main()


