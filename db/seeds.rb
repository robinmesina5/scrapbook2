# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.connection.execute("TRUNCATE relatives")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE relatives_id_seq RESTART WITH 1")

grandfather = Relative.create!({ first_name: 'Leonidas', last_name: 'Mesina', age: 78, birthday: '04/11/1926' })
grandmother = Relative.create!({ first_name: 'Teresa', last_name: 'Mesina', age: 72, birthday: '03/14/1933' })
father = Relative.create!({ first_name: 'Ramon', last_name: 'Mesina', age: 60, birthday: '08/13/1954', mother: grandmother, father: grandfather })
mother = Relative.create!({ first_name: 'Cristina', last_name: 'Mesina', age: 58, birthday: '10/27/1957' })

Relative.create!({ first_name: 'Mitch', last_name: 'Mesina', age: 64, birthday: '05/15/1951', mother: grandmother, father: grandfather })

Relative.create!({ first_name: 'Leah', last_name: 'Bantug', age: 44, birthday: '07/23/1971', mother: grandmother, father: grandfather })

Relative.create!({ first_name: 'Robin', last_name: 'Mesina', age: 31, birthday: '12/27/1983', mother: mother, father: father })

jesse = Relative.create!({ first_name: 'Jesse', last_name: 'Mesina', age: 31, birthday: '12/27/1983', mother: mother, father: father })

Relative.create!({ first_name: 'Bridget', last_name: 'Mesina', age: 27, birthday: '07/11/1987', mother: mother, father: father })

mariela = Relative.create!({ first_name: 'Mariela', last_name: 'Alvarado', age: 32, birthday: '08/06/1982' })

Relative.create!({ first_name: 'Caleb', last_name: 'Mesina', age: 4, birthday: '02/01/2011', mother: mariela, father: jesse })

Relative.create!({ first_name: 'Ava', last_name: 'Mesina', age: 2, birthday: '11/24/2012', mother: mariela, father: jesse })