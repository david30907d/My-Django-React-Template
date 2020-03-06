# Create your views here.
from typing import Dict

from django.http import JsonResponse
from django.shortcuts import render


def health_check(request) -> JsonResponse:
    return JsonResponse({"status": "success"}, safe=False)
