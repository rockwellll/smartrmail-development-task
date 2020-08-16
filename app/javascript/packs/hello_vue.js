import Vue from 'vue/dist/vue.js';
import Vuex from "vuex";
import TurbolinksAdapter from 'vue-turbolinks'
import VModal from 'vue-js-modal'

import Event  from "../event";
import NewEvent from "../new_event_form";
import Calendar from "../calendar";
import CloseIconButton from "../close_icon_button";
import TableHeader from "../table_header";

import events from "../store/events_store";
import { createConsumerFor } from "../channels/events_channel";


Vue.use(TurbolinksAdapter)
Vue.use(Vuex);
Vue.use(VModal);


Vue.component('event', Event);
Vue.component('new-event-form', NewEvent);
Vue.component('calendar', Calendar);
Vue.component('close-icon-button', CloseIconButton);
Vue.component('table-header', TableHeader);

const mainStore = new Vuex.Store({
  modules: {
    events
  }
});

createConsumerFor(mainStore);

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behaviour="vue"]',
    store: mainStore
  })
})


