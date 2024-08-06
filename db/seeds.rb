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
                               { body: 'Как переименовать локальную ветку?', test: tests[3] },
                               { body: 'Что такое миграция?', test: tests[4] }
                             ])

answers_data = [
  { body: 'Небольшой боковой отросток, побег дерева, кустарника или травянистого растения', correct: false,
    question: questions[3] },
  { body: 'Отдельная линия в системе дорог, отклоняющаяся в сторону от основного пути.', correct: false,
    question: questions[3] },
  { body: 'Набор коммитов, расположенных в хронологическом порядке', correct: true, question: questions[3] },
  {
    body: 'Миграции - механизм ActiveRecord, который позволяет вносить изменения в структуру базы данных: создавать и удалять таблицы, переименовывать, добавлять и удалять поля.', correct: true, question: questions[4]
  },
  { body: 'Миграции -  это способ упростить большие контроллеры или модели для лучшего понимания и управления.',
    correct: false, question: questions[4] },
  {
    body: 'Миграции - это переработка кода, процесс изменения внутренней структуры программы, в ходе которой происходит перенос кода из одних классов в другие', correct: false, question: questions[4]
  }
]

Answer.create!(answers_data)

result_data = [
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] },
  { user: users[1], test: tests[3] }
]

Result.create!(result_data)
