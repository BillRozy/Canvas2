/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import Spoiler from './components/Spoiler.vue'
import App from './app.vue'

const app = new Vue({
  el: 'body',
  components: {
    Spoiler
  }
});

