<template>
    <v-row justify="center">
        <v-col cols="12">
            <v-card class="rounded-3">

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
                            label="No." v-model="itemCode" placeholder=""
                        ></v-text-field>

                        <v-text-field
                            label="Nama PIC" v-model="itemName" placeholder=""
                        ></v-text-field>

                        <v-text-field
                            label="No. HP" v-model="itemName" placeholder=""
                        ></v-text-field>
                        
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

    data : function() {
        return {
            title: 'Masterdata Status'
        }
    },

}
</script>