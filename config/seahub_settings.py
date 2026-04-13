DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'seahub',
        'USER': 'seahub',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '5432',
    },
    'ccnet': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'ccnet',
        'USER': 'seafile',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '5432',
    },
    'seafile': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'seafile',
        'USER': 'seafile',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '5432',
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': 'redis://:password@valkey:6379/1',
    }
}

FILE_SERVER_ROOT = 'http://localhost:8082'
INNER_FILE_SERVER_ROOT = 'http://seafile:8082'
SEAFEVENTS_SERVER_URL = 'http://seafevents:8889'
SERVICE_URL = 'http://localhost:8000'
