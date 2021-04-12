# frozen_string_literal: true

module Application
  Router = Hanami::Router.new do
    root to: Controllers::Root::Index

    get '/servers', to: Controllers::Servers::Index
    get '/raids', to: Controllers::Raids::Index
    get '/raids/:raid_id/encounters', to: Controllers::Raids::Encounters::Index

    post '/instances', to: Controllers::Instances::Create
  end
end
