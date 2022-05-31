require('./bootstrap');

window.Vue = require('vue');
Vue.prototype.$lang = document.documentElement.getAttribute('lang');
Vue.prototype.$currency = document.documentElement.getAttribute('currency');
Vue.prototype.$currencyRate = document.documentElement.getAttribute('currency-rate');
Vue.prototype.$mainCurrency = document.documentElement.getAttribute('main-currency');
Vue.prototype.$device = document.documentElement.getAttribute('device');

export const bus = new Vue();
import VeeValidate from 'vee-validate';
import BootstrapVue from 'bootstrap-vue';
import VueNestable from 'vue-nestable';
import Fragment from 'vue-fragment';

Vue.use(VueNestable)

import Slick from 'vue-slick';
Vue.prototype.trans = trans;

import vSelect from 'vue-select';
Vue.component('v-select', vSelect)

// admin Components - Categories
Vue.component('categories', require('./components/admin/Categories.vue'));
Vue.component('categories-add-new', require('./components/admin/CategoriesAddNew.vue'));

// admin Components - Blog Categories
Vue.component('blog-categories', require('./components/admin/blogCategories/Categories.vue'));
Vue.component('blog-categories-add-new', require('./components/admin/blogCategories/CategoriesAddNew.vue'));

// admin Components - Parameters
Vue.component('create-parameter', require('./components/admin/ParameterCreate.vue'));
Vue.component('edit-parameter', require('./components/admin/ParameterEdit.vue'));

// admin Components - Translations
Vue.component('top-bar-translations', require('./components/admin/TranslationTopBar.vue'));
Vue.component('group-translations', require('./components/admin/TranslationGroup.vue'));
Vue.component('item-translations', require('./components/admin/TranslationItem.vue'));

Vue.use(VeeValidate, {
  classes: true,
  classNames: {
    valid: "is-valid",
    invalid: "is-invalid"
  }
});

Vue.directive('select2', {
    inserted(el) {
        $(el).on('select2:select', () => {
            const event = new Event('change', { bubbles: true, cancelable: true });
            el.dispatchEvent(event);
        });

        $(el).on('select2:unselect', () => {
            const event = new Event('change', {bubbles: true, cancelable: true})
            el.dispatchEvent(event)
        })
    },
});


if (Vue.prototype.$device == 'sm'){
    setTimeout(function(){
        $('.sniper-load').fadeOut();
    }, 1700);
}

const app = new Vue({
    el: '#cover'
});
