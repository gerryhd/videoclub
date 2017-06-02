# README

**STRICTLY FOR HOMIES: ** para entrar en admin y poder subir películas y editarlas es https://sheltered-headland-16432.herokuapp.com/admins/sign_in
                          9:14
                          y las credenciales: admin@homie.mx admin123
                          
                          
                          
                          ---------------------------

Anyone interested in testing this should first
reset the database with

` rails db:migrate:reset`

then populate the database with

` rails:db:seed`


--

All user accounts must be confirmed via email.
Check the _test.rb_ environment if you wish to
use a tool to catch emails. I suggest mailcatcher.

There is only one admin account and you cannot create
another one via the web app. The credentials for
the admin account are in _seeds.rb_



* Ruby version 2.4.1p111

* Deployment instructions: change _production.rb_
as you deem necessary



* ...
