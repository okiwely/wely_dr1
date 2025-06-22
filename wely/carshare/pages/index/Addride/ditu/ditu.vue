<template>
	<div class="content">
		<input v-if="mapType == 'selectPoint'" id="pac-input" class="controls" type="text" :placeholder="L('请输入关键字')" />
		<div :style="googleMapStyle" class="googleMap" :id="mapID"></div>
	</div>
</template>

<script>
	import {
		Loader
	} from '@googlemaps/js-api-loader' //引入
	export default {

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
			//谷歌地图样式
			googleMapStyle: {
				type: Object,
				default: () => {
					return {
						wdith: '100%',
						height: '500px',
					}
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
					return 8
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
				//地图选点回显值
				longlat: this.googleMapCenter.lng + ',' + this.googleMapCenter.lat,
				//标记点
				marker: [],
				//图形实例
				graphicalExample: null,
				//图形路径经纬度
				graphicalPath: [],
				apiKey: 'AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk'
			}
		},
		onLoad() {
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
						this.selectPoint()
						this.addDraggableMarkers(1, true, this.googleMapCenter)

						this.googleMap.addListener('click', (e) => {
							this.clickGmap(e)
						})
						console.log(this.googleMap, '谷歌地图实例')
						console.log(this.googleApi, '谷歌地图api')
					})
					.catch((e) => {
						// do something
						console.log(e)
					})
			})
		},
		methods: {
			selectPoint() {
				const input = document.getElementById('pac-input')
				const searchBox = new this.googleApi.maps.places.SearchBox(input)
				const infoWindow = new this.googleApi.maps.InfoWindow()
				this.googleMap.controls[this.googleApi.maps.ControlPosition.TOP_LEFT].push(input)
				this.googleMap.addListener('click', (e) => {
					this.clickGmap(e)
				})
				this.googleMap.addListener('bounds_changed', () => {
					searchBox.setBounds(this.googleMap.getBounds())
					let markers = []
					searchBox.addListener('places_changed', () => {
						const places = searchBox.getPlaces()

						if (places.length == 0) {
							return
						}

						// Clear out the old markers.
						markers.forEach((marker) => {
							marker.setMap(null)
						})
						markers = []

						// For each place, get the icon, name and location.
						const bounds = new this.googleApi.maps.LatLngBounds()

						places.forEach((place) => {
							if (!place.geometry || !place.geometry.location) {
								console.log('Returned place contains no geometry')
								return
							}

							const icon = {
								url: place.icon,
								size: new this.googleApi.maps.Size(71, 71),
								origin: new this.googleApi.maps.Point(0, 0),
								anchor: new this.googleApi.maps.Point(17, 34),
								scaledSize: new this.googleApi.maps.Size(25, 25),
							}

							// Create a marker for each place.
							markers.push(
								new this.googleApi.maps.Marker({
									map: this.googleMap,
									icon,
									title: place.name,
									position: place.geometry.location,
									draggable: false,
								})
							)
							if (place.geometry.viewport) {
								// Only geocodes have viewport.
								bounds.union(place.geometry.viewport)
							} else {
								bounds.extend(place.geometry.location)
							}
						})
						this.googleMap.fitBounds(bounds)
					})
				})
			},

			clickGmap(e) {
				this.longlat = e.latLng.lat() + ',' + e.latLng.lng()
				this.$emit('setLongLat', this.longlat)
				console.log(e, this.longlat, '----------当前标点信息')
				this.addDraggableMarkers(1, true, {
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
				if (draggable) {
					this.marker[0].addListener('dragend', (e) => {
						this.updateMaker(e)
					})
				}
			},
		}
	}
</script>

<style lang="scss">
	.googleMap {
		width: 100%;
		height: 100vh;
	}
</style>