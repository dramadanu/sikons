export default {
    namespaced: true,
    state: {
        expens: [],
        totalPos: 0,
        totalPosPage: 1,
        curPage: 1,
        selectedExpense: null,
        search: "",

        expenseCode: '',
        expenseName: '',
        posId: 0,
        edit: false,
        dialog: false
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
                url: "master/expense/search",
                prm: prm,
                callback: function(d) {
                    context.commit("SET_OBJECTS", [
                        ["expenses", "totalPos", "totalPosPage"],
                        [d.records, d.total, d.total_page]
                    ])
                    return d
                }
            }, { root: true })
        },

        async searchDd(context) {
            let prm = {
                search: context.state.search
            }

            return context.dispatch("postme", {
                url: "master/expense/search_dd",
                prm: prm,
                callback: function(d) {
                    return d
                }
            }, { root: true })
        },

        async save(context) {
            let prm = {
                expense_name: context.state.expenseName,
                expense_categoryid: context.state.expenseCategoryId,
                expense_code: context.state.expenseCode,
                expense_id: context.state.posId
            }

            return context.dispatch("postme", {
                url: "master/expense/save",
                prm: prm,
                callback: function(d) {
                    return d
                }
            }, { root: true })
        },
        async delete(context) {
            let id = context.state.selectedExpense.expense_id
            return context.dispatch("postme",{
                url: "master/expense/del",
                prm: {id:id},
                callback: function(d) {
                    return d
                }
            }, { root: true })
        }
    }
}