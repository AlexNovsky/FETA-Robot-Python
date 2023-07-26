import random
import yaml
import time
import os


def generate_username(name: str) -> str:
    """
    Generates and returns unique value from stored in yaml file variable and appended timestamp
        :param name:        String argument
        :return:            generated_name string variable
    """
    timestamp = str(int(time.time()))
    generated_name = f'{name}{timestamp}'
    if generated_name == f'{name}{timestamp}':
        return str(generated_name).capitalize()

def generate_phone() -> str:
    """
    Generates US based random 10 digits phone number
        :return:            phone_number str variable
    """
    phone_number_lenght = 9
    phone_number = '1'
    numbers = get_whitelisted_digits()
    for i in range(phone_number_lenght):
        phone_number += ''.join(random.choice(str(numbers)))
    return str(int(phone_number))

def get_whitelisted_digits() -> str:
    config_folder = os.path.join(os.path.dirname(__file__), '..', 'data')
    config_file_path = os.path.join(config_folder, 'common_data.yaml')

    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    whitelisted_digits = data['whitelisted_characters']['digits']
    return whitelisted_digits

def generate_email():
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)

    timestamp = str(int(time.time()))
    email = data['test_user']['email'].replace('{placeholder}', timestamp)
    return email.lower()

def get_gender_locator():
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    gender = str(data['test_user']['gender'])
    if gender.capitalize() == 'Male':
        return str("//label[contains(text(),'Male')]")
    elif gender.capitalize() == 'Female':
        return str("//label[contains(text(),'Female')]")
    else:
        return str("//label[contains(text(),'Other')]")

def get_hobbies():
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    hobbies = str(data['test_user']['hobbies'])
    # TODO defining checkbox locators based on val. hobbies
