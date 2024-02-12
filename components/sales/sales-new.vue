<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="bg-info white--text py-2">
                    <v-row>
                        <v-col cols="12">
                            <h3 class="display-1">SALES</h3>
                        </v-col>
                    </v-row>
                    <v-btn color="green" class="white--text">SIMPAN</v-btn>
                </v-card-title>
            </v-card>

            <template>
                <v-row align-center>
                    <v-col cols="12" lg="6">
                        <!-- Form bagian kiri -->
                        <v-card-text>
                            <v-row>
                            <v-col cols="12" md="4">
                            <v-text-field label="No" v-model="salesNumber"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="8">
                            <v-select label="Sales" :items="salesList" v-model="salesList"></v-select>
                            </v-col>
                            </v-row>

                            <v-select label="Customer" :items="customers" v-model="salesCustomer"></v-select>
                            
                            <v-text-field label="Alamat" v-model="salesAddress"></v-text-field>

                            <v-text-field label="Durasi" suffix="Bulan" v-model="salesDuration"></v-text-field>

                            <v-textarea label="Catatan" outlined v-model="salesNote"></v-textarea>

                        </v-card-text>
                    </v-col>
                    <v-col cols="12" lg="6">
                        <!-- Form bagian kanan -->
                        <v-card-text>
                            <v-row>
                                <v-col cols="12" md="6">
                                    <v-text-field label="Nama PIC" v-model="salesPIC"></v-text-field>
                                </v-col>
                                <v-col cols="12" md="6">
                                    <v-text-field label="No. HP" prefix="+62" v-model="salesHP"></v-text-field>
                                </v-col>
                            </v-row>
                            <v-text-field label="Alamat Project" v-model="salesProjectAddress"></v-text-field>
                            <v-row>
                                <v-col cols="12" md="6">
                                    <v-select label="Propinsi" :items="provinces" 
                                        v-model="salesProjectProvince"
                                        item-text="province_name"
                                        item-value="province_id"
                                        return-object></v-select>
                                </v-col>
                                <v-col cols="12" md="6">
                                    <v-select label="Kota" :items="cities" v-model="salesProjectCity"></v-select>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols="12" md="6">
                                    <v-select label="Kecamatan" :items="districts" v-model="salesProjectDistricts"></v-select>
                                </v-col>
                                <v-col cols="12" md="6">
                                    <v-select label="Kelurahan" :items="villages" v-model="salesProjectSubdistricts"></v-select>
                                </v-col>
                            </v-row>

                            <v-text-field label="Link Gmaps" v-model="salesMap"></v-text-field>
                                    <iframe width="100%" height="450" style="border:1" loading="lazy" allowfullscreen
                                        referrerpolicy="no-referrer-when-downgrade"
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126715.79661807901!2d110.33466325971628!3d-7.024722607692725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e708b4d3f0d024d%3A0x1e0432b9da5cb9f2!2sKota%20Semarang%2C%20Jawa%20Tengah!5e0!3m2!1sid!2sid!4v1706336255849!5m2!1sid!2sid">
                                    </iframe>

                        </v-card-text>
                    </v-col>
                </v-row>
            </template>

        </v-col>
    </v-row>
</template>


<script>
module.exports = {
    name: 'SalesForm',
    components : {

    },
    data: function () {
        return {
            mapUrl: `https://www.google.com/maps/embed/v1/place?key=YOUR_API_KEY&q=Space+Needle,Seattle+WA`,
        };
    },

    computed:{
        provinces () {
            return this.$store.state.misc.provinces
        },

        salesNumber : {
            get () { return this.$store.state.sales.salesNumber },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesNumber", v]) }
        },
            salesList : {
            get () { return this.$store.state.sales.salesList },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesList", v]) }
        },
            salesCustomer : {
            get () { return this.$store.state.sales.salesCustomer },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesCustomer", v]) }
        },
            salesAddress : {
            get () { return this.$store.state.sales.salesAddress },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesAddress", v]) }
        },
            salesDuration : {
            get () { return this.$store.state.sales.salesDuration },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesDuration", v]) }
        },
            salesNote : {
            get () { return this.$store.state.sales.salesNote },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesNote", v]) }
        },
            salesPIC : {
            get () { return this.$store.state.sales.salesPIC },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesPIC", v]) }
        },
            salesHP : {
            get () { return this.$store.state.sales.salesHP },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesHP", v]) }
        },
            salesProjectAddress : {
            get () { return this.$store.state.sales.salesProjectAddress },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesProjectAddress", v]) }
        },

        salesProjectProvince : {
            get () { return this.$store.state.sales.salesProjectProvince },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesProjectProvince", v]) }
        },

            salesProjectCity : {
            get () { return this.$store.state.sales.salesProjectCity },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesProjectCity", v]) }
        },
            salesProjectDistricts : {
            get () { return this.$store.state.sales.salesProjectDistricts },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesProjectDistricts", v]) }
        },
            salesProjectSubdistricts : {
            get () { return this.$store.state.sales.salesProjectSubdistricts },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesProjectSubdistricts", v]) }
        },
            salesMap : {
            get () { return this.$store.state.sales.salesMap },
            set (v) { this.$store.commit("sales/SET_OBJECT", ["salesMap", v]) }
        },
    },

    methods : {

    },


};
</script>
