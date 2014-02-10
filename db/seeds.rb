# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Layout.create(name: 'home', priority: 99)
Layout.create(name: 'single', priority: 1)
Layout.create(name: 'single_with_menu', priority: 2)
Layout.create(name: 'sidebar', priority: 3)
Layout.create(name: 'sidebar_with_menu', priority: 4)
Page.create(name: 'Home', title: "Welcome", sidebar: "Edit me", layout_id: 1 )
