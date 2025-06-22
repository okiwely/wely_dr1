<template>
	<view>
		<view class="content">
			<headers ref="headers" canGoBack title='ドライブ詳細ページ' style="position: fixed;top:0;left:0;z-index: 1;">
			</headers>
			<view class='pc-only'>

				<view style="height: 7.905rem;"></view>
				<view
					style="font-weight: bold;font-size: 1.897rem;color: #000000;line-height:1.897rem;margin: 2.372rem auto 2.925rem;width:139.13rem;">
					<text @click="yilan" style="cursor: pointer;">ドライブ一覧ページ</text> >> <text
						style="color: #FF3D66;">ドライブ詳細ページ</text>
				</view>
				<view class="flex" style="margin:0 auto  2.372rem;width:139.13rem;">
					<view style="width:104.98rem;margin:0  3.162rem 0 0;">
						<view
							style="padding:0 1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view class="flex"
								style="align-items: center;font-weight: bold;font-size: 1.897rem;padding: 1.581rem 0;">
								<view>{{detail.startAddress}}</view>
								<image style="width:5.059rem;height:0.79rem;margin:0  1.581rem;"
									src="/static/images/gdd.png">
								</image>
								<view>{{detail.endAddress}}</view>
							</view>
							<div style="width:101.186rem;height:29.407rem;" id="googleMaps"></div>
							<!-- <map style="width:101.186rem;height:29.407rem;" :latitude="35.9593" :longitude="139.6344"></map> -->
							<view class="flex"
								style="font-size: 1.423rem;height:5.217rem;align-items: center;border-bottom:2rpx solid #F0F0F0;">
								<view style="width:8.538rem;color: #666666;" class="flexJusp">
									<text>出</text>
									<text>発</text>
									<text>地</text>
								</view>
								<view style="margin-left:6.324rem;">{{detail.startAddress}}</view>
							</view>
							<view class="flex"
								style="font-size: 1.423rem;height:5.217rem;align-items: center;border-bottom:2rpx solid #F0F0F0;">
								<view style="width:8.538rem;color: #666666;" class="flexJusp">
									<text>目</text>
									<text>的</text>
									<text>地</text>
								</view>
								<view style="margin-left:6.324rem;">{{detail.endAddress}}</view>
							</view>
							<view class="flex"
								style="font-size: 1.423rem;height:5.217rem;align-items: center;border-bottom:2rpx solid #F0F0F0;">
								<view style="width:8.538rem;color: #666666;" class="flexJusp">
									<text>出</text>
									<text>発</text>
									<text>日</text>
									<text>時</text>
								</view>
								<view style="margin-left:6.324rem;">{{detail.startTime && detail.startTime.slice(0, 16)}}</view>
							</view>
							<!-- 	<view class="flex" style="font-size: 1.423rem;height:5.217rem;align-items: center;">
										<view style="width:8.538rem;color: #666666;" class="flexJusp">
											<text>到</text>
											<text>着</text>
											<text>予</text>
											<text>定</text>
											<text>日</text>
											<text>時</text>
										</view>
										<view style="margin-left:6.324rem;">{{detail.endTime.slice(0, 16)}}</view>
									</view> -->
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="align-items: center;font-weight: bold;font-size: 1.897rem;">料金詳細</view>
							<!-- <view id="allmap"></view> -->
							<view class="flex"
								style="align-items: center;font-size:1.423rem;margin:2.055rem 0  1.581rem;">
								<image style="width: 1.739rem;height: 1.739rem;" src="/static/images/q.png"></image>
								<view style="margin-left:0.79rem;">{{detail.startAddress}}</view>
								<view style="border-top:2rpx dashed red;width: 7.905rem;margin:0 1.897rem;"></view>
								<image style="width: 1.739rem;height: 1.739rem;" src="/static/images/w.png"></image>
								<view style="margin-left:0.79rem;">{{detail.endAddress}}</view>
							</view>
							<view style="overflow: hidden;border-radius: 0.948rem;width: 49.486rem;">
								<view class="flex"
									style="width: 49.486rem;height: 3.952rem;background: #F44870;align-items: center;text-align: center;font-size: 1.423rem;color: #FFFFFF;">
									<view style="width:50%;">同乗人数</view>
									<view style="width:50%;">支払い金額/人</view>
								</view>
								<view v-for="(item,index) in detail.details" :key="index" class="flex"
									style="width: 49.486rem;height: 3.952rem;align-items: center;text-align: center;font-size: 2.055rem;"
									:style="(index+1)%2==0?'background:#FFF;':'background:#F7F7F7'">
									<view style="width:50%;">{{item.total}}</view>
									<view style="width:50%;">￥{{Math.floor(item.price)}}</view>
								</view>
							</view>
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin-bottom: 1.581rem;">
								事前確認事項
							</view>
							<view class="flex" style="font-size:1.423rem;align-items: center;">
								<image style="width:1.107rem;height:1.107rem;margin-right:6px;"
									src="/static/images/gantan.png">
								</image>
								<view>{{detail.attention}}</view>
							</view>
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;">
							<view
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin-bottom:2.213rem;">
								ドライプ詳細</view>
							<view class="flex"
								style="padding:1.423rem;font-size:1.423rem;border: 1px solid #E3E3E3;border-radius: 0.948rem ;">
								<image style="width:16.126rem;height:17.708rem;margin-right:1.265rem;"
									src="/static/images/6i.png"></image>
								<view style="width:80.949rem;">
									<view class="flex" style="align-items: center;padding:0 1.264rem 1.423rem;">
										<view style="width:13.281rem;color: #666666;">車両情報</view>
										<view>{{detail.car.info}}</view>
									</view>
									<view class="flex"
										style="height:3.794rem;align-items: center;padding:0 1.264rem;background-color: #F7F7F7;border-radius:6px;">
										<view style="width:13.281rem;color: #666666;">ガソリンタイプ</view>
										<view>{{detail.car.gasoline}}</view>
									</view>
									<view class="flex" style="height:3.794rem;align-items: center;padding:0 1.264rem;">
										<view style="width:13.281rem;color: #666666;">排気量</view>
										<view>{{detail.car.carCc}}</view>
									</view>
									<view class="flex"
										style="height:3.794rem;align-items: center;padding:0 1.264rem;background-color: #F7F7F7;border-radius:6px;">
										<view style="width:13.281rem;color: #666666;">乗車可能人数</view>
										<view>{{detail.car.total}}人</view>
									</view>
									<view class="flex" style="align-items: center;padding:1.265rem 1.264rem 0;">
										<view style="width:13.281rem;color: #666666;">高速利用</view>
										<view>{{detail.car.isEtc}}</view>
									</view>
								</view>
							</view>
							<view style="text-align: right;margin:1.423rem 0 0.948rem;font-size:2.213rem;">
								<!-- {{detail.createTime}} -->
								{{  new Date(detail.createTime).toLocaleString('zh-CN', { timeZone: 'Asia/Tokyo' }) }}
							</view>
							<view style="text-align: right;font-size: 1.264rem;color: #666666;">ドライプ登録日</view>
						</view>
					</view>
					<view style="width:30.988rem;">
						<view
							style="width:27.194rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding:1.897rem">
							<view class="flexJusp">
								<view style="font-size:  1.581rem;color: #666666;">
									<view>募集金額</view>
									<view>(1人あたり)</view>
								</view>
								<view style="font-size:  2.372rem;margin-top:1.265rem;">{{Math.floor(detail.price)}}
								</view>
							</view>
							<view class="flexJusp" style="margin:3.952rem 0 3.004rem;">
								<view style="margin-top:1.265rem;font-size:  1.581rem;color: #666666;">同乗人数</view>
								<view style="font-size:  2.372rem;">{{detail.alreadyTotal}}/{{detail.total}}</view>
							</view>
							<view v-show='detail.customerId!=customerId' class="buttons" @click="jiaru(detail)">リクエスト送信
							</view>
						</view>

						<view
							style="width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem  1.581rem 1.897rem;margin-top:2.213rem;">
							<view style="font-weight: bold;font-size:  1.739rem;margin-bottom: 1.581rem;">ドライバー</view>
							<view class="flex">
								<view style="margin-right:0.949rem;position: relative;" @click='topersonal(detail)'>
									<image style="width:8.221rem;height:8.221rem;border-radius:50%;"
										:src="detail.avatar">
									</image>
									<image
										style="width: 1.739rem;height: 1.739rem;position: absolute;bottom:0;right:13px;"
										src="/static/images/nv.png"></image>
								</view>
								<view>
									<view
										style="font-weight: bold;font-size:  1.739rem;color: #000000;padding:0.79rem 0  2.529rem;">
										{{detail.name}}
									</view>
									<!-- <view style="font-size: 1.423rem;color: #666666;">本人確認書類提出済み</view> -->
								</view>
							</view>
							<view
								style="border-top:1px solid #F0F0F0;border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;margin: 1.581rem 0 1.897rem;align-items: center;"
								class="flexJusp">
								<view>本人確認書類確認済み</view>
								<image v-if="detail.isAuth==1" style="width: 1.581rem;height:1.107rem;"
									src="/static/images/re.png"></image>
							</view>
						</view>
					</view>
				</view>
				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height: 18.69rem;"></view>
				<!-- <view
					style="font-weight: bold;font-size: 1.897rem;color: #000000;line-height:1.897rem;margin: 2.372rem auto 2.925rem;width:139.13rem;">
					<text @click="yilan" style="cursor: pointer;">ドライブ一覧ページ</text> >> <text
						style="color: #FF3D66;">ドライブ詳細ページ</text>
				</view> -->
				<view class="flex" style="margin:0 auto  2.372rem;width:139.13rem;">
					<view style="width:100vw;margin:0  3.162rem 0 0;">
						<view
							style="background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view class="flex"
								style="align-items: center;font-weight: bold;font-size: 3.18rem;padding: 1.581rem 1rem;">
								<view>{{detail.startAddress}}</view>
								<image style="width:7.95rem;height:1.34rem;margin:0  1.581rem;"
									src="/static/images/gdd.png">
								</image>
								<view>{{detail.endAddress}}</view>
							</view>
							<div style="width:100vw;height:40.91rem;" id="googleMapsMB"></div>
							<!-- <map style="width:101.186rem;height:29.407rem;" :latitude="35.9593" :longitude="139.6344"></map> -->
							<view class="flex"
								style="align-items: center;border-bottom:2rpx solid #F0F0F0;padding:2.2rem">
								<view style="width:8.538rem;color: #666666;" class="flexJusp login_h1">
									<text>出</text>
									<text>発</text>
									<text>地</text>
								</view>
								<view style="margin-left:6.324rem;font-size: 2.95rem;">{{detail.startAddress}}</view>
							</view>
							<view class="flex"
								style="align-items: center;border-bottom:2rpx solid #F0F0F0;padding:2.2rem">
								<view style="width:8.538rem;color: #666666;" class="flexJusp login_h1">
									<text>目</text>
									<text>的</text>
									<text>地</text>
								</view>
								<view style="margin-left:6.324rem;font-size: 2.95rem;">{{detail.endAddress}}</view>
							</view>
							<view class="flex"
								style="font-size: 1.423rem;height:5.217rem;align-items: center;border-bottom:2rpx solid #F0F0F0;padding:2.2rem">
								<view style="width:8.538rem;color: #666666;" class="flexJusp login_h1">
									<text>出</text>
									<text>発</text>
									<text>日</text>
									<text>時</text>
								</view>
								<view style="margin-left:6.324rem;font-size: 2.95rem;">{{detail.startTime && detail.startTime.slice(0, 16)}}
								</view>
							</view>
							<!-- 	<view class="flex" style="font-size: 1.423rem;height:5.217rem;align-items: center;">
										<view style="width:8.538rem;color: #666666;" class="flexJusp">
											<text>到</text>
											<text>着</text>
											<text>予</text>
											<text>定</text>
											<text>日</text>
											<text>時</text>
										</view>
										<view style="margin-left:6.324rem;">{{detail.endTime.slice(0, 16)}}</view>
									</view> -->
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="align-items: center;font-weight: bold;font-size: 3.18rem;">料金詳細</view>
							<!-- <view id="allmap"></view> -->
							<view class="flex"
								style="align-items: center;font-size:2.95rem;margin:2.055rem 0  1.581rem;">
								<!-- 	<image style="width: 1.739rem;height: 1.739rem;" src="/static/images/q.png"></image> -->
								<view style="margin-left:0.79rem;">{{detail.startAddress}}</view>
								<view style="border-top:2rpx dashed red;width: 7.905rem;margin:0 1.897rem;"></view>
								<!-- <image style="width: 1.739rem;height: 1.739rem;" src="/static/images/w.png"></image> -->
								<view style="margin-left:0.79rem;">{{detail.endAddress}}</view>
							</view>
							<view style="overflow: hidden;border-radius: 0.948rem;width:100vw">
								<view class="flex"
									style="width:  calc(100vw - 3.78rem);height: 7.5rem;background: #F44870;align-items: center;text-align: center;font-size: 2.95rem;color: #FFFFFF;">
									<view style="width:50%;">同乗人数</view>
									<view style="width:50%;">支払い金額/人</view>
								</view>
								<view v-for="(item,index) in detail.details" :key="index" class="flex"
									style="width: calc(100vw - 3.78rem);height: 7.5rem;align-items: center;text-align: center;font-size: 3.18rem;"
									:style="(index+1)%2==0?'background:#FFF;':'background:#F7F7F7'">
									<view style="width:50%;">{{item.total}}</view>
									<view style="width:50%;">￥{{Math.floor(item.price)}}</view>
								</view>
							</view>
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin-bottom: 1.581rem;">
								事前確認事項
							</view>
							<view class="flex" style="font-size:1.423rem;align-items: center;">
								<image style="width:1.107rem;height:1.107rem;margin-right:6px;"
									src="/static/images/gantan.png">
								</image>
								<view>{{detail.attention}}</view>
							</view>
						</view>
						<view style="width:100vw;">
							<view
								style="width:100v;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding:1.897rem">
								<!-- <view class="flexJusp">
									<view style="font-size:  1.581rem;color: #666666;">
										<view>募集金額</view>
										<view>(1人あたり)</view>
									</view>
									<view style="font-size:  2.372rem;margin-top:1.265rem;">{{Math.floor(detail.price)}}
									</view>
								</view>
								<view class="flexJusp" style="margin:3.952rem 0 3.004rem;">
									<view style="margin-top:1.265rem;font-size:  1.581rem;color: #666666;">同乗人数</view>
									<view style="font-size:  2.372rem;">{{detail.alreadyTotal}}/{{detail.total}}</view>
								</view> -->
								<view class="flexJusp"
									style=";padding-top:1.818rem;margin-top: 1.581rem;margin-bottom:4.09rem">
									<view class='price_num'>
										<view style="color: #000000;margin-top:1.897rem">
											￥{{Math.floor(detail.price/detail.total)}}-
											￥{{Math.floor(detail.price)}}
										</view>

										<view style="color: #666666;">1人あたり募集金額</view>
									</view>
									<view class='price_num'>
										<view style="color: #000000;margin-top:1.897rem">
											{{detail.alreadyTotal}}/{{detail.total}}
										</view>
										<view style="color: #666666;">同乗人数</view>

									</view>
								</view>
								<view v-show='detail.customerId!=customerId' class="buttons"
									style='font-size: 3.18rem;width: 67.95rem;height: 8.64rem;line-height: 8.64rem;border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;'
									@click="jiaru(detail)">リクエスト送信
								</view>
							</view>

							<view
								style="width: 100vw;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem  1.581rem 1.897rem;margin-top:2.213rem;margin-bottom:3.18rem">
								<view style="font-weight: bold;font-size:  3.18rem;margin-bottom: 1.581rem;">ドライバー
								</view>
								<view class="flex">
									<view style="margin-right:2.27rem;position: relative;" @click='topersonal(detail)'>
										<image style="width:11.14rem;height:11.14rem;border-radius:50%;"
											:src="detail.avatar">
										</image>
										<image
											style="width: 1.739rem;height: 1.739rem;position: absolute;bottom:0;right:13px;"
											src="/static/images/nv.png"></image>
									</view>
									<view>
										<view
											style="font-weight: bold;font-size:  3.18rem;color: #000000;padding:0.79rem 0  2.529rem;">
											{{detail.name}}
										</view>
										<!-- <view style="font-size: 1.423rem;color: #666666;">本人確認書類提出済み</view> -->
									</view>
								</view>
								<view
									style="border-top:1px solid #F0F0F0;border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;margin: 1.581rem 0 1.897rem;align-items: center;"
									class="flexJusp">
									<view style='font-size: 2.95rem;'>本人確認書類確認済み</view>
									<image v-if="detail.isAuth==1" style="width: 1.581rem;height:1.107rem;"
										src="/static/images/re.png"></image>
								</view>
							</view>
						</view>
						<view
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;">
							<view
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin-bottom:2.213rem;">
								ドライプ詳細</view>
							<view class="flex"
								style="padding:0.5rem;font-size:2.25rem;border: 1px solid #E3E3E3;border-radius: 0.948rem ;">
								<image style="width:16.126rem;height:17.708rem;margin-right:1.265rem;"
									src="/static/images/6i.png"></image>
								<view style="width:61.82rem;">
									<view class="flex" style="align-items: center;padding:0 1.264rem 1.423rem;">
										<view style="width:20.23rem;color: #666666;">車両情報</view>
										<view>{{detail.car.info}}</view>
									</view>
									<view class="flex"
										style="height:3.794rem;align-items: center;padding:0 1.264rem;background-color: #F7F7F7;border-radius:6px;">
										<view style="width:20.23rem;color: #666666;">ガソリンタイプ</view>
										<view>{{detail.car.gasoline}}</view>
									</view>
									<view class="flex" style="height:3.794rem;align-items: center;padding:0 1.264rem;">
										<view style="width:20.23rem;color: #666666;">排気量</view>
										<view>{{detail.car.carCc}}</view>
									</view>
									<view class="flex"
										style="height:3.794rem;align-items: center;padding:0 1.264rem;background-color: #F7F7F7;border-radius:6px;">
										<view style="width:20.23rem;color: #666666;">乗車可能人数</view>
										<view>{{detail.car.total}}人</view>
									</view>
									<view class="flex" style="align-items: center;padding:1.265rem 1.264rem 0;">
										<view style="width:20.23rem;color: #666666;">高速利用</view>
										<view>{{detail.car.isEtc}}</view>
									</view>
								</view>
							</view>
							<view style="text-align: right;margin:1.423rem 0 0.948rem;font-size:3.18rem;">
								<!-- {{detail.createTime}} -->
								{{ new Date(detail.createTime).toLocaleString('zh-CN', { timeZone: 'Asia/Tokyo' })}}
							</view>
							<view style="text-align: right;font-size: 2.2rem;color: #666666;">ドライプ登録日</view>
						</view>
					</view>

				</view>
				<view style="height:58.41rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				


			</view>
<toast ref="toast"></toast>
		</view>
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
				customerId: uni.getStorageSync('customerId'),
				id: '',
				detail: {},
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
			}
		},
		onLoad(option) {
			this.id = option.id
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			yilan() {
				uni.redirectTo({
					url: '/pages/index/IndexLise/IndexLise'
				})
			},

			jiaru(item) {
				if (!uni.getStorageSync('customerId')) {
					uni.navigateTo({
						url: '/pages/login/login'
					})
					return
				}
				if (uni.getStorageSync('isAuth') == 0) {
					uni.navigateTo({
						url: '/pages/index/briefIntroductionTop/briefIntroductionTop?id=' + uni.getStorageSync(
							'customerId')
					})
					return
				}

				this.$httpapi('project/addTbCustomerChat', 'POST', {
					customerId: uni.getStorageSync('customerId'),
					subId: item.customerId,
					routeId: item.id
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});

					} else {
						this.$refs.toast.show({
							message: 'リクエスト送信成功',
							duration: 2000
						});
					}
				})
			},
			loads() {
				this.$httpapi('project/getTbCustomerRouteS', 'POST', {
					routeId: this.id,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.detail = res.data
					this.loadx()
				})
			},
			isMobileDevice() {
				return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
			},
			loadx() {
				this.$nextTick(() => {
					const loader = new Loader({
						apiKey: this.apiKey,
						version: 'weekly',
						libraries: ['places'],
						region: 'Japan',
						language: 'jp',
					});

					// 解析起点和终点的经纬度
					let startLat, startLng, endLat, endLng;
					if (this.detail.startLonLat) {
						const startCoords = this.detail.startLonLat.split(',');
						startLng = parseFloat(startCoords[0].trim());
						startLat = parseFloat(startCoords[1].trim());
					}

					if (this.detail.endLonLat) {
						const endCoords = this.detail.endLonLat.split(',');
						endLng = parseFloat(endCoords[0].trim());
						endLat = parseFloat(endCoords[1].trim());
					}

					// 设置地图中心为起点
					const mapOptions = {
						center: {
							lat: startLat || this.googleMapCenter.lat,
							lng: startLng || this.googleMapCenter.lng,
						},
						zoom: this.zoom,
						...this.mapOptions,
					};

					loader.load().then((google) => {
						let map
						if (this.isMobileDevice()) {
							map = new google.maps.Map(document.getElementById('googleMapsMB'), mapOptions);
						} else {
							map = new google.maps.Map(document.getElementById('googleMaps'), mapOptions);
						}

						this.googleMaps = map;
						this.googleApis = google;

						// 添加起点标记
						if (this.detail.startLonLat && !isNaN(startLat) && !isNaN(startLng)) {
							this.markers.push(
								new this.googleApis.maps.Marker({
									map: this.googleMaps,
									position: {
										lat: startLat,
										lng: startLng
									},
									draggable: false,
									label: '起点',
								})
							);
						} else {
							console.error("Invalid start location coordinates");
						}

						// 添加终点标记
						if (this.detail.endLonLat && !isNaN(endLat) && !isNaN(endLng)) {
							this.markers.push(
								new this.googleApis.maps.Marker({
									map: this.googleMaps,
									position: {
										lat: endLat,
										lng: endLng
									},
									draggable: false,
									label: '终点',
								})
							);
						} else {
							console.error("Invalid end location coordinates");
						}

						// **添加路线绘制**
						if (startLat && startLng && endLat && endLng) {
							// 创建 DirectionsService 和 DirectionsRenderer 实例
							const directionsService = new google.maps.DirectionsService();
							const directionsRenderer = new google.maps.DirectionsRenderer();

							directionsRenderer.setMap(this.googleMaps);

							// 设置路线请求参数
							const request = {
								origin: {
									lat: startLat,
									lng: startLng
								},
								destination: {
									lat: endLat,
									lng: endLng
								},
								travelMode: google.maps.TravelMode.DRIVING, // 驾车模式
							};

							// 计算并绘制路线
							directionsService.route(request, (result, status) => {
								if (status === google.maps.DirectionsStatus.OK) {
									directionsRenderer.setDirections(result);
								} else {
									console.error('Directions request failed due to ' + status);
								}
							});
						} else {
							console.error("Start or End location is missing.");
						}

					}).catch((e) => {
						console.log('Google Maps API 加载失败:', e);
					});
				});
			},
			topersonal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation?id=' + item.customerId
				})
			},
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #F6F6F6;
	}

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			width: 24.664rem;
			height: 4.743rem;
			background: #F44870;
			border-radius: 1.106rem;
			font-size: 1.581rem;
			color: #FFFFFF;
			line-height: 4.743rem;
			text-align: center;
			margin: auto;
			cursor: pointer;
		}
	}
</style>