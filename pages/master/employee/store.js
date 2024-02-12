// import userModule from './_modules/test.js';
import { ajaxPost, URL, app, APP_NAME } from "../../../app.js?t=ewr"
import masterEmployee from "../../../modules/master/employee.js?t=12re3"
import misc from "../../../modules/misc/misc.js?t=12re3"
import xdate from "../../../modules/misc/date.js?t=12re3"
import masterPosition from "../../../modules/master/position.js?t=123"

Vue.use(Vuex);
Vue.use(Vuetify);
Vue.config.productionTip = false

// const userModule = () => import('./_modules/test.js')
// const masterPosition = () => import(URL + './_modules/master/pos.js')

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
    modules: {
        masterEmployee: masterEmployee,
        misc: misc,
        xdate: xdate,
        masterPosition: masterPosition,
        app: app
    }   
});
