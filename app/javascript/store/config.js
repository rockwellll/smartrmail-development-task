import vue from "vue";
import vuex from "vuex";

import events from  "./events-store";

vue.use(vuex);

export const mainStore = new vuex.Store({
    modules: {
       events
    }
});
