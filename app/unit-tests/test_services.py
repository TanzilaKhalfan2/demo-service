import unittest
from unittest.mock import patch, Mock
from app.services import fetch_and_sort_people, fetch_person


class TestServices(unittest.TestCase):

    @patch('app.services.requests.get')
    def test_fetch_and_sort_people(self, mock_get):
        # Mock the response from SWAPI
        mock_response = Mock()
        mock_response.json.return_value = {
            'results': [
                {'name': 'Luke Skywalker'},
                {'name': 'Darth Vader'}
            ],
            'next': None
        }
        mock_response.raise_for_status = Mock()
        mock_get.return_value = mock_response

        # Call the service function
        result = fetch_and_sort_people()

        # Check the results
        self.assertEqual(len(result), 2)
        self.assertEqual(result[0]['name'], 'Darth Vader')
        self.assertEqual(result[1]['name'], 'Luke Skywalker')

    @patch('app.services.requests.get')
    def test_fetch_person(self, mock_get):
        # Mock the response from SWAPI
        mock_response = Mock()
        mock_response.json.return_value = {'name': 'Luke Skywalker'}
        mock_response.raise_for_status = Mock()
        mock_get.return_value = mock_response

        # Call the service function
        person_id = 1
        result = fetch_person(person_id)

        # Check the results
        self.assertEqual(result['name'], 'Luke Skywalker')


if __name__ == '__main__':
    unittest.main()
