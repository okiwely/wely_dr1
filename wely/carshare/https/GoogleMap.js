import { Loader } from "@googlemaps/js-api-loader"
 
export default {
  data() {
    return {
      map: '',
      // 位置格式 {address: '', latitude: '', longitude: ''}
      startPointObj: {}, // 开始位置信息
      endPointObj: {} // 结束位置信息
    };
  },
  methods: {
    async loadMap(latitude, longitude, domId = 'map') {
      // 引入Google Maps API
      const loader = new Loader({
        apiKey: "AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk",
        version: "weekly",
        libraries: ['places', 'geometry']
      });
      await loader.load().then(async () => {
        const { Map } = await google.maps.importLibrary("maps");
 
        this.map = new Map(document.getElementById(domId), {
          center: { lat: latitude || 39.909, lng: longitude || 116.39742 },
          zoom: 8,
          fullscreenControl: false,// 隐藏全屏控件
          streetViewControl: false, // 隐藏街景（小人）按钮
          mapTypeControl:false,
          minZoom: 2,
          maxZoom: 16,
          // //限制拖拽范围，防止出现除地图外的灰色区域
          // restriction: {
          //   latLngBounds: {
          //     north: 85,
          //     south: -85,
          //     east: 180,
          //     west: -180,
          //   },
          // }
        });
        // 尝试获取当前位置
        if (navigator.geolocation) {
          let that = this
          navigator.geolocation.getCurrentPosition(
            function(position) {
              let pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
              };
              // 设置地图中心为当前位置s
              that.map.setCenter(pos);
			  // 设置地图的缩放级别
			  that.map.setZoom(15); // 设置为你想要的缩放级别
			  
              // 添加当前位置的标记
              const marker = new google.maps.Marker({
                position: pos,
                map: that.map,
                title: '現在地',
              });
              // 搜索附近的 POI
              // that.searchPOI(pos)
            },
            function() {
              console.log('errorCallback')
              that.handleLocationError(true, that.map.getCenter());
            }
          );
        } else {
          // 浏览器不支持地理位置
          console.log('浏览器不支持地理位置')
          that.handleLocationError(false, that.map.getCenter());
        }
      }).catch((err) => {
        console.log('error:', err);
      });
    },
    handleLocationError(browserHasGeolocation, pos) {
      const infoWindow = new google.maps.InfoWindow({
        map: this.map,
        position: pos,
        content: browserHasGeolocation ?
          'Error: The Geolocation service failed.' :
          'Error: Your browser doesn\'t support geolocation.'
      });
    },
    // 搜索附近的poi
    searchPOI(pos) {
      const that = this
      let service = new google.maps.places.PlacesService(this.map);
      service.nearbySearch({
          location: pos,
          radius: 500, // 搜索半径，单位为米
          type: ['point_of_interest'] // 搜索类型为兴趣点
      }, function(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            if (results[0]) {
              that.startPointObj = {
                address: results[0].name,
                latitude: results[0]?.geometry?.location.lat(),
                longitude: results[0]?.geometry?.location.lng()
              }
            }
          }
      });
    },
    // 模糊查询地址
    getPlacesList(text) {
      return new Promise(async(resolve, reject) => {
        if (!text) resolve([])
        const autocomplete = new google.maps.places.AutocompleteService();
        autocomplete.getPlacePredictions({ input: text }, function(predictions, status) {
          if (status == google.maps.places.PlacesServiceStatus.OK) {
            resolve(predictions);
          } else {
            resolve([])
          }
        });
      });
    },
    // 根据PlaceId获取详细地址
    async getDetailByPlaceId(placeId) {
      return new Promise(async(resolve, reject) => {
        if (!placeId) resolve()
        if (!this.map) {
          await this.loadMap()
        }
        const request = {
          placeId: placeId,
          fields: ['geometry.location'],
        };
        await new google.maps.places.PlacesService(this.map)?.getDetails(request, (place, status) => {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            const location = place.geometry.location;
            resolve({
              latitude: location.lat(),
              longitude: location.lng()
            })
          } else {
            resolve()
            console.error('Place details request failed due to:', status);
          }
        });
      });
    },
    // 查询两个经纬度之间的距离，返回单位km
    calculateDistance(start, end) {
      if (!start || !end) {
        return ''
      }
      const latLngA = new google.maps.LatLng(start.latitude, start.longitude); // 替换为第一个经纬度
      const latLngB = new google.maps.LatLng(end.latitude, end.longitude); // 替换为第二个经纬度
 
      const distance = google.maps.geometry.spherical.computeDistanceBetween(latLngA, latLngB);
 
      return (distance / 1000).toFixed(2);
      // // 将距离从米转换为公里
      // this.distance = 
    },
	  // 显示起点和终点的轨迹路线和距离
	  showRoute(startLatLng, endLatLng,startAddress,endAddress) {
		var dueArrive = ''
		const directionsService = new google.maps.DirectionsService();
		const directionsRenderer = new google.maps.DirectionsRenderer({
		  map: this.map, // 使用你的地图实例
		  suppressMarkers: true ,// 如果你不想显示默认的标记，设置为true
		  polylineOptions: {
		    strokeColor: '#2FD4B8', // 设置路线颜色
		    strokeOpacity: 1.0, // 设置路线透明度
		    strokeWeight: 8 // 设置路线宽度
		  }
		});
 
		const request = {
		  origin: startLatLng, // 起点的经纬度
		  destination: endLatLng, // 终点的经纬度
		  travelMode: google.maps.TravelMode.DRIVING // 旅行模式，可以是DRIVING, WALKING, BICYCLING等
		};
		
		const startMarker = new google.maps.Marker({
		  position: startLatLng, // 起点的经纬度
		  map: this.map, // 使用你的地图实例
		  title: '出発地',
		  // 如果需要自定义图标，可以添加以下属性
		  icon: {
		    url: '../static/position.png',
		    scaledSize: new google.maps.Size(40, 40), // 图标的大小
		    origin: new google.maps.Point(0, 0), // 图标中心的偏移量
		    anchor: new google.maps.Point(20, 40) // 图标的锚点，通常是图标中心
		  }
		});
		
		const endMarker = new google.maps.Marker({
		  position: endLatLng, // 终点的经纬度
		  map: this.map, // 使用你的地图实例
		  title: '目的地',
		  // 如果需要自定义图标，可以添加以下属性
		  icon: {
		    url: '../static/position.png',
		    scaledSize: new google.maps.Size(40, 40), // 图标的大小
		    origin: new google.maps.Point(0, 0), // 图标中心的偏移量
		    anchor: new google.maps.Point(20, 40) // 图标的锚点，通常是图标中心
		  }
		});
 
		directionsService.route(request, (result, status) => {
		  if (status === google.maps.DirectionsStatus.OK) {
			directionsRenderer.setDirections(result);
			// 获取距离和持续时间
			const route = result.routes[0];
			const leg = route.legs[0];
			const distance = leg.distance.text;
			const duration = leg.duration.text;
			dueArrive = `距離: ${distance}, 到着予定時間:${duration}`
			const now = new Date();
			const times = now.getTime() + (parseInt(duration) + 1) * 60 * 1000
			const formattedTime = this.convertTimestampToTime(times)
 
			// 创建起点的信息窗口
			const startInfoWindow = new google.maps.InfoWindow({
			  content: `
			  <view class="startInfo">
			     <view class="top">出発地</view>
				 <view class="bottom">${startAddress}</view>
			  </view>`
			});
			
			// 创建终点的信息窗口
			const endInfoWindow = new google.maps.InfoWindow({
			  content: `
			  <view class="endInfo">
			     <view class="top">目的地
				  <span class="time">${formattedTime}到着</span>
				 </view>
				 <view class="bottom">${endAddress}</view>
			  </view>`
			});
			
			// 自动显示起点的信息窗口
			startInfoWindow.open(this.map, startMarker);
			
			// 自动显示终点的信息窗口
			endInfoWindow.open(this.map, endMarker);
		    // 创建新的信息窗口，位置在终点信息窗口下方
		    const newInfoWindow = new google.maps.InfoWindow({
			  content: `
			  <view class="routeInfo">
			     ${dueArrive}
			  </view>`
		    });
	
		    // 计算终点信息窗口下方的位置
		    const endInfoWindowPosition = endInfoWindow.getPosition();
			console.log(endInfoWindowPosition.lng())
		    const newInfoWindowPosition = new google.maps.LatLng(
			  endInfoWindowPosition.lat(),
			  endInfoWindowPosition.lng()
		    );
	
		    // 设置新信息窗口的位置
		    newInfoWindow.setPosition(newInfoWindowPosition);
		    // 打开新信息窗口
		    newInfoWindow.open(this.map);
			
		  } else {
			console.error(`无法获取路线信息: ${status}`);
		  }
		});
	  },
	  convertTimestampToTime(timestamp) {
		  // 创建一个新日期对象，使用时间戳（毫秒）
		  var date = new Date(timestamp);
 
		  // 获取小时和分钟
		  var hours = date.getHours();
		  var minutes = date.getMinutes();
 
		  // 格式化小时和分钟，确保总是两位数
		  hours = hours.toString().padStart(2, '0');
		  minutes = minutes.toString().padStart(2, '0');
 
		  // 返回格式化的时间字符串
		  return hours + ':' + minutes;
	  }
  }
};