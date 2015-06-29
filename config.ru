require 'rubygems'
require 'sinatra'
require 'json'

configure do
    set :api_key_mandrill => 'rhtggZx0VOn6V83NQzQjdA',
        :email_mandrill => 'connect@exsete.com',
    :tag_mandrill => 'connect-exsete',
        :subject_message_mandrill => "Exsete contact us form"
    end
require './application'
run Sinatra::Application
