<template>
    <v-row justify="center">
        <v-col cols="12">
            <v-card class="rounded-3">
                <v-card-title class="px-5">
                  {{ !edit?'INPUT':'UBAH' }} DATA EXPENSE
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
                    
                        <v-text-field label="Kode Barang" v-model="expenseId"></v-text-field>

                        <v-text-field label="Nama Barang" v-model="expenseCode"></v-text-field>

                        <v-select
                            label="Kategori" v-model="itemCategory" placeholder="Kategori"
                            item-text="category_name"
                            item-value="category_id"
                            return-object
                        ></v-select>

                        <v-select
                            label="Satuan" v-model="itemUnit" placeholder="Satuan"
                            item-text="unit_name"
                            item-value="unit_id"
                            return-object
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
      __s () { return this.$store.state.masterPosition },

      edit () {
        return this.__s.edit
      },

      dialog : {
          get () { return this.__s.dialog },
          set (v) { this.__c("dialog", v) }
      },

      expenseId : {
        get () { return this.__s.expenseId },
        set (v) { this.__c("expenseId", v) }
      },

      expenseCode : {
        get () { return this.__s.expenseCode },
        set (v) { this.__c("expenseCode", v) }
      },

      positionName : {
        get () { return this.__s.positionName },
        set (v) { this.__c("positionName", v) }
      },

      expenseCategoryId : {
        get () { return this.__s.expenseCategoryId },
        set (v) { this.__c("expenseCategoryId", v) }
      }

    },

    methods : {
      __c (a,b) { return this.$store.commit("masterPosition/SET_OBJECT", [a, b]) },
      __d (a) { return this.$store.dispatch("masterPosition/"+a) },

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