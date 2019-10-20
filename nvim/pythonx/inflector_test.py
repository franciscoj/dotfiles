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

        self.assertEqual(
            'Namespace',
            inflector.outer_ruby_module(path)
        )

    def test_namespaced_controller(self):
        path = pathlib.Path('/my_app/app/controllers/nsa/nsb/whatevers_controller.rb')

        self.assertEqual(
            'Nsa::Nsb::WhateversController',
            inflector.to_ruby(path)
        )

        self.assertEqual(
            'Nsa',
            inflector.outer_ruby_module(path)
        )

    def test_lib(self):
        path = pathlib.Path('/my_app/lib/whatever.rb')

        self.assertEqual(
            'Whatever',
            inflector.to_ruby(path)
        )

        self.assertEqual(
            'Whatever',
            inflector.outer_ruby_module(path)
        )

    def test_service_on_a_component(self):
        path = pathlib.Path('/my_app/components/comp/comp_namje/spec/services/comp_name/class_name.rb')

        self.assertEqual(
            'CompName::ClassName',
            inflector.to_ruby(path)
        )

        self.assertEqual(
            'ClassName',
            inflector.inner_ruby_class(path)
        )

        self.assertEqual(
            'CompName',
            inflector.outer_ruby_module(path)
        )

if __name__ == '__main__':
    unittest.main()

