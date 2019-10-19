import unittest
import inflector
import pathlib

class TestInflector(unittest.TestCase):
    def test_camelcase(self):
        self.assertEqual(
            'MyClassName',
            inflector.camelcase('my_class_name')
        )

    def test_to_ruby_class(self):
        self.assertEqual(
            'MyClassName',
            inflector.to_ruby_class('my_class_name_spec')
        )

    def test_namespaced_model(self):
        path = pathlib.Path('/my_app/app/models/namespace/the_model.rb')

        self.assertEqual(
            'Namespace::TheModel',
            inflector.to_ruby(path)
        )

    def test_namespaced_controller(self):
        path = pathlib.Path('/my_app/app/controllers/nsa/nsb/whatevers_controller.rb')

        self.assertEqual(
            'Nsa::Nsb::WhateversController',
            inflector.to_ruby(path)
        )

    def test_lib(self):
        path = pathlib.Path('/my_app/lib/whatever.rb')

        self.assertEqual(
            'Whatever',
            inflector.to_ruby(path)
        )

    def test_spec_service(self):
        path = pathlib.Path('/my_app/spec/services/namespace/whatever_spec.rb')

        self.assertEqual(
            'Namespace::Whatever',
            inflector.to_ruby(path)
        )


if __name__ == '__main__':
    unittest.main()

