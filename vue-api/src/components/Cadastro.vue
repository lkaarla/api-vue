<template>
  <div class="cadastro">
    <v-card div="cadastroform">
      <v-toolbar flat color="white">
        <v-toolbar-title>
          CADASTRAR
        </v-toolbar-title>
      </v-toolbar>
      <v-divider></v-divider>
      <v-card-text class>
        <v-container>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-layout >
              <v-flex>
                 <v-text-field v-model="nome"  label="Nome" required/>
                <v-text-field v-model="email"   label="E-mail" required/>
                <v-text-field v-model="senha" type="password"  label="Senha" required/>
              </v-flex>
            </v-layout>
            <v-layout>
                 <div class="form-btn">
                  <v-btn  class="mr-4" @click="clear">Limpar</v-btn>
                  <router-link to="/" tag="v-btn">
                    <v-btn  class="mr-4" color="error" @click="">Cancelar</v-btn>
                  </router-link>
                  <v-btn  class="mr-4" @click="submit" color="success">Salvar</v-btn>
                </div>
            </v-layout>
          </v-form>
        </v-container>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
  import { WebApp } from '@/Api.js';

  export default {
      //valid: true,
    data: () => ({
      nome: '',
      email: '',
      senha: '',
      erro: '',
    }),
    methods: {
      clear () {
        this.$refs.form.reset();
      },
      submit: async function () {
        if(!this.email){
          alert("Campo email obrigatório!");
        }else if(!this.validEmail(this.email)){
          alert("Formatação de email incorreta!");
        }else if(!this.nome){
          alert("Campo nome obrigatório!");
        }else if(!this.senha){
          alert("Campo senha obrigatório!");
        }else{
          const response=await WebApp.Cadastrar(this.nome,this.email,this.senha);
        }
      },
      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      }
    }
  }
</script>

<style>
.form-btn {
  float:right;
}
.form-btn {
  float:right;
}
.cadastro {
  width: 100%;
  height: 100%;
  background-image: linear-gradient(152deg, #AFEEEE, #D3D3D3, #AFEEEE);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.cadastroform{
  display: flex;
}
</style>
