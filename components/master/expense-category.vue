<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="py-2">
                    <v-row>
                        <v-col cols="9"><h5 class="font-weight-bold text-h5 text-typo mb-0">DATA EXPENSE</h5>
                            </v-col>
                        <v-col cols="3"><searchbar @add="add" @search="search" @change="query"></searchbar></v-col>
                    </v-row>                
                </v-card-title>
                <v-card-text class="py-2 px-3">
                    <v-data-table
                        :headers="headers"
                        :items="positions"
                        :items-per-page="10"
                        class="elevation-1"
                        hide-default-footer
                    >
                    <template v-slot:expense="{ expense }">                                                   
                        <tr @click="select(expense)" :class="[isSelected(expense)?'blue lighten-5':'']">
                            <td>{{ expense.expense_id }}</td>
                            <td>{{ expense.expense_code }}</td>
                            <td>{{ expense.expense_name }}</td>
                            <td class="text-center">
                                <v-btn color="primary" class="btn-icon" icon depressed @click="edit(expense)" small>
                                    <v-icon>mdi-pencil</v-icon>
                                </v-btn>
                                <v-btn color="red red-lighten-5--text" icon depressed @click="del(expense)" small>
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
            <ddelete @todo="doDel"></ddelete>
        </v-col>
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
            title: 'Masterdata Posisi' 
        }
    },

    computed : {
        __s () { return this.$store.state.masterPosition },
        THEME () { return this.$store.state.app.THEME },

        headers () {
            let h = [
                ['ID', 'expense_id'],
                ['KODE', 'expense_code'],
                ['NAMA', 'expense_name']
            ]
            let hdrs = []
            for (let x of h) {
                hdrs.push({text: x[0], align: x[3]?x[3]:'start', sortable: false, value: x[1]?x[1]:'', 
                class: 'subtitle-1', width: x[2]?x[2]:0})
            }
            
            return hdrs
        },

        expens () {
            return this.__s.expens
        },

        selectedexpens : {
            get () { return this.__s.selectedexpens },
            set (v) { this.__c("selectedexpens", v) }
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
        },
    },

    methods : {
        __c (a,b) { return this.$store.commit("masterexpense/SET_OBJECT", [a, b]) },

        search () {
            this.$store.dispatch("masterexpense/search")
        },

        query (v) {
            this.__c("search", v)
            this.search()
        },

        add () {
            this.__c("expenseCode", "")
            this.__c("expenseName")
            this.__c("expenseId", 0)
            this.__c("edit", false)
            this.__c("dialog", true)
        },

        edit (x) {
            this.select(x)
            this.__c("expenseCode", x.expense_code)
            this.__c("expenseName", x.expense_name)
            this.__c("expenseId", x.expense_id)
            this.__c("edit", true)
            this.__c("dialog", true)
        },

        del (x) {
            this.select(x)
            this.$store.commit("misc/SET_OBJECT", ["dialogDelete", true])
        },

        doDel () {
            this.$store.dispatch("masterExpense/delete").then((d) => {
                this.$store.commit("misc/SET_OBJECT", ["dialogDelete", false])
                this.search()
            })
        },

        select (x) {
            this.selectedPosition = x
        },

        isSelected (x) {
            if (!x || !this.selectedexpense) return false
            if (x.expense_id == this.selectedexpense.expense_id) return true
            return false
        }
    },

    mounted () {
        
    }
}
</script>