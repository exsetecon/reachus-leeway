require 'rubygems'
require 'sinatra'
require 'json'

configure do
    set :api_key_mandrill => 'r1Q86cJ95LCrfGebCOvwkA',
        :email_mandrill => 'connect@exsete.com',
        :tag_mandrill => 'contact-us',
        :subject_message_mandrill => "Leeway contact us form"
    end
require './application'
run Sinatra::Application
