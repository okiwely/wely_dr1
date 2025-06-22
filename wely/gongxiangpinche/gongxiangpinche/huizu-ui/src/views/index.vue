<!--<template>-->
<!--  <div id="indexC" class="indexC">-->
<!--    <div class="MsgBox" id="aiMsgBox">-->
<!--      <div id="di" class="huanying">-->
<!--        <span class="sp">欢迎使用方云项目管理平台</span>-->
<!--      </div>-->

<!--      <div v-show="welcome" class="welcome" id="welcome">-->
<!--        <div>{{ hollow }},今天是 {{ weather.fxDate }} 号</div>-->
<!--        <div>-->
<!--          <span>今日天气{{ weather.textDay }}，</span-->
<!--          >{{ weather.windDirDay }}，<br />-->
<!--          最{{ weather.tempMax }}℃, 最{{ weather.tempMin }}℃-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
<!--  </div>-->
<!--</template>-->
<!--<script>-->
<!--import axios from 'axios'-->
<!--export default {-->
<!--  data() {-->
<!--    return {-->
<!--      weather: {}, //天气-->
<!--      welcome: true,-->
<!--      month: "",-->
<!--      hollow: "",-->
<!--    };-->
<!--  },-->
<!--  created() {-->
<!--    this.getWeatherStatus();-->
<!--  },-->
<!--  methods: {-->
<!--    //获取天气情况-->
<!--    getWeatherStatus() {-->
<!--      let that = this;-->
<!--      axios({-->
<!--        url: 'https://devapi.qweather.com/v7/weather/3d',-->
<!--        dataType: "json",-->
<!--        params: {-->
<!--          location: "101120101",-->
<!--          key: "b7762741f0744fb3aaceefb80b52dee5"-->
<!--        }-->
<!--      }).then(response => {-->
<!--          console.log( response.data)-->
<!--          this.weather = response.data.daily[0];-->
<!--          console.log( this.weather)-->
<!--        }, error => {-->
<!--          console.log('错误', error.message)-->
<!--        })-->
<!--      that.getTime();-->
<!--      // setTimeout(() => {-->
<!--      //   if (that.weather == "") {-->
<!--      //     that.getWeatherStatus();-->
<!--      //   }-->
<!--      // }, 500);-->
<!--    },-->
<!--    //获取时间-->
<!--    getTimes() {-->
<!--      let date = new Date();-->
<!--      let year = date.getFullYear();-->
<!--      let mon = date.getMonth() + 1;-->
<!--      let day = date.getDate();-->
<!--      let time = "";-->
<!--      if (mon < 10 && day < 10) {-->
<!--        time = year + "-0" + mon + "-0" + day;-->
<!--      } else if (mon < 10 && day >= 10) {-->
<!--        time = year + "-0" + mon + "-" + day;-->
<!--      } else if (mon >= 10 && day < 10) {-->
<!--        time = year + "-" + mon + "-0" + day;-->
<!--      }-->
<!--      return time;-->
<!--    },-->
<!--    getTime() {-->
<!--      var date = new Date();-->
<!--      var month = date.getMonth() + 1;-->
<!--      var time = date.getHours();-->
<!--      this.month = month;-->
<!--      if (time >= 0 && time < 11) {-->
<!--        this.hollow = "早上好";-->
<!--      } else if (time >= 11 && time < 13) {-->
<!--        this.hollow = "中午好";-->
<!--      } else if (time >= 13 && time < 18) {-->
<!--        this.hollow = "下午好";-->
<!--      } else if (time >= 18 && time < 24) {-->
<!--        this.hollow = "晚上好";-->
<!--      }-->
<!--    },-->
<!--  },-->
<!--};-->
<!--</script>-->
<!--<style lang="scss">-->
<!--.indexC {-->
<!--  font-size: 26px;-->
<!--  height: 91vh;-->
<!--  background-size: 100% 100%;-->
<!--  position: relative;-->
<!--  background-image: url("../assets/images/login-background.jpg");-->
<!--}-->
<!--.MsgBox {-->
<!--  float: left;-->
<!--  width: 240px;-->
<!--  margin-left: 5px;-->
<!--  cursor: default;-->
<!--  position: relative;-->
<!--}-->
<!--.sp{-->
<!--  display: block;-->
<!--  //position: absolute;-->
<!--  top: 45vh;-->
<!--  left: 35vw;-->
<!--  font-size: 30px;-->
<!--  color: white;-->
<!--  font-weight: 700;-->
<!--  text-shadow: 0 0 10px #2BF2F5,0 0 20px #2BF2F5,0 0 30px #2BF2F5,0 0 40px #2BF2F5;-->
<!--}-->
<!--.welcome {-->
<!--  width: 100%;-->
<!--  font-size: 18px;-->
<!--  font-weight: 600;-->
<!--  margin-top: 10px;-->
<!--  color: #43b0fd;-->
<!--}-->
<!--</style>-->
