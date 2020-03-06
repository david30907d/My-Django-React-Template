from django.http import JsonResponse
from django.test import Client, TestCase


class APITestCase(TestCase):
    def setUp(self: TestCase) -> None:
        self.client = Client()

    def test_api_response(self: TestCase) -> None:
        response = self.client.get("/")
        self.assertAlmostEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"status": "success"})
