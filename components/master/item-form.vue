<template>
    <v-row justify="center">
        <v-col cols="12">
            <v-card class="rounded-3">

                <!-- <v-toolbar
                    flat :dark="dark"
                >
                    <v-btn
                    icon
                    :dark="dark"
                    @click="dialog = false"
                    >
                      <v-icon>mdi-arrow-left</v-icon>
                    </v-btn>
                    <v-toolbar-title class="pl-2">{{ !edit?'INPUT':'UBAH' }} DATA POSISI / JABATAN</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-toolbar-items class="py-1">
                      <v-btn
                        icon
                        :dark="dark"
                        @click="dialog = false"
                        >
                        <v-icon>mdi-arrow-left</v-icon>
                      </v-btn>
                      <v-btn
                        :dark="dark"
                          class="primary rounded-3"
                          @click="save"
                      >
                          Simpan
                      </v-btn>
                    </v-toolbar-items>
                </v-toolbar> -->
                <v-card-title class="px-5">
                  {{ !edit?'INPUT':'UBAH' }} ITEM
                  <v-spacer></v-spacer>
                  <v-btn
                        icon
                        :dark="dark"
                        @click="dialog = false" class="mr-3"
                        >
                        <v-icon>mdi-arrow-left</v-icon>
                      </v-btn>
                  <v-btn
                        :dark="dark"
                          class="primary rounded-3"
                          @click="save"
                      >
                          Simpan
                      </v-btn>
                </v-card-title>
                <v-card-text>
                  <v-row>
                    <v-col cols="12" md="6" lg="4" class="pa-5">
                    
                        <v-text-field
                            label="Kode Barang" v-model="positionCode" placeholder="Kode"
                        ></v-text-field>

                        <v-text-field
                            label="Nama Barang" v-model="positionName" placeholder="Nama"
                        ></v-text-field>

                        <v-select
                            label="Kategori" placeholder="Kategori"
                        ></v-select>

                        <v-select
                            label="Satuan" placeholder="Satuan"
                        ></v-select>
                        
                    </v-col>
                  </v-row>
                </v-card-text>
            </v-card>
        </v-col>
        
    </v-row>
  </template>

<script>
module.exports = {
    components : {
    },

    data: function() {
        return {
          notifications: false,
          sound: true,
          widgets: false,
          dark: false
        }
    },

    computed : {
      __s () { return this.$store.state.masterItem },

      edit () {
        return this.__s.edit
      },

      dialog : {
          get () { return this.__s.dialog },
          set (v) { this.__c("dialog", v) }
      },

      positionCode : {
        get () { return this.__s.positionCode },
        set (v) { this.__c("positionCode", v) }
      },

      positionName : {
        get () { return this.__s.positionName },
        set (v) { this.__c("positionName", v) }
      }
    },

    methods : {
      __c (a,b) { return this.$store.commit("masterItem/SET_OBJECT", [a, b]) },
      __d (a) { return this.$store.dispatch("masterItem/"+a) },

      save () {
        this.__d("save").then((x) => {
          this.__c("dialog", false)
          this.__d("search")
        })
      }
    },

    mounted () {
    }
}
</script>