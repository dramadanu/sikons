export default {
    namespaced: true,
    state: {
        edit: false,
        dialog: false,
        
        projects: [],
        selectedProject: null,

        edit: false,
        dialog: false,
        dialogDelete: false,
    },
    mutations: {
        SET_OBJECT(state, v) {
            let name = v[0]
            let val = v[1]
            state[name] = val
        }
    },
    actions: {
        
        // async save(context) {
        //     let prm = {
        //         sales_number: context.state.salesNumber,
        //         sales_list: context.state.salesList,
        //         sales_customer: context.state.salesCustomer,
        //         sales_address: context.state.salesAddress,
        //         sales_duration: context.state.salesDuration,
        //         sales_note: context.state.salesNote,
        //         sales_pic: context.state.salesPIC,
        //         sales_hp: context.state.salesHP,
        //         sales_projectaddress: context.state.salesProjectAddress,
        //         sales_projectprovince: context.state.salesProjectProvince,
        //         sales_projectcity: context.state.salesProjectCity,
        //         sales_projectdistricts: context.state.salesProjectDistricts,
        //         sales_projectsubdistricts: context.state.salesProjectSubdistricts,
        //         sales_map: context.state.salesMap,
        //     }
        //     return context.dispatch("postme", {
        //         url: "sales/sales/save",
        //         prm: prm,
        //         callback: function (d) {
        //             return d
        //         }
        //     }, {root: true})
        // },
    }
}
