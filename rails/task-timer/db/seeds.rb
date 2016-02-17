# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Delete all users

number_of_users = 2
number_of_projects = 2
number_of_tasks = 4
number_of_comments = 4

User.delete_all
# Create new users
User.create(
  username: 'username',
  name: 'User',
  password: '12345678',
  email: 'a@a.com'
)
User.create(
  username: 'username2',
  name: 'User2',
  password: '12345678',
  email: 'b@a.com'
)

Project.create(
  name: 'Projeto 1',
  description: ' Descrição do projeto 1',
  user_id: User.first!
)
Project.create(
  name: 'Projeto 2',
  description: ' Descrição do projeto 2',
  user_id: User.second!
)

Task.create(
  name: 'Tarefa 1',
  project_id: Project.first!
)
Task.create(
  name: 'Tarefa 2',
  project_id: Project.first!
)
Task.create(
  name: 'Tarefa 3',
  project_id: Project.second!
)
Task.create(
  name: 'Tarefa 4',
  project_id: Project.second!
)

Comment.create(
  author: 'Autor 1',
  body: 'Comentario 1',
  task_id: Task.first!
)
Comment.create(
  author: 'Autor 2',
  body: 'Comentario 2',
  task_id: Task.first!
)
Comment.create(
  author: 'Autor 1',
  body: 'Comentario 3',
  task_id: Task.second!
)
Comment.create(
  author: 'Autor 1',
  body: 'Comentario 4',
  task_id: Task.second!
)
