<template>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title primary-title class="bg-info white--text py-2">
                    <v-row>
                        <v-col cols="12"><h3 class="display-1">SALES</h3></v-col>
                    </v-row>
                    <div class="bg-purple-darken-2 text-center">
                    <v-btn>SIMPAN</v-btn>
                    </div>
                </v-card-title>


        <v-row no-gutters>
            <v-col>
                <v-card-text class="py-2 px-3">
                    <v-text-field label="No" variant="outlined"></v-text-field>
                </v-card-text>
            </v-col>
            <v-col>
                <v-row no-gutters>
                    <v-col>
                <v-card-text class="py-2 px-3">
                    <v-text-field label="Nama PIC" variant="outlined"></v-text-field>
                </v-card-text>
                    </v-col>
                    <v-col>
                <v-card-text class="py-2 px-3">
                    <v-text-field label="No. HP" variant="outlined"></v-text-field>
                </v-card-text>
                    </v-col>
                </v-row>
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

}
</script>