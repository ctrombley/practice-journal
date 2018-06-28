import Vue from 'vue'
import App from './components/landing/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    render: h => h(App)
  })

  console.log(app)
})

console.log('Hello World from Webpacker')
