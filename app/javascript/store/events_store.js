const state = {
    events: []
};

const getters = {
    allEvents: (state) => state.events,
};

const actions = {
    addEvent: ({ commit}, payload) => {
        commit("addEvent", payload);
    },
}

const mutations = {
    setEvents: (state, payload) => {
        state.events = payload;
    },
    addEvent(state, payload) {
        state.events = [payload, ...state.events]
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
};
