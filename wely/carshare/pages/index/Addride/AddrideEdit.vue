<template>
	<view class="content">
		<headers ref="headers"  style="position: fixed;top:0;left:0;z-index: 1;"></headers>
		<view style="height: 7.905rem;"></view>
		<view style="font-size:  1.581rem;color: #000000;margin: 2.372rem auto  2.529rem;width:139.13rem;"><text style="cursor: pointer;" @click="writetoList">ドライブ一覧ページ >></text> <text style="color: #FF3D66;">新規作成、编集</text></view>
		<view class="flex" style="margin:0 auto  2.372rem;width:139.13rem;">
			<view style="width:9 1.739rem;margin:0  3.162rem 0 0;">
				<view
					style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
					<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">ル—ト</view>

					<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
						<view style="margin-right: 1.739rem;" class="flexJusp">出発地</view>
						<view class="flexJusp"
							style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;align-items: center;">
							<input v-model="startAddress" style="width: 6 4.743rem;border-radius: 1.106rem;font-size: 1.739rem;"
								placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
							<image @click="dakaiDitu(1)" style="width: 2.529rem;height: 2.529rem;cursor: pointer;"
								src="/static/images/address.png"></image>
						</view>
						<!-- <input @click="dakaiDitu(1)" v-model="startAddress" style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;" placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" /> -->

					</view>
					<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;margin: 2.372rem 0 2.055rem;">
						<view style="margin-right: 1.739rem;" class="flexJusp">目的地</view>
						<!-- <picker @change="bindPickerChangex" :value="indexs" :range="listCity" range-key="city">
							<view style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;line-height:5.217rem;">
								<view v-if="listCity[indexs]">{{listCity[indexs].city}}</view>
								<view v-else style="width:2 4.743rem;">選択してください</view>
							</view>
						</picker> -->
						<view class="flexJusp"
							style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;align-items: center;">
							<input v-model="endAddress" style="width: 6 4.743rem;border-radius: 1.106rem;font-size: 1.739rem;"
								placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
							<image @click="dakaiDitu(2)" style="width: 2.529rem;height: 2.529rem;cursor: pointer;"
								src="/static/images/address.png"></image>
						</view>
						<!-- <input @click="dakaiDitu(2)" v-model="endAddress" style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;" placeholder="日本、神奈川県横浜市西区高岛2丁目16 横浜駅" /> -->
					</view>
					<view style="background: #F7F8F9;border-radius: 1.423rem;padding:1.423rem;" v-if="detail.startAddress">
						<view class="flexJusp" style="align-items: center;">
							<view style="font-size: 1.423rem;">前回のドライプ</view>
							<view @click="shiyong"
								style="width: 16.205rem;height:  2.372rem;background: rgba(255,255,255,0);border-radius: 7px;border: 1px solid #F44870;font-size: 1.106rem;color: #F44870;line-height:  2.372rem;text-align: center;cursor: pointer;">
								前回のドライプをコビ-する</view>
						</view>
						<view class="flex" style="margin: 1.581rem 0 0.948rem;align-items: center;">
							<image style="width:1.818rem;height: 1.739rem;margin-right:0.949rem;" src="/static/images/q.png"></image>
							<view style="font-size: 1.264rem;color: #333333;">{{detail.startAddress}}</view>
						</view>
						<view class="flex">
							<image style="width:1.818rem;height: 1.739rem;margin-right:0.949rem;" src="/static/images/w.png"></image>
							<view style="font-size: 1.264rem;color: #333333;">{{detail.endAddress}}</view>
						</view>
					</view>
				</view>
				<view
					style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
					<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">日程</view>

					<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
						<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
							<text>繰</text>
							<text>り</text>
							<text>返</text>
							<text>し</text>
							<text>設</text>
							<text>定</text>
						</view>
						<picker @change="bindPickerChangess" :value="state" :range="list" range-key="label">
							<view class="flexJusp"
								style="align-items: center;width: 51.225rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;">
								<!-- <input style="width: 47.431rem;" placeholder="繰り返し"/> -->
								<view style="width:47.431rem;" v-if="list[state]">{{list[state].label}}</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view class="flex"
						style="font-size: 1.897rem;height:5.217rem;align-items: center;margin:2.292rem 0 1.502rem;align-items: center;">
						<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
							<text>出</text>
							<text>発</text>
							<text>日</text>
							<text>時</text>
						</view>
						<el-date-picker
							style="width:19.447rem;height:  3.162rem;border-radius: 7px;border: 1px solid #707070;font-size:  1.581rem;"
							v-model="date" type="date" value-format="yyyy-MM-dd" placeholder="日付を選択"></el-date-picker>
						<!-- <view class="flex" style="align-items: center;font-size: 1.581rem;">
							<image v-if="types==0" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(0)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(0)" style="margin:0  3.162rem 0 0.948rem;">月</view>
							
							<image v-if="types==1" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(1)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(1)" style="margin:0  3.162rem 0 0.948rem;">火</view>
							
							<image v-if="types==2" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(2)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(2)" style="margin:0  3.162rem 0 0.948rem;">水</view>
							
							<image v-if="types==3" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(3)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(3)" style="margin:0  3.162rem 0 0.948rem;">木</view>
							
							<image v-if="types==4" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(4)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(4)" style="margin:0  3.162rem 0 0.948rem;">金</view>
							
							<image v-if="types==5" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(5)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(5)" style="margin:0  3.162rem 0 0.948rem;">土</view>
							
							<image v-if="types==6" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
							<image @click="qiehuan(6)" v-else style="width: 1.739rem;height:  1.739rem;" src="/static/images/isc.png"></image>
							<view @click="qiehuan(6)" style="margin:0  3.162rem 0 0.948rem;">日</view>
						</view> -->
						<!-- margin:2.292rem 0 1.502rem; -->
						<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;margin-left: 3.162rem;">
							<!-- <view style="margin-right: 1.739rem;width:11.383rem;"></view> -->
							<view class="flex" style="align-items: center;">

								<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
									<view class="flexJusp boxs">
										<view>{{shiList[shiIndex]||'00'}}</view>
										<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png"></image>
									</view>
								</picker>
								<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
									<view class="flexJusp boxs" style="margin:0 0.79rem;">
										<view>{{fenList[fenIndex]||'00'}}</view>
										<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png"></image>
									</view>
								</picker>
								<view style="font-weight: bold;font-size:  1.581rem;">-</view>
								<picker @change="bindPickerChange3" :value="shiIndexs" :range="shiList">
									<view class="flexJusp boxs" style="margin:0 0.79rem;">
										<view>{{shiList[shiIndexs]||'00'}}</view>
										<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png"></image>
									</view>
								</picker>
								<picker @change="bindPickerChange4" :value="fenIndexs" :range="fenList">
									<view class="flexJusp boxs">
										<view>{{fenList[fenIndexs]||'00'}}</view>
										<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png"></image>
									</view>
								</picker>
							</view>
						</view>
					</view>
				</view>
				<view
					style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
					<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">その他</view>

					<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
						<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
							<text>事</text>
							<text>前</text>
							<text>確</text>
							<text>認</text>
							<text>事</text>
							<text>項</text>
						</view>
						<input v-model="attention"
							style="width: 51.225rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;"
							placeholder="入力してください" />
					</view>
				</view>
			</view>

			<view
				style="width:58.34rem;padding:  2.372rem;background-color: #FFF;border-radius: 1.581rem;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);height:5 1.739rem;">
				<div style="width:58.34rem;height:5 1.739rem;" id="googleMaps"></div>

				<!-- <map style="width:58.34rem;height:5 1.739rem;" show-location @regionchange="onRegionChange" :latitude="35.9593" :longitude="139.6344"></map> -->
			</view>
		</view>
		<view class="flexJusp"
			style="width: 133.913rem;height: 12.332rem;background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius:  1.581rem;margin:0 auto  2.372rem;padding: 2.372rem  3.162rem  2.372rem 2.055rem;align-items: center;">
			<view>
				<view style="font-size: 3.478rem;">￥{{this.detail.price}}</view>
				<view style="font-size:  1.581rem;">募集</view>
			</view>
			<view @click="chuangjian"
				style="width: 17.233rem;height: 5.06rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size:  1.739rem;color: #FFFFFF;line-height: 5.06rem;text-align: center;cursor: pointer;">
				登録する</view>
		</view>
		<view style="height:16.126rem"></view>
		<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
		<toast ref="toast"></toast>
		<uni-popup ref="popup">
			<view style="background-color: #FFF;border-radius: 1.581rem;padding: 1.581rem;">
				<div class="map" id="googleMap"></div>
				<view class="flexJusp" style="margin-top: 1.581rem;">
					<view></view>
					<view class="flex">
						<view class="buttonsx" @click="close">キャンセル</view>
						<view class="buttonss" @click="queding">確認</view>
					</view>
				</view>
			</view>
		</uni-popup>
		<uni-popup ref="popups">ポップアップ</uni-popup>
	</view>
</template>

<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk&v=alpha&libraries=maps3d">
</script>
<script>
	import GoogleMap from "@/https/GoogleMap"; //引入mixins封装的函数
	import {
		Loader
	} from '@googlemaps/js-api-loader' //引入
	export default {
		mixins: [GoogleMap],
		props: {
			//mapType属性值为:
			//selectPoint时是地图选点
			//POLYGON是绘制地图多边形区域

			//地图id
			mapID: {
				type: String,
				default: () => {
					return 'googleMap'
				},
			},
			//谷歌地图类型
			mapType: {
				type: String,
				default: () => {
					return 'default'
				},
			},
			//谷歌地图配置
			mapOptions: {
				type: Object,
				default: () => {
					return {
						//为了关闭默认控件集,设置地图的disableDefaultUI的属性为true
						disableDefaultUI: false,
						// 启用缩放和平移
						gestureHandling: 'greedy',
						panControl: true,
						zoomControl: true,
						scaleControl: true,
						//关闭街景
						streetViewControl: false,
					}
				},
			},
			//谷歌地图中心点
			googleMapCenter: {
				type: Object,
				default: () => {
					return {
						lat: 35.9593,
						lng: 139.6344,
					}
				},
			},
			//谷歌地图缩放级别
			zoom: {
				type: Number,
				default () {
					return 9
				},
			},
			//谷歌地图图形path
			mapPath: {
				type: String,
				default: () => {
					return ''
				},
			},
		},
		data() {
			return {
				types: 0,
				
				list: [],
				listCity: [],
				index: -1,
				indexs: -1,
				state: 0,
				date: '',
				shiList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23'
				],
				shiIndex: 0,
				shiIndexs: 23,
				fenList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31',
					'32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47',
					'48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59'
				],
				fenIndex: 0,
				fenIndexs: 59,
				attention: '',
				comment: '',
				startLonLat: '',
				endLonLat: '',
				detail: {
					startAddress: '',
					endAddress: '',
					startLonLat: '',
					endLonLat: ''
				},
				endAddress: '',
				startAddress: '',
				//地图选点回显值
				longlat: this.googleMapCenter.lng + ',' + this.googleMapCenter.lat,
				//标记点
				marker: [],
				markers: [],
				//图形实例
				graphicalExample: null,
				//图形路径经纬度
				graphicalPath: [],
				apiKey: 'AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk',
				type: 2,
				typex: 1,
				googleApi: '',
				googleMap: '',
				googleApis: '',
				googleMaps: '',
				id:''
			}
		},
		onLoad(option) {
			this.id = option.id
			this.loads()
			
		},
		onShow(){
			var data = getApp().globalData.Informations
			setTimeout(()=>{
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			onRegionChange(e) {
				console.log(e, '-----------taps点击地图')
			},
			taps(e) {
				console.log(e, '-----------taps点击地图')
			},
			anchorpointtaps(e) {
				console.log(e, '-----------anchorpointtaps点击地图')
			},
			dakaiDitu(type) {
				this.typex = type
				this.$nextTick(() => {
					const loader = new Loader({
						apiKey: this.apiKey, //之前的key
						version: 'weekly', //版本
						libraries: ['places'], //插件库places为基础库 drawing为绘制工具库
						region: 'Canada',
						language: 'en',
					})
					const mapOptions = {
						center: {
							lat: this.googleMapCenter.lat * 1,
							lng: this.googleMapCenter.lng * 1
						}, //中心点
						zoom: this.zoom, //缩放级别
						...this.mapOptions, //其他配置
					}
					loader.load().then((google) => {
							const map = new google.maps.Map(document.getElementById(this.mapID), mapOptions)
							this.googleMap = map
							this.googleApi = google
							// this.selectPoint()

							this.googleMap.addListener('click', (e) => {
								this.clickGmap(e)
							})
							console.log(this.googleMap, '谷歌地图实例')
							console.log(this.googleApi, '谷歌地图api')
							let drawingModesList = {
								MARKER: this.googleApi.maps.drawing.OverlayType.MARKER, //标记点
								CIRCLE: this.googleApi.maps.drawing.OverlayType.CIRCLE, //圆形
								POLYGON: this.googleApi.maps.drawing.OverlayType.POLYGON, //多边形
								POLYLINE: this.googleApi.maps.drawing.OverlayType.POLYLINE, //折线
								RECTANGLE: this.googleApi.maps.drawing.OverlayType.RECTANGLE, //矩形
							}
							const drawingManager = new this.googleApi.maps.drawing.DrawingManager({
								drawingControl: true,
								drawingControlOptions: {
									position: this.googleApi.maps.ControlPosition.TOP_CENTER,
									drawingModes: [drawingModesList[this
										.mapType]], //这是个数组，因为我只需要多边形的就只传了一个
								},
								polygonOptions: {
									fillColor: 'blue',
									strokeColor: 'blue',
									strokeOpacity: 0.8,
									fillOpacity: 0.4,
									strokeWeight: 5,
									clickable: false,
									editable: true,
									zIndex: 1,
								},
							})
							drawingManager.setMap(map)
						})
						.catch((e) => {
							// do something
							console.log(e)
						})
				})
				this.$refs.popup.open('center')
			},
			loadx() {

				this.$nextTick(() => {
					const loader = new Loader({
						apiKey: this.apiKey, //之前的key
						version: 'weekly', //版本
						libraries: ['places'], //插件库places为基础库 drawing为绘制工具库
						region: 'Canada',
						language: 'en',
					})
					const mapOptions = {
						center: {
							lat: this.googleMapCenter.lat * 1,
							lng: this.googleMapCenter.lng * 1
						}, //中心点
						zoom: this.zoom, //缩放级别
						...this.mapOptions, //其他配置
					}
					loader.load().then((google) => {
							const map = new google.maps.Map(document.getElementById('googleMaps'), mapOptions)
							this.googleMaps = map
							this.googleApis = google
							// this.selectPoint()
							if (this.startLonLat) {
								var list = this.startLonLat.split(',')
								
								this.markers.push(
									new this.googleApis.maps.Marker({
										map: this.googleMaps,
										position: {
											lat:  parseFloat(list[0]),
											lng: parseFloat(list[1])
										},
										draggable: false,
									})
								)
							}
							if (this.endLonLat) {
								var list = this.endLonLat.split(',')
								this.markers.push(
									new this.googleApis.maps.Marker({
										map: this.googleMaps,
										position: {
											lat: parseFloat(list[0]),
											lng: parseFloat(list[1])
										},
										draggable: false,
									})
								)
							}
							console.log(this.markers,'--------')
							console.log(this.googleMaps, '谷歌地图实例')
							console.log(this.googleApis, '谷歌地图api')
							let drawingModesList = {
								MARKER: this.googleApis.maps.drawing.OverlayType.MARKER, //标记点
							}
							const drawingManager = new this.googleApis.maps.drawing.DrawingManager({
								drawingControl: true,
								drawingControlOptions: {
									position: this.googleApis.maps.ControlPosition.TOP_CENTER,
									drawingModes: [drawingModesList[this
									.mapType]], //这是个数组，因为我只需要多边形的就只传了一个
								},
								polygonOptions: {
									fillColor: 'blue',
									strokeColor: 'blue',
									strokeOpacity: 0.8,
									fillOpacity: 0.4,
									strokeWeight: 5,
									clickable: false,
									editable: true,
									zIndex: 1,
								},
							})
							drawingManager.setMap(map)
						})
						.catch((e) => {
							// do something
							console.log(e)
						})
				})
			},
			close() {
				this.$refs.popup.close()
			},
			queding() {
				if (this.typex == 1) {
					this.startLonLat = this.longlat
				} else {
					this.endLonLat = this.longlat
				}
				this.loadx()
				this.$refs.popup.close()
			},
			dakaiDitus() {
				this.$refs.popups.open('center')
			},
			shiyong() {
				this.startAddress = this.detail.startAddress
				this.endAddress = this.detail.endAddress
				this.startLonLat = this.detail.startLonLat
				this.endLonLat = this.detail.endLonLat
			},
			writetoList() {
				uni.redirectTo({
					url: '/pages/index/WritetoList/WritetoList'
				})
			},
			bindPickerChange1(e) {
				this.shiIndex = e.detail.value
			},
			bindPickerChange2(e) {
				this.fenIndex = e.detail.value
			},
			bindPickerChange3(e) {
				this.shiIndexs = e.detail.value
			},
			bindPickerChange4(e) {
				this.fenIndexs = e.detail.value
			},
			bindPickerChangess(e) {
				this.state = e.detail.value
			},
			bindPickerChanges(e) {
				this.index = e.detail.value
			},
			bindPickerChangex(e) {
				this.indexs = e.detail.value
			},
			loads() {
				this.$httpapi('project/getCityList', 'POST', {}).then(res => {
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
					this.listCity = res.data
				})
				this.$httpapi('api/dictData/', 'POST', {
					type: 'tb_route_state'
				}).then(res => {
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
					this.list = res.data
				})
				this.$httpapi('project/getLastRoute', 'POST', {
					customerId: uni.getStorageSync('customerId'),
					type: this.type
				}).then(res => {
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
					// this.listCity = res.data
					this.detail = res.data
				})
				this.$httpapi('project/getTbCustomerRoute', 'POST', {
					routeId:this.id
				}).then(res => {
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
					this.comment = res.data.comment
					this.attention = res.data.attention
					this.endLonLat = res.data.endLonLat
					this.startLonLat = res.data.startLonLat
					this.startAddress = res.data.startAddress
					this.endAddress = res.data.endAddress
					var list = res.data.startTime.split(" ")
					this.date = list[0]
					var lists = list[1].split(":")
					for(let i=0;i<this.shiList.length;i++){
						if(lists[0]==this.shiList[i]){
							this.shiIndex = i
						}
					}
					for(let i=0;i<this.fenList.length;i++){
						if(lists[1]==this.fenList[i]){
							this.fenIndex = i
						}
					}
					this.loadx()
					console.log(res.data.startTime.split(" "),lists,'-------------切割---------')
				})
			},
			chuangjian() {
				if(!this.date){
					this.date='2024-12-12'
				}
				this.$httpapi('project/addTbCustomerRoute', 'POST', {
					customerId:uni.getStorageSync('customerId'),
					type: this.type,
					state: this.list[this.state].value,
					startLonLat: this.startLonLat,
					endLonLat: this.endLonLat,
					startTime: this.date + ' ' + this.shiList[this.shiIndex] + ':' + this.fenList[this.fenIndex],
					endTime: this.date + ' ' + this.shiList[this.shiIndexs] + ':' + this.fenList[this.fenIndexs],
					startAddress: this.startAddress,
					endAddress: this.endAddress,
					attention: this.attention,
					comment: this.comment,
					price: this.detail.price
				}).then(res => {
					// uni.navigateBack()
					if(res.code=='200'){
						uni.navigateBack()
					}else{
						alert('入力された情報を確認してください!')
					}
				})
			},
			qiehuan(type) {
				this.types = type
			},
			personal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation'
				})
			},

			clickGmap(e) {
				this.longlat = e.latLng.lat() + ',' + e.latLng.lng()

				console.log(e, this.longlat, '----------当前标点信息')
				this.$emit('setLongLat', this.longlat)

				this.addDraggableMarkers(1, false, {
					lat: e.latLng.lat(),
					lng: e.latLng.lng()
				})
			},
			addDraggableMarkers(max, draggable, {
				lat = 0,
				lng = 0
			}) {
				if (max != -1) {
					this.marker.forEach((marker) => {
						marker.setMap(null)
					})
					this.marker = []
				}
				this.marker.push(
					new this.googleApi.maps.Marker({
						map: this.googleMap,
						position: {
							lat: lat,
							lng: lng
						},
						draggable: draggable,
					})
				)
				console.log(this.marker,'--------')
			},
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #F6F6F6;
	}

	.map {
		width: 63.24rem;
		height: 47.431rem;
	}

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			width:21.661rem;
			height: 4.427rem;
			border-radius: 1.264rem 1.264rem 1.264rem 1.264rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size:  1.581rem;
			color: #F44870;
			line-height: 4.427rem;
			text-align: center;
			margin: 2.055rem auto 0;
			cursor: pointer;
		}

		.boxs {
			width: 3.794rem;
			height: 3.083rem;
			border-radius: 7px;
			border: 1px solid #707070;
			align-items: center;
			padding: 0 0.79rem;
		}

		.buttonss {
			width: 1 1.581rem;
			height:  3.162rem;
			background: #F44870;
			border: 1px solid #F44870;
			border-radius: 1.423rem;
			font-size:  1.739rem;
			color: #FFFFFF;
			line-height:  3.162rem;
			text-align: center;
			margin: 0 0 0  1.581rem;
			cursor: pointer;
		}

		.buttonsx {
			width: 1 1.581rem;
			height:  3.162rem;
			border-radius: 1.423rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size:  1.739rem;
			color: #F44870;
			line-height:  3.162rem;
			text-align: center;
			cursor: pointer;
		}
	}
</style>