---
layout: post
title: "СКТ. Лабораторные работы"
---

# Лабораторная работа №1

Работа посвящена веб-технологии.
При решении задачи студент осваивает работу с:
+ распределенной системой контроля версий Git;
+ сервисом GitHub и GitHub Pages;
+ генератором статический веб-сайтов Jekyll;
+ языком разметки текстовых документов markdown;
+ форматом сериализации данных YAML.

Результатом работы должен быть личный веб-сайт студента, размещенный на его аккаунте GitHub.
Сайт должен содержать как минимум 3 оформленные страницы, посвященных разработчику, его работе и интересам.
На страницах должны быть использованы следующие конструкции markdown:
+ текстовый список;
+ ссылки на внешние ресурсы;
+ вставка изображения;
+ программный код с подсветкой.

При сдаче лабораторной работы преподаватель попросит продемонстрировать:
+ внесение изменения на веб-сайт и его выкладка в сеть Интернет;
+ добавление нового поста;
+ разворачивание локального веб-сервера и доступ к сайту в локальной сети.

# Лабораторная работа №2

Работа посвящена технологии анализа больших данных.
При решении задачи студент осваивает работу с:
+ языком программирования Python;
+ распределенной системой контроля версий Git;
+ инструментом рисования графиков Matplotlib.

Источником данных является репозиторий Git любого большого открытого ПО.
Необходимо извлечь из истории следующие данные.
+ Общая информация о проекте
  - начало и конец разработки;
  - количество коммитов
  - количество разработчиков.
+ Таблица
  - разработчик, электронные адреса, время работы - начало и конец;
  - 10 наиболее часто изменяющихся файлов.
  - 3 ведущих разработчика.

+ График
  - количество коммитов по месяцам;
  - количество разработчиков по месяцам;


## Алгоритм решения задачи

Склонируем исследуемый нами репозиторий. Пусть это будет калькулятор Windows.
`git clone https://github.com/Microsoft/calculator.git`

На первом шаге копируем историю коммитов в файл в удобном для дальнейшего разбора формате (csv).
Это можно сделать с помощью команды `git log --pretty=format:"%an, %ae" > calculator.history`
После выполнения команды, в текущем каталоге появится файл `calculator.history`.

Следующая программа python разбирает файл и заполняет словарь -- отображение имени разработчика на список его электронных адресов и выводит результат в консоль.

```python
import csv

authorsEmail = {}

with open( "calculator.history", "rt" ) as file:
    reader = csv.reader( file )

    for row in reader:
        name = row[0]
        email = row[1]

        if name not in authorsEmail:
            authorsEmail[ name ] = []

        emailList = authorsEmail[ name ]

        if email not in emailList:
            emailList.append( email )

for name, email in authorsEmail.items():
    print name, email
```

Следующая программа вычисляет дату и время первого и последнего коммита.

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from datetime import datetime
import csv

# git log --date=local --pretty=format:"%an,%ae,%ad" > historyFileName.txt

historyFileName = "googletesting.history"

historyData = [] # Результат разбора файла в формате [name, email, date]

with open( historyFileName, "rt" ) as file:
    reader = csv.reader( file, delimiter=';' )

    for row in reader:
        name = row[0]
        email = row[1]
        date = datetime.strptime(row[2], '%a %b %d %H:%M:%S %Y')

        historyData.append( (name, email, date) )


minDate = datetime.today()
maxDate = datetime( 1900, 1, 1 )
for commit in historyData:
    date = commit[2]
    if minDate > date:
        minDate = date
    if maxDate < date:
        maxDate = date

print "Project beginning ", minDate
print "Project ending ", maxDate

```

