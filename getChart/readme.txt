﻿Точки, для которых нет данных, исключены из выдачи.

rndData.lua 
Тестовые данные, принцип генерации: обход всех секунд 2033 года (от 1672531200  по 704067199), с вероятностью 1/1000 секунда попадала в выборку.
RND_DATA - отсортированный двумерный массив [time, value]
функция getData возвращает массив RND_DATA в виде хеш-таблицы, где ключ - time, значение - value

getChartTest.lua
юнит-тесты, используется библиотека https://github.com/bluebird75/luaunit
Тесты проверяют граничные случаи: ни одна точка не входит в выборку, в выборку входят все точки (год) с окном в день/год;
работу функции при некорректном (отрицательном) времени, некорректном (нулевом) временном окне;
случайные выборки времени (точки одного часа группируются с окном по полчаса/секунде)
