// import userModule from './_modules/test.js';
import { ajaxPost, URL, app, APP_NAME } from "../../../app.js?t=ewr"
import sales from "../../../modules/sales/sales.js"
import misc from "../../../modules/misc/misc.js"

Vue.use(Vuex);
Vue.use(Vuetify);
Vue.config.productionTip = false

export const store = new Vuex.Store({
    state: {
        APP_NAME: APP_NAME,
        search_status: 0,
        search_error_message: ""
    },
    
    mutations: {
        set_object(state, v) {
            let name = v[0]
            let val = v[1]
            state[name] = val
        }
    },

    actions : {
        async postme(context, d) {
            return context.dispatch("app/postme", d)
        }
    },

    modules : {
        sales: sales,
        misc: misc,
        app: app
    }
})