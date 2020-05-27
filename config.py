import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))


class Config(object):
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'you-will-never-guess'
    DATABASE_URI = os.environ.get('DATABASE_URL') or ''
    SQL_QUERY_DIR = os.environ.get('SQL_QUERY_DIR') or 'sql/'
