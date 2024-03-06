<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="py-2">
                    <v-row>
                        <v-col cols="9"><h5 class="font-weight-bold text-h5 text-typo mb-0">DATA VENDOR</h5>
                            <p class="text-sm text-body font-weight-light mb-0"> Features include sorting, searching, pagination, content-editing, and row selection. </p></v-col>
                        <v-col cols="3"><searchbar @add="add" @search="search" @change="query"></searchbar></v-col>
                    </v-row>
                </v-card-title>
                <v-card-text class="py-2 px-3">
                    <v-data-table
                        :headers="headers"
                        :items="vendors"
                        :items-per-page="10"
                        class="elevation-1"
                        hide-default-footer
                    >
                    <template v-slot:item="{ item }">
                        <tr>
                            <td>{{ item.vendor_number }}</td>
                            <td>{{ item.vendor_name }}</td>
                            <td>{{ item.employee_address }}</td>
                            <td>{{ item.employee_city }}</td>
                            <td class="text-center">
                                <v-btn-toggle>
                                    <v-btn color="" class="btn-icon" depressed @click="edit(item)">
                                        <v-icon>mdi-pencil</v-icon>
                                    </v-btn>
                                    <v-btn color="red red-lighten-5--text" class="btn-icon" depressed @click="del(item)">
                                        <v-icon>mdi-delete</v-icon>
                                    </v-btn>
                                </v-btn-toggle>
                            </td>
                        </tr>
                    </template>
                    </v-data-table>        
                </v-card-text>
                <v-card-actions>
                    <v-pagination v-model="curPage" :length="totalPage" :total-visible="7"
                    ></v-pagination>
                </v-card-actions>
            </v-card>
        </v-col>

        <ddelete @todo="doDel"></ddelete>
    </v-row>
    
    <!-- <v-card>
        <v-card-title primary-title class="pt-2 pb-0">
            <v-layout row wrap>
                <v-flex xs6>
                    <h3 class="display-1 font-weight-light zalfa-text-title">DATA VENDOR</h3>
                </v-flex>
                <v-flex xs2 pr-2>
                    <v-autocomplete
                            label="Propinsi"
                            v-model="selectedProvince"
                            :items="provinces"
                            auto-select-first
                            return-object
                            clearable
                            item-text="province_name"
                            item-value="province_id"
                            placeholder="Semua Propinsi"
                            hide-details
                            solo
                            >
                            <template
                                slot="item"
                                slot-scope="{ item }"
                                >
                                <v-list-tile-content>
                                <v-list-tile-title v-text="item.province_name"></v-list-tile-title>
                                </v-list-tile-content>
                            </template>
                        </v-autocomplete>
                </v-flex>

                <v-flex xs2 pr-2>
                    <v-autocomplete
                            label="Kota"
                            v-model="selectedCity"
                            :items="cities"
                            auto-select-first
                            return-object
                            clearable
                            item-text="M_CityName"
                            item-value="M_CityID"
                            placeholder="Semua Kota"
                            :disabled="selectedProvince == null"
                            solo
                            hide-details
                            >
                            <template
                                slot="item"
                                slot-scope="{ item }"
                                >
                                <v-list-tile-content>
                                <v-list-tile-title v-text="item.M_CityName"></v-list-tile-title>
                                </v-list-tile-content>
                            </template>

                        </v-autocomplete>
                </v-flex>

                <v-flex xs2 class="text-xs-right" pl-3>
                    
                    <v-text-field
                        solo
                        hide-details
                        placeholder="Pencarian" 
                        v-model="query"
                        @keyup="do_search($event)"
                    >
                        <template v-slot:append-outer>
                            <v-btn color="primary" class="ma-0 btn-icon" @click="do_search">
                                <v-icon>search</v-icon>
                            </v-btn>      

                            <v-btn color="success" class="ma-0 ml-2 btn-icon" @click="add">
                                <v-icon>add</v-icon>
                            </v-btn>  
                        </template>
                    </v-text-field>
                </v-flex>
            </v-layout>
        </v-card-title>
        <v-card-text class="pt-2">
            <v-data-table 
                :headers="headers"
                :items="vendors"
                :loading="false"
                hide-actions
                class="elevation-1">
                <template slot="items" slot-scope="props">
                    <td class="text-xs-left pa-2" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)"><b>{{ props.item.vendor_code }}</b></td>
                    <td class="text-xs-left pa-2" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)"><b>{{ props.item.vendor_name }}</b><br>
                    <div v-show="props.item.vendor_prospect=='Y'" class="blue--text"><i>( Prospek )</i></div>
                    </td>
                    <td class="text-xs-left pa-2" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)">{{ props.item.vendor_address }}, {{ props.item.address_kelurahan }}</td>
                    <td class="text-xs-left pa-2" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)">{{ props.item.city_name }}</td>
                    <td class="text-xs-left pa-2" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)">{{ props.item.province_name }}</td>
                    <td class="text-xs-center pa-0" v-bind:class="level_color(props.item.vendor_type)" @click="select(props.item)">
                        <v-btn color="primary" class="btn-icon ma-0" small @click="edit(props.item)"><v-icon>create</v-icon></v-btn>
                        <v-btn color="red" dark class="btn-icon ma-0" small @click="del(props.item)"><v-icon>delete</v-icon></v-btn>
                    </td>
                </template>
            </v-data-table>
            <v-divider></v-divider>
            <v-pagination
                style="margin-top:10px;margin-bottom:10px"
                v-model="curr_page"
                :length="xtotal_page"
                @input="change_page"
            ></v-pagination>
        </v-card-text>
        <v-snackbar
            v-model="snackbar"
            multi-line
            :timeout="3000"
            top
            vertical
            >
            {{ snackbar_text }}
            <v-btn
                color="pink"
                flat
                @click="snackbar = false"
            >
                Tutup
            </v-btn>
        </v-snackbar>
        <common-dialog-delete :data="vendor_id" @confirm_del="confirm_del" v-if="dialog_delete"></common-dialog-delete>
    </v-card> -->
</template>

<script>
module.exports = {
    components : {
        searchbar: httpVueLoader("../_common/search_bar.vue"),
        ddelete: httpVueLoader("../_common/delete_dialog.vue"),
    },

    data () {
        return {}
    },

    computed : {
        __s () { return this.$store.state.masterVendor },
        
        headers () {
            let h = [
                ['NUMBER', 'vendor_number'],
                ['NAMA', 'vendor_name'],
                ['ALAMAT', 'vendor_address'],
                ['WILAYAH', 'vendor_city'],
                ['TODO', null, '10%','center']
            ]
            let hdrs = []
            for (let x of h) {
                hdrs.push({text: x[0], align: x[3]?x[3]:'start', sortable: false, value: x[1]?x[1]:'', 
                class: 'info lighten-2 white--text subtitle-1', width: x[2]?x[2]:0})
            }
            return hdrs
        },

        provinces () {
            return this.__s.provinces
        },

        vendors () {
            return this.__s.vendors
        },

        total () {
            return this.__s.totalVendor
        },

        totalPage () {
            return this.__s.totalVendorPage
        },

        curPage : {
            get () { return this.__s.curPage },
            set (v) { this.__c("curPage", v) }
        }
    },

    methods : {
        __c (a,b) { return this.$store.commit("masterVendor/SET_OBJECT", [a, b]) },

        // add () {
        //     this.$store.commit('vendor_new/set_common', ['edit', false])
        //     this.$store.commit('vendor_new/set_common', ['vendor_name', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_address', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_phone', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_note', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_email', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_postcode', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_pic_name', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_pic_phone', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_npwp', ''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_prospect', 'N'])
        //     this.$store.commit('vendor_new/set_phones', [])
        //     this.$store.commit('vendor_new/set_cbanks', [])
        //     this.$store.commit('address/set_addresses', [])
        //     this.$store.commit('address/set_selected_address', null)
            
        //     this.$store.commit('vendor_new/set_selected_province', null)
        //     this.$store.commit('vendor_new/set_selected_city', null)
        //     this.$store.commit('vendor_new/set_selected_district', null)
        //     this.$store.commit('vendor_new/set_selected_village', null)
        //     this.$store.commit('vendor_new/set_dialog_new', true)
        // },

        // edit (x) {
        //     this.select(x)
        //     let sc = x
        //     this.$store.commit('vendor_new/set_common', ['edit', true])
        //     this.$store.commit('vendor_new/set_common', ['vendor_name', sc.vendor_name])
        //     this.$store.commit('vendor_new/set_vendor_address', sc.vendor_address)
        //     this.$store.commit('vendor_new/set_common', ['vendor_phone', sc.vendor_phone])
        //     this.$store.commit('vendor_new/set_common', ['vendor_note', sc.vendor_note])
        //     this.$store.commit('vendor_new/set_common', ['vendor_email', sc.vendor_email])
        //     this.$store.commit('vendor_new/set_common', ['vendor_postcode', sc.vendor_postcode?sc.vendor_postcode:''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_pic_name', sc.vendor_pic_name?sc.vendor_pic_name:''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_pic_phone', sc.vendor_pic_phone?sc.vendor_pic_phone:''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_npwp', sc.vendor_npwp?sc.vendor_npwp:''])
        //     this.$store.commit('vendor_new/set_common', ['vendor_prospect', sc.vendor_prospect?sc.vendor_prospect:'N'])
        //     this.$store.commit('vendor_new/set_phones', sc.vendor_phones)
        //     this.$store.commit('vendor_new/set_cbanks', sc.banks)
        //     this.$store.commit('address/set_addresses', sc.addresses)
        //     this.$store.commit('address/set_selected_address', null)

        //     this.$store.commit('vendor_new/set_selected_province', null)
        //     this.$store.commit('vendor_new/set_selected_city', null)
        //     this.$store.commit('vendor_new/set_selected_district', null)
        //     this.$store.commit('vendor_new/set_selected_village', null)
            
        //     this.$store.dispatch('vendor_new/search_province')
        //     this.$store.commit('vendor_new/set_dialog_new', true)
        // },

        // del (x) {
        //     this.select(x)
        //     this.$store.commit('set_dialog_delete', true)
        // },

        // confirm_del (x) {
        //     this.$store.dispatch('vendor/del', {id:x.data})
        // },

        // select (x) {
        //     this.$store.commit('vendor/set_selected_vendor', x)
        // },

        // change_page(x) {
        //     this.curr_page = x
        //     this.$store.dispatch('vendor/search', {})
        // },

        // do_search(e) {
        //     if (e.which == 13)
        //         this.$store.dispatch('vendor/search', {})
        // },

        // level_color (x) {
        //     if (x == 'Y')
        //         return 'cyan lighten-4'
        //     return 'white'
        // },
        
        // report () {
        //     let params = ['province_id='+(this.selected_province?this.selected_province.M_ProvinceID:0), 
        //             'city_id='+(this.selected_city?this.selected_city.M_CityID:0),
        //             'level_id='+(this.selected_level?this.selected_level.M_VendorLevelID:0),
        //             'token='+this.$store.state.vendor.token].join('&')
        //     let urls = this.$store.state.vendor.URL+'report/one_master_001'+
        //                 '?'+params
        //     this.$store.commit('vendor/set_common', ['report_url', urls])
        //     this.$store.commit('set_dialog_print', true)
        // },

        // duration(x) {
        //     let d1 = window.moment(x)
        //     let d2 = window.moment(window.moment().format("YYYY-MM-DD"))

        //     let y = d2.diff(d1, "years")
        //     let m = d2.diff(d1, "months")
        //     let md = d2.diff(d1, "months", true)
        //     let d = d2.diff(d1, "days")
        //     if (y < 1) {
        //         if (m > 0 && d > 14)
        //             return m + ",5 bulan"
        //         else if (m > 0)
        //             return m + " bulan"
        //         else
        //             return d + " hari"
        //     } else if (y < 5 && m > 5) {
        //         return y + ",5 tahun"
        //     } else {
        //         return y + " tahun"
        //     }
        // }
    },

    mounted () {
        this.$store.dispatch('masterVendor/provinces', {})
    },

    watch : {
        selectedCity (v, o) {
            if (v != o)
                this.$store.dispatch('masterVendor/search', {})
        },

        selectedProvince (v, o) {
            if (v != o)
                if (this.$store.state.masterVendor.selectedCity != null)
                    this.$store.commit('vendor/setSelectedCity', null)
                else
                    this.$store.dispatch('masterVendor/search', {})
        }
    }
}
</script>