<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="bg-info white--text py-2">
                    <v-row>
                        <v-col cols="9"><h3 class="display-1">DATA KARYAWAN</h3></v-col>
                        <v-col cols="3"><searchbar @add="add" @search="search" @change="query"></searchbar></v-col>
                    </v-row>                
                </v-card-title>
                <v-card-text class="py-2 px-3">
                    <v-data-table
                        :headers="headers"
                        :items="employees"
                        :items-per-page="10"
                        class="elevation-1"
                        hide-default-footer
                    >
                    <template v-slot:item="{ item }">
                        <tr>
                            <td>
                                {{ item.employee_name }}
                            </td>
                            <td>{{ item.employee_position }}</td>
                            <td>{{ item.employee_address }}</td>
                            <td>{{ item.employee_city }}</td>
                            <td>{{ item.employee_note }}</td>
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
        
    
</template>

<script>
const t = "?t="+Math.random()
module.exports = {
    components : {
        searchbar: httpVueLoader("../_common/search_bar.vue"+t),
        ddelete: httpVueLoader("../_common/delete_dialog.vue"+t),
    },

    data: function() {
        return {
            
            
        }
    },

    computed : {
        __s () { return this.$store.state.masterEmployee },
        
        headers () {
            let h = [
                ['NAMA', 'employee_name'],
                ['POSISI', 'employee_position'],
                ['ALAMAT', 'employee_address'],
                ['WILAYAH', 'employee_city'],
                ['CATATAN', 'employee_note', 0, 'start'],
                ['TODO', null, '10%','center']
            ]
            let hdrs = []
            for (let x of h) {
                hdrs.push({text: x[0], align: x[3]?x[3]:'start', sortable: false, value: x[1]?x[1]:'', 
                class: 'info lighten-2 white--text subtitle-1', width: x[2]?x[2]:0})
            }
            
            return hdrs
        },

        employees () {
            return this.__s.employees
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
        __c (a,b) { return this.$store.commit("masterEmployee/SET_OBJECT", [a, b]) },

        search () {
            this.$store.dispatch("masterEmployee/search")
        },

        query (v) {
            this.__c("search", v)
            this.search()
        },

        add () {
            this.__c("employeeName", "")
            this.__c("employeeCode")
            this.__c("employeePositionId")
            this.__c("employeeDOB")
            this.__c("employeeAddress")
            this.__c("employeeCityId")
            this.__c("employeeContactId")
            this.__c("employeeJoinDate")
            this.__c("employeeNote")
            this.__c("posId", 0)
            this.__c("edit", false)
            this.__c("dialog", true)
        },
        edit (x) {
            this.__c("employeeName", x.employee_name)
            this.__c("employeeCode", x.employee_code)
            this.__c("employeePositionId", x.employee_positionid)
            this.$store.commit("xdate/SET_OBJECT", ["date01", x.employee_dob])
            this.__c("employeeAddress", x.employee_address)
            this.__c("employeeProvinceId", x.province_id)
            this.__c("employeeCityId", x.employee_cityid)
            this.__c("employeeContactId", x.employee_contactid)
            this.$store.commit("xdate/SET_OBJECT", ["date02", x.employee_joindate])
            this.__c("employeeNote", x.employee_note)
            this.__c("posId", x.employee_id)
            this.__c("edit", true)
            this.__c("dialog", true)

            this.$store.commit("misc/SET_OBJECT", ["selectedProvince", x.province_id])
            this.$store.dispatch("misc/searchCity").then((d) => {
                for (let c of d.records) {
                    if (c.city_id == x.employee_cityid) 
                        this.__c("employeeCityId", c.city_id)
                }
            })
        },

        del (x) {
            this.__c("selectedEmployee", x)
            this.$store.commit("misc/SET_OBJECT", ["dialogDelete", true])
        },

        doDel () {
            this.$store.dispatch("masterEmployee/delete").then((d) => {
                this.$store.commit("misc/SET_OBJECT", ["dialogDelete", false])
                this.search()
            })
        }
    },

    mounted () {
        this.$store.dispatch("masterPosition/search")
    }
}
</script>