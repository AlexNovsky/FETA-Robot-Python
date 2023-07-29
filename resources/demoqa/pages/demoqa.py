import yaml
import time
import os


def get_gender_locator():
    """
    Based on retrieved from configuration yaml file User's gender, returning according XPATH for gender checkbox
        :return:                locator in XPATH format
    """
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

def check_sports_hobby():
    """
    Checking if User's hobbies list contain Sports value
        :return: locator        If Sports hobby is in the hobbies list
                 None           If Sports hobby is not in the hobbies list
    """
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    hobbies = str(data['test_user']['hobbies'])
    hobbies_list = [h.strip() for h in hobbies.split(',')]
    print(hobbies)
    print(hobbies_list)
    for word in hobbies_list:
        if word.lower() == 'sports':
            return str("//label[contains(text(),'Sports')]")
    return None

def check_reading_hobby():
    """
    Checking if User's hobbies list contain Reading value
        :return: locator        If Reading hobby is in a list of hobbies
                 None           If Reading hobby is not in a list of hobbies
    """
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    hobbies = str(data['test_user']['hobbies'])
    hobbies_list = [h.strip() for h in hobbies.split(',')]
    for word in hobbies_list:
        if word.lower() == 'reading':
            return str("//label[contains(text(),'Reading')]")
    return None

def check_music_hobby():
    """
    Checking if User's hobbies list contain Reading value
        :return: locator        If Music hobby in a list of hobbies
                 None           If Music hobby is not in a list of hobbies
    """
    config_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'demoqa', 'data')
    config_file_path = os.path.join(config_folder, 'demoqa_data.yaml')
    with open(config_file_path, 'r') as file:
        data = yaml.safe_load(file)
    hobbies = str(data['test_user']['hobbies'])
    hobbies_list = [h.strip() for h in hobbies.split(',')]
    for word in hobbies_list:
        if word.lower() == 'music':
            return str("//label[contains(text(),'Music')]")
    return None
