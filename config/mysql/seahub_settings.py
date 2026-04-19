DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'seahub',
        'USER': 'seahub',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '3306',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            'charset': 'utf8mb4',
        }
    },
    'ccnet': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'ccnet',
        'USER': 'seafile',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '3306',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            'charset': 'utf8mb4',
        }
    },
    'seafile': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'seafile',
        'USER': 'seafile',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '3306',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            'charset': 'utf8mb4',
        }
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': 'redis://:password@valkey:6379/1',
    }
}

FILE_SERVER_ROOT = 'http://localhost:8082'
INNER_FILE_SERVER_ROOT = 'http://fileserver:8082'

SERVICE_URL = 'http://localhost:8000'
INNER_SERVICE_URL = 'http://seahub:8000'

ONLYOFFICE_ROOT = "http://localhost:8080"
INNER_ONLYOFFICE_ROOT = "http://office"

ENABLE_ONLYOFFICE = True
VERIFY_ONLYOFFICE_CERTIFICATE = False
ONLYOFFICE_APIJS_URL = 'http://localhost:8080/web-apps/apps/api/documents/api.js'
ONLYOFFICE_CONVERTER_URL = 'http://office/ConvertService.ashx'
ONLYOFFICE_FILE_EXTENSION = ('doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx', 'odt', 'fodt', 'odp', 'fodp', 'ods', 'fods')
ONLYOFFICE_EDIT_FILE_EXTENSION = ('docx', 'pptx', 'xlsx')

ONLYOFFICE_FORCE_SAVE = True
ONLYOFFICE_JWT_SECRET = '52d3d4f142b34b5dbec60ab59264e5cc'
