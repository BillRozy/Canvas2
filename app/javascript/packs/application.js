/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue'
import Spoiler from './components/Spoiler.vue'
import Comment from './components/Comment.vue'
import CommentList from './components/CommentList.vue'
import NewComment from './components/NewComment.vue'
import VueEventCalendar from 'vue-event-calendar'
import App from './app.vue'
Vue.use(VueEventCalendar, {locale: 'en'});

document.addEventListener('DOMContentLoaded', () => {
    const vueNode = document.getElementById('app');
    if (vueNode) {
        document.addEventListener('turbolinks:load', () => {
            new Vue({
                el: '#app',
                components: {
                    Spoiler, Comment, NewComment, VueEventCalendar, CommentList
                },
                data: {
                    demoEvents: [{
                        date: '2016/12/15',
                        title: 'Foo',
                        desc: 'longlonglong description'
                    },{
                        date: '2016/11/12',
                        title: 'Bar',
                        desc: 'dsfdfdsf'
                    }]
                }
            });
        })
    }
});


