"""my_django_react_template URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic import TemplateView

from api.views import health_check
from my_django_react_template import views

urlpatterns = [
    url(r"^admin/", admin.site.urls),
    url("health", health_check),
    url("index", TemplateView.as_view(template_name="index.html")),
    url("api", TemplateView.as_view(template_name="api.html")),
    url("member", TemplateView.as_view(template_name="member.html")),
]
