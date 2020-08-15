/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:

import Vue from 'vue/dist/vue.js';
import Vuex from "vuex";
import TurbolinksAdapter from 'vue-turbolinks'

import Event  from "../event";
import Modal from "../modal";
import NewEvent from "../new_event_form";
import Calendar from "../calendar";

import events from "../store/events_store";


Vue.use(TurbolinksAdapter)
Vue.use(Vuex);

Vue.component('event', Event);
Vue.component('modal', Modal);
Vue.component('new-event-form', NewEvent);
Vue.component('calendar', Calendar);

const mainStore = new Vuex.Store({
  modules: {
    events
  }
});


document.addEventListener('turbolinks:load', () => {
  // Vue.http.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[nam="csrf-token"').getAttribute('content');

  const app = new Vue({
    el: '[data-behaviour="vue"]',
    store: mainStore
  })
})


