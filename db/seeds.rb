# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

category_db = Category.create(title: "Базы данных")
category_g = Category.create(title: "Git")
category_ror = Category.create(title: "Ruby on Rails")
category_os = Category.create(title: "OS")

user1 = User.create(password: '12345', mail: 'ivan@google.com')
user2 = User.create(password: 'qwerty', mail: 'petr@mail.ru',)
admin = User.create(password: 'pU7pol6s', mail: '11albina19@gmail.com')

test1 = Test.create(title: "Тест на основы баз данных", level: 1, category_id: category_db.id, author_id: admin.id)
test2 = Test.create(title: "Тест на оптимизацию запросов", level: 3, category_id: category_db.id, author_id: admin.id)
test3 = Test.create(title: "Тест на знание linux", level: 2, category_id: category_os.id, author_id: admin.id)
test4 = Test.create(title: "Тест на основы git", level: 1, category_id: category_g.id, author_id: admin.id)
test5 = Test.create(title: "Тест на знание миграций в Rails", level: 2, category_id: category_ror.id, author_id: admin.id)

question1 = Question.create(body: 'Понятие функций и триггеров', test_id: test1.id)
question2 = Question.create(body: 'В чем заключается третья нормальная форма?', test_id: test1.id)
question3 = Question.create(body: 'Чем жесткая ссылка отличается от символической?', test_id: test3.id)
question4 = Question.create(body: 'Что такое ветка?', test_id: test4.id)
question5 = Question.create(body: 'Что такое миграция?', test_id: test5.id)

answers_data = [
  { body: 'Небольшой боковой отросток, побег дерева, кустарника или травянистого растения', correct: false, question_id: question4.id },
  { body: 'Отдельная линия в системе дорог, отклоняющаяся в сторону от основного пути.', correct: false, question_id: question4.id },
  { body: 'Набор коммитов, расположенных в хронологическом порядке', correct: true, question_id: question4.id },
  { body: 'Миграции - механизм ActiveRecord, который позволяет вносить изменения в структуру базы данных: создавать и удалять таблицы, переименовывать, добавлять и удалять поля.', correct: true, question_id: question5.id },
  { body: 'Миграции -  это способ упростить большие контроллеры или модели для лучшего понимания и управления.', correct: false, question_id: question5.id },
  { body: 'Миграции - это переработка кода, процесс изменения внутренней структуры программы, в ходе которой происходит перенос кода из одних классов в другие', correct: false, question_id: question5.id },
]

answers_data.each do |answer_data|
  Answer.create(answer_data)
end

Result.create(user_id: admin.id, test_id: test1.id)
Result.create(user_id: user1.id, test_id: test2.id)
Result.create(user_id: user1.id, test_id: test4.id)