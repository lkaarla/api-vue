import axios from 'axios'; 

export const WebApp ={
	Cadastrar:function(nome,email,senha){
		let dados={
			nome:nome,
			email:email,
			senha:senha
		};
	return  axios.post('/usuario/cadastrar',dados).then(response => (this.info = response));
	},
}