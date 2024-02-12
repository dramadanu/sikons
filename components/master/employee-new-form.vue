<template>
    <v-row justify="center">
        <v-col cols="12">
            <v-card>

                <v-toolbar dark color="bg-success">
                    <v-btn icon dark @click="dialog = false">
                        <v-icon>mdi-arrow-left</v-icon>
                    </v-btn>
                    <v-toolbar-title>{{ !edit ? 'INPUT' : 'UBAH' }} DATA KARYAWAN</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-toolbar-items class="py-1">
                        <v-btn dark class="green" depressed @click="save">
                            Simpan
                        </v-btn>
                    </v-toolbar-items>
                </v-toolbar>

                <v-row>
                    <v-col cols="12" md="6" lg="4" class="pa-5">
                        <v-text-field label="Kode Karyawan" v-model="employeeCode" placeholder="Kode"></v-text-field>

                        <v-select :items="positions" label="Posisi Karyawan" item-text="position_name"
                            item-value="position_id" v-model="employeePositionId"></v-select>

                        <v-text-field label="Nama Karyawan" v-model="employeeName" placeholder="Nama"></v-text-field>

                        <ddate01 label="Tanggal lahir" v-model="employeeDOB"></ddate01>

                        <v-textarea label="Alamat Karyawan" v-model="employeeAddress"></v-textarea>

                        <v-select v-model="employeeProvinceId" label="Propinsi" :items="provinces" item-value="province_id"
                            item-text="province_name"></v-select>

                        <v-select v-model="employeeCityId" label="Kota karyawan" :items="cities" item-value="city_id"
                            item-text="city_name"></v-select>

                        <v-select v-model="employeeContactId" label="Kontak" :items="contacts" item-value="contact_id"
                            item-text="contact_name"></v-select>

                        <ddate02 label="Tanggal Gabung" value="employeeJoinDate"></ddate02>

                        <v-textarea label="Catatan Karyawan" v-model="employeeNote"></v-textarea>

                    </v-col>
                </v-row>
            </v-card>
        </v-col>
    </v-row>
</template>

<script>
module.exports = {
    components: {
        ddate01: httpVueLoader("../_common/date_dialog_01.vue"),
        ddate02: httpVueLoader("../_common/date_dialog_02.vue"),

    },

    data: function () {
        return {
            notifications: false,
            sound: true,
            widgets: false,
        }
    },

    computed: {
        __s() { return this.$store.state.masterEmployee },

        edit() {
            return this.__s.edit
        },

        dialog: {
            get() { return this.__s.dialog },
            set(v) { this.__c("dialog", v) }
        },

        employeeName: {
            get() { return this.__s.employeeName },
            set(v) { this.__c("employeeName", v) }
        },
        employeeCode: {
            get() { return this.__s.employeeCode },
            set(v) { this.__c("employeeCode", v) }
        },
        employeePositionId: {
            get() { return this.__s.employeePositionId },
            set(v) { this.__c("employeePositionId", v) }
        },
        employeeDOB: {
            get() { return this.$store.state.xdate.date01 },
            set(v) { this.$store.commit("xdate/SET_OBJECT", ["date01", v]) }
        },
        employeeAddress: {
            get() { return this.__s.employeeAddress },
            set(v) { this.__c("employeeAddress", v) }
        },
        
        employeeProvinceId: {
            get() { return this.__s.employeeProvinceId },
            set(v) { 
                this.__c("employeeProvinceId", v) 
                this.$store.commit("misc/SET_OBJECT", ["selectedProvince", v])

                this.$store.dispatch("misc/searchCity")
            }
        },

        employeeCityId: {
            get() { return this.__s.employeeCityId },
            set(v) { this.__c("employeeCityId", v) }
        },
        employeeContactId: {
            get() { return this.__s.employeeContactId },
            set(v) { this.__c("employeeContactId", v) }
        },
        employeeJoinDate: {
            get() { return this.$store.state.xdate.date02 },
            set(v) { this.$store.commit("xdate/SET_OBJECT", ["date02", v]) }
        },
        employeeNote: {
            get() { return this.__s.employeeNote },
            set(v) { this.__c("employeeNote", v) }
        },

        selectedCity: {
            get() { return this._s.selectedCity },
            set(v) { this.__c("selectedCity", v) }
        },

        positions() {
            return this.$store.state.masterPosition.positions
        },

        selectedPosition: {
            get() { return this.__s.selectedPosition },
            set(v) { this.__c("selectedPosition", v) }
        },

        provinces() {
            return this.$store.state.misc.provinces
        },

        cities() {
            return this.$store.state.misc.cities
        },


        contacts() {
            return this.__s.contacts
        },
    },

    methods: {
        __c(a, b) { return this.$store.commit("masterEmployee/SET_OBJECT", [a, b]) },
        __d(a) { return this.$store.dispatch("masterEmployee/" + a) },

        save() {
            this.__d("save").then((x) => {
                this.__c("dialog", false)
                this.__d("search")
            })
        }
    },

    mounted() {
        this.$store.dispatch("misc/searchProvince").then((d) => {
            for (let p of d.records) {
                if (p.province_default == 'Y') {
                    this.__c("employeeProvinceId", p.province_id)
                    this.$store.commit("misc/SET_OBJECT", ["selectedProvince", p.province_id])
                }
            }

            this.$store.dispatch("misc/searchCity")
        })

        this.__d('contact')
    }
}
</script>