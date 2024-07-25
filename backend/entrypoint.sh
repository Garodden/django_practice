#!/bin/sh

# 장고 프로젝트 디렉토리가 있는지 확인, 없으면 생성
if [ ! -d "/app/chatproject" ]; then
    django-admin startproject chatproject /app/
fi

# 있으면 장고 프로젝트 디렉토리로
cd /app

# Run migrations and start the server
python manage.py migrate
gunicorn chatproject.wsgi:application --bind 0.0.0.0:8000