# Create your views here.
from django.shortcuts import render
from django.http import JsonResponse
from typing import Dict

def health_check(request) -> JsonResponse:
	return JsonResponse({'status': "success"}        , safe=False)
