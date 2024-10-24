import requests
from app.utils import log_error


SWAPI_URL = "https://swapi.dev/api/people/"


def fetch_and_sort_people():
    try:
        all_people = []
        url = SWAPI_URL

        while url:
            response = requests.get(url)
            response.raise_for_status()
            data = response.json()

            all_people.extend(data['results'])
            url = data['next']  # Get the next page URL

        sorted_people = sorted(all_people, key=lambda person: person['name'])
        return sorted_people
    except requests.exceptions.RequestException as e:
        log_error(e)
        raise RuntimeError("Failed to fetch data from SWAPI")


def fetch_person(person_id):
    try:
        response = requests.get(f"{SWAPI_URL}{person_id}/")
        response.raise_for_status()
        person = response.json()
        return person
    except requests.exceptions.RequestException as e:
        log_error(e)
        raise RuntimeError(
            f"Failed to fetch person with ID {person_id} from SWAPI"
            )
