<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="py-2">TITLE</v-card-title>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" lg="3">
                            <v-data-table
                                :headers="headers"
                                :items="projects"
                                :items-per-page="10"
                                class="elevation-1"
                                hide-default-footer
                            >
                                <template v-slot:item="{ item }">
                                    <tr>
                                        <td>{{ item.customer_name }}</td>
                                    </tr>
                                </template>
                            </v-data-table>  
                        </v-col>
                        <v-col cols="12" lg="9">
                            <v-data-table
                                :headers="headers2"
                                :items="projects"
                                :items-per-page="10"
                                class="elevation-1"
                                hide-default-footer
                            >
                                <template v-slot:item="{ item }">
                                    <tr>
                                        <td>{{ item.project_date }}</td>
                                        <td>{{ item.target_date }}</td>
                                        <td>{{ item.staff_name }}</td>
                                    </tr>
                                </template>
                            </v-data-table> 
                        </v-col>
                        <v-col cols="12" lg="3">
                            <v-list dense class="cyan lighten-5">
                                <v-list-title class="px-4">
                                    PROJECTS</v-list-title>
                                <v-list-item-group
                                    v-model="selectedItem"
                                    color="primary"
                                >
                                    <v-list-item
                                    v-for="(project, i) in projects"
                                    :key="i"
                                    >
                                        <v-list-item-content>
                                            <v-list-item-title v-text="project.customer_name"></v-list-item-title>
                                            <v-list-item-subtitle v-text="project.city_name"></v-list-item-subtitle>
                                        </v-list-item-content>
                                    </v-list-item>
                                </v-list-item-group>
                            </v-list>
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
        searchbar: httpVueLoader("../_common/search_bar.vue"),
        ddelete: httpVueLoader("../_common/delete_dialog.vue"),
    },

    data () {
        return {
            selectedItem: 1,
            items: [
                { text: 'Real-Time', icon: 'mdi-clock' },
                { text: 'Audience', icon: 'mdi-account' },
                { text: 'Conversions', icon: 'mdi-flag' },
            ],
        }
    },

    computed : {
        __s () { return this.$store.state.project },

        ...Vuex.mapState({
            projects: s => s.project.projects,
            total: s => s.project.total,
            totalPage: s => s.project.totalPage
        }),

        headers () {
            return h = [{text: 'CUSTOMER', align: 'start', sortable: false, value: '', class: 'subtitle-1', width: '100%'}]
        },
        
        headers2 () {
            return h = [
                {text: 'PROJECT DATE', align: 'start', sortable: false, value: '', class: 'subtitle-1', width: '20%'},
                {text: 'TARGET DATE', align: 'start', sortable: false, value: '', class: 'subtitle-1', width: '20%'},
                {text: 'PROJECT MANAGER', align: 'start', sortable: false, value: '', class: 'subtitle-1', width: '60%'}]
        },

        curPage : {
            get () { return this.__s.curPage },
            set (v) { this.__c("curPage", v) }
        }
    }
}
</script>