import App from './App'
import headers from './components/headers/headers.vue'
import bottoms from './components/bottoms/bottoms.vue'
import Navigation from './components/Navigation/Navigation.vue'
import Toast from './components/Navigation/Navigation.vue'
import { apiapi,upShop, up  } from "@/https/https.js"
import utils from '@/https/utils.js'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.component('Toast', Toast)
Vue.component('headers', headers)
Vue.component('bottoms', bottoms)
Vue.component('Navigation', Navigation)

Vue.config.productionTip = false

//直接挂载到原型上  通过this.$api直接调用
Vue.prototype.$httpapi = apiapi;
Vue.prototype.$upShop = upShop;
Vue.prototype.$up = up;
Vue.prototype.$utils=utils;

Vue.use(ElementUI);
// #ifndef VUE3
import Vue from 'vue'
import './uni.promisify.adaptor'
Vue.config.productionTip = false
App.mpType = 'app'
App.el = '#app'
const app = new Vue({
  ...App
})
app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif