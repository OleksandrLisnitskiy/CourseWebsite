from django.test import TestCase
from services.models import Service


class ServiceModelTest(TestCase):

    def setUp(self):
        # Set up data for the test
        self.service = Service.objects.create(
            name="Webinar", master="William S. Vincent", price=100
        )

    def test_service_name(self):
        # Test that the title field works
        self.assertEqual(self.service.name, "Webinar")

    def test_service_str(self):
        # Test that the string representation of the book works
        self.assertEqual(str(self.service), "Webinar")
