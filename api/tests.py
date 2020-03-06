from django.test import TestCase
from django.test import Client
from django.http import JsonResponse

class APITestCase(TestCase):
    def setUp(self):
        self.client = Client()

    def test_api_response(self):
        response = self.client.get('/')
        self.assertAlmostEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'status': "success"})