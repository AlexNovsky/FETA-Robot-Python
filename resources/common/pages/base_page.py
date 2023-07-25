import random
import time
import yaml
import os

def generate_username(name: str) -> str:
    """
    Generates and returns unique value from stored in yaml file variable and appended timestamp
        :param name:        String argument
        :return:            generated_name string variable
    """
    timestamp = int(time.time())
    generated_name = f'{name}{timestamp}'
    if generated_name == f'{name}{timestamp}':
        return str(generated_name)

def get_whitelisted_digits() -> str:
    config_folder = os.path.join(os.path.dirname(__file__), '..', 'data')
    config_file_path = os.path.join(config_folder, 'common_data.yaml')

    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    whitelisted_digits = data['whitelisted_characters']['digits']
    return whitelisted_digits

def generate_phone() -> int:
    """
    Generates US based random 10 digits phone number
        :return:            phone_number int. variable
    """
    phone_number_lenght = 9
    phone_number = '1'
    numbers = get_whitelisted_digits()
    for i in range(phone_number_lenght):
        phone_number += ''.join(random.choice(str(numbers)))
    return int(phone_number)
