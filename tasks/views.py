from django.shortcuts import render, redirect
from .models import Task


def home(request):
    if request.method == "POST":
        title = request.POST.get("title")

        if title:
            Task.objects.create(title=title)

        return redirect("home")

    tasks = Task.objects.all()
    return render(
        request,
        "home.html",
        {"tasks": tasks}
    )


def complete_task(request, id):
    task = Task.objects.get(id=id)
    task.completed = not task.completed
    task.save()
    return redirect("home")


def delete_task(request, id):
    task = Task.objects.get(id=id)
    task.delete()
    return redirect("home")


def edit_task(request, id):
    task = Task.objects.get(id=id)

    if request.method == "POST":
        new_title = request.POST.get("title")

        if new_title:
            task.title = new_title
            task.save()

        return redirect("home")

    return render(request, "edit.html", {"task": task})
