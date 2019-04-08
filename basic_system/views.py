import json
from django.shortcuts import render
from django.utils.safestring import mark_safe


def index(request):
    return render(request, 'basic_system/index.html', {})


def room(request, room_name):
    return render(request, 'basic_system/room.html', {
        'room_name_json': mark_safe(json.dumps(room_name))
    })
