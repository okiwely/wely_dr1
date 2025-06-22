<template>
	<view>
		<view class="content">
			<headers ref="headers" canGoBack title='レビュ—' style="position: fixed;top:0;left:0;z-index: 1;"></headers>

			<view class='pc-only'>
				<Navigation :pageIndex="''" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>

				<view style="height:14.229rem;"></view>
				<view
					style="width: 113.834rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto 7.51rem;text-align: center;padding-bottom:1px;">
					<view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">レビュ—</view>
					<view class="flex" style="align-items: center;width:69.486rem;margin:auto;">
						<view style="width:7.51rem;margin-right:2.213rem;" class="flexJusp">
							<text>評</text>
							<text>価:</text>
						</view>
						<view class="flex" style="align-items: center;">
							<image @click="qiehuan(1)" v-if="star>0" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(1)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(2)" v-if="star>1" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(2)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(3)" v-if="star>2" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(3)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(4)" v-if="star>3" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(4)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(5)" v-if="star>4" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(5)" class="xing" v-else src="/static/images/rehty.png"></image>
						</view>
					</view>
					<view class="flex"
						style="align-items: center;width:69.486rem;margin:1.107rem auto 6.324rem;font-size: 1.423rem;">
						<view style="width:7.51rem;margin-right:2.213rem;"></view>
						<view class="flex" style="align-items: center;">
							<view>悪い</view>
							<view style="margin-left:14.545rem;">良い</view>
						</view>
					</view>
					<view class="flex" style="width:69.486rem;margin:auto;">
						<view style="width:7.51rem;margin:0.949rem 2.213rem 0 0;" class="flexJusp">
							<text>コ</text>
							<text>メ</text>
							<text>ン</text>
							<text>ト:</text>
						</view>
						<view
							style="width:56.284rem;border-radius: 1.106rem;border: 1px solid #707070;padding: 1.739rem;">
							<textarea v-model="content" maxlength="-1"
								style="font-size: 1.739rem;width:56.284rem;text-align: left;height:8.3rem;"
								placeholder="コメントを入カしてください"></textarea>
						</view>
					</view>
					<view class="buttons" @click="pingfen">保存</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- 	<toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height:18.69rem;"></view>
				<view
					style="width:calc(100vw - 5.45rem);background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto;text-align: center;padding-bottom:1px;">
					<!-- <view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">レビュ—</view> -->
					<view class="flex" style="align-items: center;width:69.486rem;margin:auto;padding:2.27rem 2.73rem">
						<view style="width:7.51rem;margin-right:2.213rem;" class="flexJusp login_h1">
							<text>評</text>
							<text>価:</text>
						</view>
						<view class="flex" style="align-items: center;">
							<image @click="qiehuan(1)" v-if="star>0" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(1)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(2)" v-if="star>1" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(2)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(3)" v-if="star>2" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(3)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(4)" v-if="star>3" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(4)" class="xing" v-else src="/static/images/rehty.png"></image>
							<image @click="qiehuan(5)" v-if="star>4" class="xing" src="/static/images/bxs.png"></image>
							<image @click="qiehuan(5)" class="xing" v-else src="/static/images/rehty.png"></image>
						</view>
					</view>
					<view class="flex"
						style="align-items: center;width:69.486rem;margin:1.107rem auto 6.324rem;font-size: 1.423rem;">
						<view style="width:7.51rem;margin-right:2.213rem;"></view>
						<view class="flex" style="align-items: center;font-size: 2.95rem;">
							<view>悪い</view>
							<view style="margin-left:17.25rem;">良い</view>
						</view>
					</view>
					<view class="flex" style="width:69.486rem;margin:auto;flex-direction: column;">
						<view style="width:7.51rem;margin:0.949rem 2.213rem 0 0;" class="flexJusp login_h1">
							<text>コ</text>
							<text>メ</text>
							<text>ン</text>
							<text>ト:</text>
						</view>
						<view
							style="width:64.486rem;border-radius: 1.106rem;border: 1px solid #707070;padding: 2.73rem;margin-top:3rem">
							<textarea v-model="content" maxlength="-1"
								style="font-size: 2.95rem;width:64.486rem;text-align: left;height:18.3rem;"
								placeholder="コメントを入カしてください"></textarea>
						</view>
					</view>
					<view class="buttons" @click="pingfen">保存</view>
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
				check: false,

				array: ['普通自動車~1300cc', '1300cc~2300cc'],
				index: -1,
				arrays: ['1', '2', '3', '4', '5'],
				indexs: -1,
				arrayx: ['レギュラ—', 'レギュラ二'],
				indexx: -1,
				types: 0,
				star: 0,
				id: '',
				content: '',
				orderCode: ''
			}
		},
		onLoad(option) {
			this.id = option.subId
			this.orderCode = option.orderCode
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			pingfen() {
				this.$httpapi('project/addTbCustomerAppraise', 'POST', {
					subId: this.id,
					orderCode: this.orderCode,
					customerId: uni.getStorageSync('customerId'),
					level: this.star,
					content: this.content
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg == "参数不能为空:'content'"?'コメントを入力してください':'重複レビューはできません' ,
							duration: 2000
						});
					}
					if (res.code == 200) {
						uni.navigateBack()
					}
				})
			},
			qiehuan(type) {
				console.log(type, 'tdasdas', this.star)
				this.star = type
			},
			bindPickerChange(e) {
				if (e.detail.value == 0) {
					location.href =
						"https://docs.google.com/forms/d/e/1FAIpQLSfqk-lAtoGQNyGD3GNZYL4FosfnUkZBvQk4pIqMj7sm1lNv-A/viewform"
				} else {
					this.index = e.detail.value
				}
			},
			bindPickerChanges(e) {
				this.indexs = e.detail.value
			},
			bindPickerChangex(e) {
				this.indexx = e.detail.value
			},
			loads() {

			},
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
			},
			register() {
				uni.navigateTo({
					url: '/pages/login/register'
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

		.buttons {
			margin: 3.952rem auto 3.162rem;
			width: 49.486rem;
			height: 5.85rem;
			background: #F44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #FFFFFF;
			line-height: 5.85rem;
			text-align: center;
			cursor: pointer;
		}

		.buttonx {
			margin: 2.213rem auto 0;
			width: 59.763rem;
			height: 6.64rem;
			background: #FFFFFF;
			border-radius: 1.106rem;
			border: 2px solid #FF3D66;
			font-size: 1.897rem;
			color: #FF3D66;
			line-height: 6.64rem;
			text-align: center;
		}

		.xing {
			width: 3.004rem;
			height: 2.688rem;
			margin-right: 1.264rem;
			cursor: pointer;
		}

		@media screen and (max-width: 768px) {
			.xing {
				width: 3.9rem;
				height: 3.49rem;
				margin-right: 1.864rem;
				cursor: pointer;
			}

			.buttons {
				margin: 3.952rem auto 3.162rem;
				width: 37.95rem;
				height: 9.77rem;
				background: #F44870;
				font-family: Source Han Sans CN, Source Han Sans CN;
				font-weight: 500;
				font-size: 3.41rem;
				color: #FFFFFF;
				border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
				line-height: 9.77rem;
				text-align: center;
				font-style: normal;
				text-transform: none;
			}
		}
	}
</style>