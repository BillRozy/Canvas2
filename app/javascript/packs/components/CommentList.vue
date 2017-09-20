<template lang="pug">
    .comment-list
        comment(v-for="comment in comments", :user="comment.user.surname + ' ' + comment.user.name", :avatarsrc="comment.user.avatar.thumb.url", :text="comment.comment.body", :date="comment.comment.created_at")
        new-comment(v-if="authorized", :user="user", :user_id="user_id", :avatarsrc="avatarsrc", :portfolio_id="portfolio_id")
</template>

<script>
    import axios from "axios"
    import Comment from "./Comment.vue"
    import NewComment from "./NewComment.vue"
    import EventBus from "../eventbus.js"
    export default {

        data() {
            return {
                comments: [],
                authorized: this.is_authorized === "true",
                action: this.api
            }
        },

        components: {
            Comment, NewComment
        },

        props: {
            api: {required: true},
            is_authorized: {required: true},
            user_id: {required: true},
            user: {default: "Guest"},
            avatarsrc: {default: "some src"},
            portfolio_id: {required: true}
        },

        mounted: function() {
            this.requestComments();
            EventBus.listen('comment:added', this.addNewComment);
        },

        methods: {
            requestComments: function(){
                axios.get(this.api).
                then(response => {
                    this.comments = response.data.message
                }).
                catch(error => {
                    console.log("Can't get commentaries!")
                })
            },
            
            addNewComment: function (comment) {
                this.comments.push(comment);
            }
        }
    }
</script>

<style lang="sass" scoped>

.comment-list{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width:100%;
}
</style>