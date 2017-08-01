<template lang="pug">
    .comment-list
        comment(v-for="comment in comments", :user="comment.user.surname + ' ' + comment.user.name", :avatarsrc="comment.user.avatar.thumb.url", :text="comment.comment.body", :date="comment.comment.created_at")
</template>

<script>
    import axios from "axios"
    import Comment from "./Comment.vue"
    export default {

        data() {
            return {
                comments: [],
                action: this.api
            }
        },

        components: {
            Comment
        },

        props: {
            api: {required: true}
        },

        mounted: function() {
            this.requestComments();
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
            }
        }
    }
</script>

<style lang="sass" scoped>

.comment-list{
    width:100%;
}
</style>