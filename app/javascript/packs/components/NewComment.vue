<template lang="pug">
  .new-comment-block
        div
            |           {{user}} говорит:
        #new_comment
            .comment-user
                img.comment-avatar(:src="avatarsrc")
            textarea(name="body", id="new-comment-text", v-model="commentText", placeholder="Введите свой отзыв...")
            input.btn.btn-primary(type="button", value="OK", @click="sendComment")
</template>

<script>
    import EventBus from "../eventbus.js"
    import axios from 'axios'
    export default {

        name: 'new-comment',

        data() {
            return {
                commentText: this.text
            }
        },

        props: {
            user_id: {required: true},
            user: {default: "Guest"},
            avatarsrc: {default: "some src"},
            portfolio_id: {required: true}
        },

        methods: {
            sendComment(){
                var self = this;
                axios.post('/comments', {
                        comment: {
                            user_id: self.user_id,
                            body: self.commentText,
                            portfolio_id: self.portfolio_id
                        }
                }, {responseType: 'json'})
                .then(function (response) {
                    EventBus.fire('comment:added', response.data.message);
                    self.commentText = "";
                    console.log(response);
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        }
    }
</script>

<style lang="sass" scoped>
    #new_comment{
        display: block;
        position: relative;
        width:80%;
        background: white;
        height: 80px;
        padding: 5px;
    }

    #new_comment textarea {
        box-sizing: border-box;
        position: absolute;
        width:100%;
        height:60px;
        background: white;
        border:1px solid black;
        margin:0;
        padding: 20px 65px;
        text-decoration: none;
        -moz-appearance: none;
        border-radius: 10px;
    }

    #new_comment input[type = 'button'] {
        position: absolute;
        box-sizing: border-box;
        width:60px;
        height:60px;
        right:-5px;
        background: black;
        color:white;
        border:1px solid black;
        border-radius: 0 5px 5px 0;
        margin:0;
        transition:0.2s;
        z-index: 100;
    }

    #new_comment input[type = 'button']:hover {
        background: darkgray;
        cursor: pointer;
    }

    .make-inline{
        display: inline-block;
    }

    .new-comment-block{
        display: block;
        width: 60%;
        background: white;
        height: 120px;
        border: 1px lightgrey solid;
        border-radius: 10px;
        padding:10px;
        margin: 10px;
        min-width: 255px;
    }
    .comment-user {
        position: absolute;
        width:60px;
        height:60px;
        z-index: 100;
    }

    .comment-avatar {
        box-sizing: border-box;
        width:60px;
        height:60px;
        border:1px solid black;
        border-radius: 5px 0 0 5px;
    }
</style>