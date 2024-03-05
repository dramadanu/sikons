import { app } from "../../app.js?t=ewr"

export default {
    namespaced: true,
    state : {
        customers: [],
        total: 0,
        totalPage: 1,
        curPage: 1,
        selectedCustomer: null,

        provinces: [],
        selectedProvince: null,

        cities: [],
        selectedCity: null,

        // new
        customerName: "",
        customerAddress: "",
        customerPhone: "",
        customerNote: "",
        customerEmail: "",
        customerPostcode: "",
        customerPicName: "",
        customerPicPhone: "",
        customerNpwp: "",
        customerAuto: "N",
        customerMps: [],
        customerJoinDate: app.state.currentDate,
        customerProspect: 'N',
        currentDate: app.state.currentDate,

        customerTypes: [{id:'N',text:'Personal'},{id:'Y',text:'Bisnis'}],
        selectedCustomerType: null,

        staffs: [],
        selectedStaff: null,

        phones: [],
        selectedPhone: null,
        templatePhone: {no:"",wa:"N"},

        banks: [],
        selectedBank: null,

        cbanks: [],
        selecedCbank: null,
        templateCbank: {bank:null,no:"",name:""},

        snackbar: false,
        snackbar_text: '',

        search: '',
        edit: false,
        dialog: true,
        dialogDelete: false,
    },
    mutations: {
        SET_OBJECT(state, v) {
            let name = v[0]
            let val = v[1]
            state[name] = val
        },
        SET_OBJECTS(state, v) {
            let name = v[0]
            let val = v[1]
            for (let i = 0; i < name.length; i++)
                state[name[i]] = val[i]
        },
    },
    actions: {
        async search(context) {
            let prm = {
                search: context.state.search,
                page: context.state.curPage
            }

            return context.dispatch("postme", {
                url: "master/customer/search",
                prm: prm,
                callback: function(d) {
                    context.commit("SET_OBJECTS", [
                        ["customers", "total", "totalPage"],
                        [d.records, d.total, d.total_page]
                    ])
                    return d
                }
            }, { root: true })
        },

        async provinces(context) {            
            return context.dispatch("postme", {
                url: "master/province/search",
                prm: "",
                calback: function(d) {
                    context.commit("SET_OBJECTS", [['provinces'],[d.records]])
                }
            },{root:true})
        },

        async searchDd(context) {
            let prm = {
                search: context.state.search
            }

            return context.dispatch("postme", {
                url: "master/vendor/search_dd",
                prm: prm,
                callback: function(d) {
                    return d
                }
            }, { root: true })
        },

        async save(context) {
            let prm = {
                vendor_id: context.state.vendorId,
                vendor_number: context.state.vendorNumber,
                vendor_name: context.state.vendorName,
                vendor_address: context.state.vendorAddress,
                vendor_city: context.state.vendorCity,
                vendor_contact: context.state.vendorContact,
            }

            return context.dispatch("postme", {
                url: "master/vendor/save",
                prm: prm,
                callback: function(d) {
                    return d
                }
            }, { root: true })
        }
    }
}