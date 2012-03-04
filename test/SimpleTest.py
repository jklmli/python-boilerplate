import unittest

class SimpleTest(unittest.TestCase):
  def setUp(self):
    pass

  def test_simple(self):
    self.assertEqual(1 + 1, 2)

  def tearDown(self):
    pass