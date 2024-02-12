<template>
    <v-row>
        <v-col cols="12" sm="6" md="6" class="red white--text">
            <h5>{{ title }}</h5>

            <v-card>
                <v-card-text>
                    <v-data-table
                        :items="statuses"
                        hide-default-footer
                    >
                        <template v-slot:header>
                            <tr>
                                <th>Kode</th>
                                <th>Nama</th>
                            </tr>
                        </template>

                        <template v-slot:item="{item}">
                            <tr>
                                <td>{{ item.status_code }}</td>
                                <td>{{ item.status_name }}</td>
                            </tr>
                        </template>
                    </v-data-table>

                    <v-pagination
                        v-model="curPage"
                        :length="totalPage"
                        total-visible="5"
                    >
                    </v-pagination>
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

    computed : {
        statuses () {
            return this.$store.state.masterStatus.statuses
        },

        curPage : {
            get () { return this.$store.state.masterStatus.curPage },
            set (v) { this.$store.commit("masterStatus/set_curpage", v) }
        },

        totalPage () {
            return this.$store.state.masterStatus.totalPage
        }
    },

    methods : {
        search () {
            this.$store.dispatch("masterStatus/search")
        }
    },

    mounted () {
        this.search()
    }
}
</script>