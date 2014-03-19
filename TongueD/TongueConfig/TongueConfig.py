__author__ = 'pferland'
from ConfigParser import ConfigParser
import os


class TongueConfig:
    def __init__(self):
        self.Config = ConfigParser()
        self.Config.read(os.path.join("configs","config.ini")) # folder, file

    def ConfigMap(self, section):
        dict1 = {}
        options = self.Config.options(section)
        for option in options:
            if option == "ffservers":
                dict1[option] = self.Config.get(section, option).split(',')
            else:
                dict1[option] = self.Config.get(section, option)
        return dict1