<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" persistent width="1024">
            <v-card>
                <v-toolbar
                color="primary"
                title="KARYAWAN"
                >KARYAWAN</v-toolbar>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12" sm="6" md="6">
                                <v-text-field label="Kode Karyawan" v-model="employeeCode" placeholder="Kode"></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                                <v-select :items="positions" label="Posisi Karyawan" item-text="position_name" item-value="position_id" v-model="employeePositionId"></v-select>
                            </v-col>
                            <v-col cols="12" sm="12" md="12">
                                <v-text-field label="Nama Lengkap*" v-model="employeeName" required></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                                <ddate01 label="Tanggal Lahir" v-model="employeeDOB"></ddate01>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                                <ddate02 label="Tanggal Gabung" value="employeeJoinDate"></ddate02>
                            </v-col>
                            <v-col cols="6" sm="6" md="6">
                                <v-textarea label="Alamat Karyawan" v-model="employeeAddress"></v-textarea>
                            </v-col>
                            <v-col cols="6" sm="6" md="6">
                                <v-select placeholder="Provinsi" :items="provinces" item-text="province_name" item-value="province_id" v-model="selectedProvince" return-object></v-select>
                                <v-select placeholder="Kota" :items="cities" item-text="city_name" item-value="city_id" v-model="selectedCity" return-object></v-select>
                            </v-col>
                        </v-row>
                    </v-container>
                    <!-- <small>*indicates required field</small> -->
                </v-card-text>
                <v-card-actions>
                    <v-btn color="" variant="text" @click="dialog = false">
                        Close
                    </v-btn>
                    <v-spacer></v-spacer>
                    <v-btn prepend-icon="mdi-save" color="primary" variant="text" @click="dialog = false">
                        Simpan
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>
<script>
module.exports = {
    components : {        
        ddate01: httpVueLoader("../_common/date_dialog_01.vue"),
        ddate02: httpVueLoader("../_common/date_dialog_02.vue"),
    },

    data: function() {
        return {
          notifications: false,
          sound: true,
          widgets: false,
        }
    },

    computed : {
        __s () { return this.$store.state.masterEmployee },
        dialog : {
            get () { return this.__s.dialog },
            set (v) { this.__c("dialog", v) }
        },
        positions () {
            return this.$store.state.masterPosition.positions
        },
<<<<<<< HEAD
        selectedPosition : {
            get () { return this.__s.selectedPosition },
            set (v) { this.__c("selectedPosition", v) }
        }
=======
        provinces () {
            return this.$store.state.misc.provinces
        },
        selectedPosition : {
            get () { return this.__s.selectedPosition },
            set (v) { this.__c("selectedPosition", v) }
        },
        
        employeeCode : {
            get () { return this.__s.employeeCode },
            set (v) { this.__c("employeeCode", v) }
        },
        employeeName : {
            get () { return this.__s.employeeName },
            set (v) { this.__c("employeeName", v) }
        },
        employeePositionId : {
            get () { return this.__s.employeePositionId },
            set (v) { this.__c("employeePositionId", v) }
        },
        employeeDOB : {
            get() { return this.$store.state.xdate.date01 },
            set (v) { this.$store.commit("xdate/SET_OBJECT", ["date01", v]) }
        },
        employeeAddress : {
            get () { return this.__s.employeeAddress },
            set (v) { this.__c("employeeAddress", v) }
        },
        employeeCityId : {
            get () { return this.__s.employeeCityId },
            set (v) { this.__c("employeeCityId", v) }
        },
        employeeContactId : {
            get () { return this.__s.employeeContactId },
            set (v) { this.__c("employeeContactId", v) }
        },
        employeeJoinDate : {
            get() { return this.$store.state.xdate.date02 },
            set (v) { this.$store.commit("xdate/SET_OBJECT", ["date02", v]) }
        },
        employeeNote : {
            get () { return this.__s.employeeNote },
            set (v) { this.__c("employeeNote", v) }
        },

        selectedCity : {
            get () { return this._s.selectedCity },
            set (v) { this.__c("selectedCity", v)}
        },
>>>>>>> 818472a41419d0d5f65e71b9211844207ae376f8
    },
    methods: {
        __c (a,b) { return this.$store.commit("masterEmployee/SET_OBJECT", [a, b]) },
        __d (a) { return this.$store.dispatch("masterEmployee/"+a) },
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