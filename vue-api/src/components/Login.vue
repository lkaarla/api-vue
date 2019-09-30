<template>
  <div class="login">
    <v-card div="loginform">
      <v-toolbar flat color="white">
        <v-toolbar-title>
          LOGIN
        </v-toolbar-title>
      </v-toolbar>
      <v-divider></v-divider>
      <v-card-text class>
        <v-container>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-layout >
              <v-flex>
                <v-text-field  label="E-mail" required/>
                <v-text-field  label="Senha" type="password" required></v-text-field>
              </v-flex>
            </v-layout>
            <v-layout>
                <router-link to="/cadastrar" tag="v-btn">
                  <v-btn  class="mr-4"  color="warning">Cadastrar</v-btn>
                </router-link>
                <div class="form-btn">
                  <v-btn  class="mr-4" @click="clear">Limpar</v-btn>
                  <router-link to="/home" tag="v-btn">
                    <v-btn  class="mr-4" color="success">Login</v-btn>
                  </router-link>
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
    data: () => ({
      name:'Login',
      valid: true,
      email: '',
      senha: ''
    }),
    components:{
    },
    methods: {
      clear () {
        this.$refs.form.reset();
      },
      submit: async function () {
        if(!this.email){
          alert("Campo email obrigatório!");
        }else if(!this.validEmail(this.email)){
          alert("Formatação de email incorreta!");
        }else if(!this.senha){
          alert("Campo senha obrigatório!");
        }else{
          const response=await WebApp.Login(this.email,this.senha);
        }
      },
      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      }
    },
  }
</script>

<style>
  .form-btn {
    float:right;
  }
  .login {
    width: 100%;
    height: 100%;
    background-image: linear-gradient(152deg, #AFEEEE, #D3D3D3, #AFEEEE);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }
  .loginform{
    display: flex;
  }
</style>
