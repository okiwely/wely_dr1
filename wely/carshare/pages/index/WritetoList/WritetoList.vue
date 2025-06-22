<template>
	<view>

		<view class="content">

			<headers ref="headers" title='ドライブ一覧' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>
				<Navigation :pageIndex="'2'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view style="margin: 2.372rem auto;width:104.98rem;">
					<view class="flex" style="margin-bottom:2.055rem;">
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(1)">
							<view :style="type==1?'font-size: 1.739rem;font-weight: bold;':'font-size: 1.581rem;'">
								これからのドライブ
							</view>
							<view v-if="type==1" class="xian"></view>
						</view>
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(2)">
							<view :style="type==2?'font-size: 1.739rem;font-weight: bold;':'font-size: 1.581rem;'">
								過去のドライブ
							</view>
							<view v-if="type==2" class="xian"></view>
						</view>
					</view>
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;width:104.98rem;">
						<view
							style="width: 26.798rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view class="flex">
								<image style="width: 10.869rem;height:10.869rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:1.107rem;">
									<view style="font-weight: bold;font-size: 1.897rem;color: #000000;">{{item.name}}
									</view>
									<view v-if="item.score!=0" class="flex"
										style="align-items: center;margin:0.949rem 0  1.581rem;">
										<image style="width: 1.739rem;height: 1.581rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 1.423rem;color: #F88400;margin:0 0.948rem 0 6px;">
											{{item.score}}
										</view>
										<view style="font-size:  1.581rem;color: #333333;">-1rating</view>
									</view>
									<view style="font-size: 1.264rem;color: #666666;">本人確認書類提出済み</view>
								</view>
							</view>
							<view class="flex"
								style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view style="width:2 2.372rem;">
									<view style="font-size: 1.423rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size: 1.213rem;color: #000000;margin-top:1.897rem">
										￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
								</view>
								<view>
									<view
										style="font-size: 1.423rem;color: #666666;margin-left:5.2rem;text-align: center;">
										同乗人数</view>
									<view
										style="font-size: 1.213rem;color: #000000;margin-top:1.897rem;margin-left:5.8rem">
										{{item.alreadyTotal}}/{{item.total}}
									</view>
								</view>
							</view>
						</view>
						<view
							style="width: 44.269rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view style="font-size: 2.055rem;color: #F44870;">{{item.startTime}}</view>
							<view class="flex"
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin:2.371rem 0 1.897rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:5.059rem;height:0.79rem;margin:0  1.581rem;"
									src="/static/images/gdd.png">
								</image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width: 41.502rem;height: 7.431rem;background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:1.897rem 0;">
								<view class="flex" style="margin:1.423rem 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">
										{{item.startAddress}}
									</view>
								</view>
								<view class="flex" style="margin:0 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.endAddress}}
									</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;">
								<!-- <view style="width:2.213rem;height:1.818rem;background-color:#F44870;"></view> -->
								<image style="width:2.055rem;height: 1.66rem;" src="/static/images/c.png"></image>
								<view style="font-size: 1.423rem;color: #000000;margin-left:0.79rem;">車:{{item.model}}
								</view>
							</view>
						</view>
						<view
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<!-- <view @click="details(item)" class="buttons"> 編集する</view> -->
							<view style='margin-top: 7rem;' @click="delects(item)" class="buttonx">削除する</view>
						</view>
					</view>
					<view class="buttonss" @click="addride">ドライブ登録</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
			<!-- 	<toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<Navigation :pageIndex="'2'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:19.229rem;"></view>
				<view style="margin: 2.372rem auto;width:calc(100vw - 4.74rem);">
					<view class="flex" style="margin-bottom:2.055rem;">
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(1)">
							<view class='list_h1' style='text-align: center;'>
								これからのドライブ
							</view>
							<view v-if="type==1" class="xian"></view>
						</view>
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(2)">
							<view class='list_h1' style='text-align: center;'>
								過去のドライブ
							</view>
							<view v-if="type==2" class="xian"></view>
						</view>
					</view>

					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="flex-direction:column;padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view
							style="width: calc(100vw - 10rem);height:18.18rem;border-radius:  1.581rem;padding: 2.5rem;">
							<view class="flex" @click='topersonal(item)'>
								<image style="width: 10.91rem;height:10.91rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:2.05rem;margin-top:-0.68rem">
									<view style="font-weight: bold;font-size: 3.81rem;color: #000000;">{{item.name}}
									</view>
									<view class="flex" style="align-items: center;margin:0.91rem 0 0.91rem 0;"
										v-if="item.score!=0">

										<image style="width:2.95rem;height:2.73rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 2.73rem;color: #F88400;">{{item.score}}</view>
										<view style="font-size: 2.73rem;color: #333333;">-1rating</view>
									</view>
									<view style='height:4.55rem' v-else>

									</view>
									<view v-if="item.isAuth==1" style="font-size:2.73rem;color: #666666;">本人確認書類提出済み
									</view>
								</view>
								<view style='flex:1'></view>
								<view style="font-size: 3.18rem;color: #F44870;margin-right:2.27rem">{{item.startTime}}
								</view>
							</view>
							<view
								style='height:0px;border: 0.11rem solid rgba(0,0,0,0.08);;width:calc(100vw - 10rem);margin:2.27rem auto'>

							</view>

						</view>
						<view
							style="width:calc(100vw - 10rem);margin-top:-4rem;border-radius:  1.581rem;padding: 1.581rem;">

							<view class="flex"
								style="align-items: center;font-weight: bold;font-size:3.18rem;margin:2.529rem 0 2.055rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:7.95rem;height:1.34rem;margin:0 5.36rem;"
									src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width:calc(100vw - 15.89rem);background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:0 auto;padding:2.27rem 2.73rem">
								<view class="flex" style='margin-bottom:3.41rem'>
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">起</view> -->
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">
										{{item.startAddress}}</view>
								</view>
								<view class="flex">
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">終</view> -->
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">{{item.endAddress}}
									</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;margin-top:1.59rem">
								<image style="width:3.86rem;height:3.18rem;" src="/static/images/c.png"></image>
								<view class="yihang"
									style="font-size: 2.95rem;color: #000000;margin-left:0.79rem;width:40rem;">
									車:{{item.model}}</view>
							</view>

						</view>
						<view class="flexJusp"
							style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
							<view class='price_num'>
								<view style="color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} -
									{{Math.floor(item.maxPrice)}}
								</view>

								<view style="color: #666666;">1人あたり募集金額</view>
							</view>
							<view class='price_num'>
								<view style="color: #000000;margin-top:1.897rem">
									{{item.alreadyTotal}}/{{item.total}}
								</view>
								<view style="color: #666666;">同乗人数</view>

							</view>
						</view>
						<view
							style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<!-- 	<view @click="details(item)" class='detail'>詳細</view>
								<view @click="jiaru(item)" class='send' >リクエスト送信</view> -->
							<view @click="delects(item)" class="detail" style='margin:0 auto;width: 55.23rem;'>削除する
							</view>
						</view>
					</view>

					<view class="buttonss" @click="addride">ドライブ登録</view>
				</view>
				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				


			</view>
         <toast ref="toast"></toast>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				info: '',
				type: 1,
				list: []
			}
		},
		onShow() {
			console.log('showhsow')
			this.loads()
			var data = getApp().globalData.Informations
			this.info = data
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			loads() {
				if (this.type == 1) {

					this.$httpapi('project/getTbCustomerRouteListNow', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						type: 2
					}).then(res => {
						if (res.code == 500) {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}
						this.list = res.data
					})
				} else {
					this.$httpapi('project/getTbCustomerRouteListOld', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						type: 2
					}).then(res => {
						if (res.code == 500) {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}
						this.list = res.data
					})
				}

			},
			delects(item) {
				if (item.alreadyTotal > 0) {

					this.$refs.toast.show({
						message: '削除できないです.',
						duration: 2000
					});
					return
				}
				this.$httpapi('project/deleteTbCustomerRoute', 'POST', {
					routeId: item.id,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.loads()
				})
			},
			addride() {
				// this.info =getApp().globalData.Informations
				// console.log(this.info)
				// return
				let isDriver = uni.getStorageSync('isDriver') || 0
				if (uni.getStorageSync('isAuth') == 0) {
					this.$refs.toast.show({
						message: '本人確認が完了していません。マイページから本人確認を行ってください。',
						duration: 2000
					});
					return
				}
				if (isDriver == 1) {
					uni.navigateTo({
						url: '/pages/index/Addride/Addride?type=2'
					})
				} else {
					alert = '車両情報の登録をお願いします'
					uni.navigateTo({
						url: '/pages/index/VehicleRegistration/VehicleRegistration'
					})
				}

			},
			qiehuan(type) {
				this.type = type
				this.loads()
			},
			personal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation'
				})
			},
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
			},
			details(item) {
				uni.navigateTo({
					url: '/pages/index/Addride/AddrideEdit?id=' + item.id
				})
			}
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

		.xian {
			margin: 0.79rem auto 0;
			width: 15.91rem;
			height: 0.68rem;
			background: #FF3D66;
			border-radius: 0px 0px 0px 0px;
		}

		.buttons {
			width: 17.233rem;
			height: 5.06rem;
			background: #F44870;
			border-radius: 1.264rem;
			font-weight: bold;
			font-size: 1.739rem;
			color: #FFFFFF;
			line-height: 5.06rem;
			text-align: center;
			margin: 4.268rem 0 3.636rem;
			cursor: pointer;
		}

		.buttonss {
			margin: 4.743rem auto 0;
			width: 49.486rem;
			height: 5.85rem;
			background: #f44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #fff;
			line-height: 5.85rem;
			text-align: center;
			cursor: pointer;
		}

		@media screen and (max-width: 768px) {
			.buttonss {
				margin: 4.743rem auto 0;
				// width: 49.486rem;
				// height: 5.85rem;
				background: #F44870;
				border-radius: 1.423rem;
				font-size: 3.41rem;
				color: #FFFFFF;
				line-height: 10.23rem;
				text-align: center;
				cursor: pointer;
				width: 75.23rem;
				height: 10.23rem;
			}
		}

		.buttonx {
			width: 17.233rem;
			height: 5.06rem;
			border-radius: 1.264rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size: 1.739rem;
			color: #F44870;
			line-height: 5.06rem;
			text-align: center;
			cursor: pointer;
		}
	}
</style>