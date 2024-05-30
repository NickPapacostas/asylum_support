# Asylum Support

A web application for tracking asylum cases built around the needs of [Khora Asylum Support Team](https://khoracollective.org/asylum-support-team). It provides basic features like creating a case with metadata about the participants, adding files, and tracking activity.


## Built with

- Ruby on Rails
- jQuery
- [AjaxDatatables](https://github.com/jbox-web/ajax-datatables-rails/)


## Running locally

Required Ruby version can be found in `.tool-versions` (and installed with [asdf](https://github.com/asdf-vm/asdf-ruby))

1. bundle install
2. rails db:create & rails db:migrate
3. rails s

## History (written 2024)

This app was initially created by volunteers from Khora. It has been running in production on Heroku for many years without issue, but the code is a bit old and there are _no tests_, which is bad.


