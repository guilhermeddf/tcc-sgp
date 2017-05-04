local = Local.create! name: 'nome', country: 'país', state: 'estado', city: 'cidade'
User.create! local: local, name: 'Josafa', email: 'email@email.com', password: '123456', password_confirmation: '123456', approved: true, admin: true
User.create! local: local, name: 'Josafa', email: 'usuario@email.com', password: '123456', password_confirmation: '123456', approved: true


Project.create local: local, name: 'Padrão', size: 0, start_date: "1970-12-08", end_date: '1970-12-08'
