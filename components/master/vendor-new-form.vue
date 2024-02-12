<template>
<v-row justify="center">
    <v-dialog v-model="dialog" persistent width="1024">
        <v-card>
            <v-toolbar color="primary" title="Vendor"></v-toolbar>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" sm="6" md="6">
                            <v-text-field label="Kode Vendor" v-model="vendorNumber" placeholder="Kode"></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="6">
                            <v-text-field label="Nama*" required></v-text-field>
                        </v-col>
                        <v-col cols="6" sm="6" md="6">
                            <v-textarea label="Alamat Karyawan" v-model="vendorAddress"></v-textarea>
                        </v-col>
                        <v-col cols="6" sm="6" md="6">
                            <v-select placeholder="Provinsi" :items="provinces" item-text="province_name" item-value="province_id" v-model="selectedProvince" return-object></v-select>
                            <v-select placeholder="Kota" :items="cities" item-text="city_name" item-value="city_id" v-model="selectedCity" return-object></v-select>
                        </v-col>
                        <v-col cols="12" sm="12" md="12">
                            <v-text-field
                                variant="filled"
                                clear-icon="mdi-close-circle"
                                clearable
                                label="Kontak"
                                type="text"
                            ></v-text-field>
                        </v-col>
                    </v-row>
                </v-container>
                <small>*indicates required field</small>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue-darken-1" variant="text" @click="dialog = false">
                    Close
                </v-btn>
                <v-btn prepend-icon="mdi-save-circle" variant="text" @click="dialog = false">
                    Save
                </v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
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
        }
    },
    computed : {
        __s () { return this.$store.state.masterVendor },
        dialog : {
            get () { return this.__s.dialog },
            set (v) { this.__c("dialog", v) }
        },
        positions () {
            return this.$store.state.masterVendor.vendors
        },
        selectedVendor : {
            get () { return this.__s.selectedVendor },
            set (v) { this.__c("selectedVendor", v) }
        }
    },
    methods: {
        __c (a,b) { return this.$store.commit("masterVendor/SET_OBJECT", [a, b]) },
        __d (a) { return this.$store.dispatch("masterVendor/"+a) },
        save () {
            this.__d("save").then((x) => {
                this.__c("dialog", false)
                this.__d("search")
            })
        }
    },
    mounted() {
        
    }
}
</script>