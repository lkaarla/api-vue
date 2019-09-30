class UsuarioController < ApplicationController

  def cadastrar()
  	nome = params[:nome]
  	email = params[:email]
  	senha = params[:senha]
    mensagem = params[:mensagem]
  	email = email.upcase
  	
    redirect_to '#/cadastrar'
    verifica_email = Usuario.where("email = '#{email}'")
  	if verifica_email.blank?
		  usuario = Usuario.new
	  	usuario.nome = nome
	  	usuario.email = email
	  	usuario.senha = senha
	  	usuario.save
      mensagem = true
    else
      mensagem = false
	  end
    return mensagem
  end

  def login()
  	email = params[:email]
  	senha = params[:senha]

  	valida_login = Usuario.find(:all, :conditions=>'email = #{email} and senha = #{senha}')

  	unless valida_login.blank?
  		return true
  	else
  		return false
  	end
  end
end
