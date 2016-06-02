# config.ru
require 'sinatra'
require 'json'
require 'octokit'

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

# map the controllers to routes
map('/github') { run GithubController }
map('/') { run ApplicationController }