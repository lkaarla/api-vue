Rails.application.routes.draw do
	post '/usuario/cadastrar', to: 'usuario#cadastrar'
	get '/usuario/login', to: 'usuario#login'
end
