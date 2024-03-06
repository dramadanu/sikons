<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="py-2">
                    <v-row>
                        <v-col cols="9"><h5 class="font-weight-bold text-h5 text-typo mb-0">DATA VENDOR</h5></v-col>
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
                            <td>
                                {{ item.vendor_number }}
                            </td>
                            <td>{{ item.vendor_name }}</td>
                            <td>{{ item.vendor_address }}</td>
                            <td class="text-center">
                                <v-btn color="" class="btn-icon" depressed @click="edit(item)">
                                    <v-icon>mdi-pencil</v-icon>
                                </v-btn>
                                <v-btn color="red red-lighten-5--text" class="btn-icon" depressed @click="del(item)">
                                    <v-icon>mdi-delete</v-icon>
                                </v-btn>
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
</template>

<script>
const t = "?t="+Math.random()
module.exports = {
    components : {
        searchbar: httpVueLoader("../_common/search_bar.vue"+t),
        ddelete: httpVueLoader("../_common/delete_dialog.vue"+t)
    },

    data: function() {
        return {
            
            
        }
    },

    computed : {
        __s () { return this.$store.state.masterVendor },
        headers () {
            let h = [
                ['NUMBER', 'vendor_number'],
                ['NAMA', 'vendor_name'],
                ['ALAMAT', 'vendor_address'],
                ['TODO', null, '10%','center']
            ]
            let hdrs = []
            for (let x of h) {
                hdrs.push({text: x[0], align: x[3]?x[3]:'start', sortable: false, value: x[1]?x[1]:'', 
                class: 'info lighten-2 white--text subtitle-1', width: x[2]?x[2]:0})
            }
            
            return hdrs
        },

        vendors () {
            return this.__s.vendors
        },

        total () {
            return this.__s.totalPos
        },

        totalPage () {
            return this.__s.totalPosPage
        },

        curPage : {
            get () { return this.__s.curPage },
            set (v) { this.__c("curPage", v) }
        }
    },

    methods : {
        __c (a,b) { return this.$store.commit("masterVendor/SET_OBJECT", [a, b]) },

        search () {
            this.$store.dispatch("masterVendor/search")
        },

        query (v) {
            this.__c("search", v)
            this.search()
        },

        add () {
            this.__c("vendoreName", "")
            this.__c("vendorNumber")
            this.__c("posId", 0)
            this.__c("edit", false)
            this.__c("dialog", true)
        },
        edit (x) {
            this.__c("selectedVendor", x)
            this.__c("vendoreName", x.vendore_name)
            this.__c("vendorNumber", x.vendore_number)
            this.__c("vendorePositionId", x.vendore_positionid)
            this.__c("vendoreDOB", x.vendore_dob)
            this.__c("vendoreAddress", x.vendore_address)
            this.__c("vendoreCityId", x.vendore_cityid)
            this.__c("vendoreContactId", x.vendore_contactid)
            this.__c("vendoreJoinDate", x.vendore_joindate)
            this.__c("vendoreNote", x.vendore_note)
            this.__c("posId", x.vendore_id)
            this.__c("edit", true)
            this.__c("dialog", true)
        },

        del (x) {
            this.__c("selectedVendor", x)
            this.$store.commit("misc/SET_OBJECT", ["dialogDelete", true])
        },

        doDel () {
            this.$store.dispatch("masterVendor/delete").then((d) => {
                this.$store.commit("misc/SET_OBJECT", ["dialogDelete", false])
                this.search()
            })
        }
    },

    mounted () {
        this.$store.dispatch("masterVendor/search")
    }
}
</script>