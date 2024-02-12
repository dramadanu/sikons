<template>
  <!-- eslint-disable vue/no-v-html -->
  <!-- <div class="auth-wrapper d-flex align-center justify-center pa-4"> -->
    <v-row><v-col>
    <v-card
      class="auth-card pa-4 pt-7"
      max-width="448" flat
    >
      <v-card-item class="justify-center">
        <template #prepend>
          <div class="d-flex">
            <!-- <div v-html="logo" /> -->
          </div>
        </template>

        <v-card-title class="font-weight-semibold text-2xl text-uppercase">
          Sibambo
        </v-card-title>
      </v-card-item>

      <v-card-text class="pt-2">
        <h5 class="text-h5 font-weight-semibold mb-1">
          Welcome to SiBambo Studio 👋🏻
        </h5>
        <p class="mb-0">
          Please sign-in to your account and start the adventure
        </p>
      </v-card-text>

      <v-card-text>
        <v-form @submit.prevent="() => {}">
          <v-row>
            <!-- email -->
            <v-col cols="12">
              <v-text-field
                label="Email"
                type="email" outlined
              ></v-text-field>
            </v-col>

            <!-- password -->
            <v-col cols="12">
              <v-text-field
                label="Password"
                placeholder="············"
                :type="isPasswordVisible ? 'text' : 'password'"
                :append-inner-icon="isPasswordVisible ? 'ri-eye-off-line' : 'ri-eye-line'"
                @click:append-inner="isPasswordVisible = !isPasswordVisible" outlined
              ></v-text-field>

              <!-- remember me checkbox -->
              <div class="d-flex align-center justify-space-between flex-wrap mt-1 mb-4">
                <v-checkbox
                  label="Remember me"
                />

                <a
                  class="ms-2 mb-1"
                  href="javascript:void(0)"
                >
                  Forgot Password?
                </a>
              </div>

              <!-- login button -->
              <v-btn
                block
                type="submit" color="primary"
              >
                Login
              </v-btn>
            </v-col>

            <!-- create account -->
            <v-col
              cols="12"
              class="text-center text-base"
            >
              <span>Lupa password?</span>
            </v-col>

            <v-col
              cols="12"
              class="d-flex align-center"
            >
              <v-divider />
              <span class="mx-4">or</span>
              <v-divider />
            </v-col>

            <!-- auth providers -->
            <v-col
              cols="12"
              class="text-center"
            >
              
            </v-col>
          </v-row>
        </v-form>
      </v-card-text>
    </v-card>

    <v-img
      class="auth-footer-start-tree d-none d-md-block"
      :width="250"
    />

    <v-img
      class="auth-footer-end-tree d-none d-md-block"
      :width="350"
    />

    <!-- bg img -->
    <v-img
      class="auth-footer-mask d-none d-md-block"
    />
    </v-col></v-row>
  <!-- </div> -->
</template>


<script>
const t = "?t="+Math.random()
module.exports = {
    components : {
    },

    data: function() {
        return {
            title: 'Masterdata Posisi' ,
            isPasswordVisible: false
        }
    },

    computed : {
    }
}