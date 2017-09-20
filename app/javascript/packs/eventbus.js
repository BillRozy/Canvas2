import Vue from 'vue'

var EventBus = new class{

    constructor(){
        this.vue = new Vue();
    }

    fire(event, payload) {
        this.vue.$emit(event, payload);
    }

    listen(event, callback){
        this.vue.$on(event, callback);
    }
}


export default EventBus;