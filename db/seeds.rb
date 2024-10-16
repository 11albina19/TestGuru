# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create!([
                                { title: 'Базы данных' },
                                { title: 'Git' },
                                { title: 'Ruby on Rails' },
                                { title: 'OS' }
                              ])

users = User.create!([
                       { password: 'pU7pol6s', mail: '11albina19@gmail.com' },
                       { password: '12345', mail: 'ivan@google.com' },
                       { password: 'qwerty', mail: 'petr@mail.ru' }
                     ])

tests = Test.create!([
                       { title: 'Тест на основы баз данных', level: 1, category: categories[0], author: users[2] },
                       { title: 'Тест на оптимизацию запросов', level: 3, category: categories[0], author: users[2] },
                       { title: 'Тест на знание linux', level: 2, category: categories[3], author: users[2] },
                       { title: 'Тест на основы git', level: 1, category: categories[1], author: users[2] },
                       { title: 'Тест на знание миграций в Rails', level: 2, category: categories[2], author: users[2] }
                     ])

questions = Question.create!([
                               { body: 'Понятие функций и триггеров', test: tests[0] },
                               { body: 'В чем заключается третья нормальная форма?', test: tests[0] },
                               { body: 'Чем жесткая ссылка отличается от символической?', test: tests[2] },
                               { body: 'Что такое ветка?', test: tests[3] },
                               { body: 'Что делает команда git add?', test: tests[3] },
                               { body: 'Что такое миграция?', test: tests[4] }
                             ])

answers_data = [
  { body: ' Функция в контексте баз данных представляет собой именованный блок кода, который выполняет
определенные операции над данными и возвращает результат.
Триггеры —  это специальные типы хранимых процедур или функций, которые автоматически выполняются при
определенных событиях или изменениях в базе данных. ', correct: true, question: questions[0] },
  { body: ' Функция создается для автоматической очистки данных в таблице.
Триггеры —  это специальные типы хранимых процедур или функций, которые могут вызываться только один раз
за транзакцию ', correct: false, question: questions[0] },
  { body: ' Функция вызывается автоматически при изменении данных в таблице.
Триггер — это объект базы данных, вызываемый вручную для выполнения запроса. ', correct: false, question: questions[0] },

  { body: 'Таблица должна содержать не менее трех столбцов', correct: false, question: questions[1] },
  { body: 'Таблица должна быть во второй нормальной форме. Все колонки в таблице зависят от первичного ключа
и не зависят друг от друга', correct: true, question: questions[1] },
  { body: 'В таблице запрещено использовать внешние ключи', correct: false, question: questions[1] },

  { body: 'Жесткую ссылку можно создать только на каталог, а символическую — на любой файл', correct: false, question: questions[2] },
  { body: 'Символическая ссылка быстрее, чем жесткая, так как хранит больше метаданных', correct: false, question: questions[2] },
  { body: 'Жесткая ссылка указывает на inode файла, а символическая — на его путь', correct: true, question: questions[2] },

  { body: 'Небольшой боковой отросток, побег дерева, кустарника или травянистого растения', correct: false,
    question: questions[3] },
  { body: 'Отдельная линия в системе дорог, отклоняющаяся в сторону от основного пути.', correct: false,
    question: questions[3] },
  { body: 'Набор коммитов, расположенных в хронологическом порядке', correct: true, question: questions[3] },

  { body: 'Сохраняет изменения сразу в удаленный репозиторий', correct: false,
    question: questions[4] },
  { body: 'Добавляет изменения в индекс (staging area) для последующего коммита', correct: true,
    question: questions[4] },
  { body: 'Автоматически объединяет изменения с предыдущим коммитом', correct: false,
    question: questions[4] },

  {
    body: 'Миграции - механизм ActiveRecord, который позволяет вносить изменения в структуру базы данных: создавать и удалять таблицы, переименовывать, добавлять и удалять поля.', correct: true, question: questions[5]
  },
  { body: 'Миграции -  это способ упростить большие контроллеры или модели для лучшего понимания и управления.',
    correct: false, question: questions[5] },
  {
    body: 'Миграции - это переработка кода, процесс изменения внутренней структуры программы, в ходе которой происходит перенос кода из одних классов в другие', correct: false, question: questions[5]
  }
]

Answer.create!(answers_data)
