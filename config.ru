require 'rubygems'
require 'sinatra'
require 'json'

configure do
    set :api_key_mandrill_cnt => 'r1Q86cJ95LCrfGebCOvwkA',
    :email_mandrill_cnt => 'udbhav@exsete.com',
    :tag_mandrill_cnt => 'contact-us',
    :subject_message_mandrill_cnt => "Leeway contact us form",
    :api_key_mandrill_crs => 'o3H-HVXQRIeq8TbpwLjH0A',
    :email_mandrill_crs => 'udbhav@exsete.com',
    :tag_mandrill_crs => 'carrers-form',
    :subject_message_mandrill_crs => "Leeway Careers Resume form"
    end
require './application'
run Sinatra::Application
