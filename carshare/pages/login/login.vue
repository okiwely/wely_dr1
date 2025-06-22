<template>
	<view>

		<view class="content">
			<headers ref="headers" title='メールアドレスでログイン' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>
				<view style="height:7.9rem;"></view>
				<view
					style="width: 113.834rem;height: 56.6;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto;text-align: center;">
					<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 4.743rem;">
						メールアドレスでログイン</view>
					<view class="flex"
						style="width: 69.486rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;margin:auto;">
						<view style="width:5.296rem;text-align: center;">
							<image style="width: 2.45rem;height: 1.739rem;" src="/static/images/yxx.png"></image>
						</view>
						<input v-model="email" style="font-size: 1.739rem;width:46rem;"
							placeholder="メールアドレスを入力してください" />
					</view>

					<view class="flex"
						style="width: 69.486rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;margin: 2.529rem auto 6.324rem;">
						<view style="width:5.296rem;text-align: center;">
							<image style="width:1.976rem;height:1.897rem" src="/static/images/nkj.png"></image>
						</view>
						<input v-model="password" password="password" style="font-size: 1.739rem;width:46rem;"
							placeholder="パスワードを入力してください" />
					</view>
					<view class="flex" style="justify-content: center;align-items: center;cursor: pointer;"
						@click="check = !check">
						<image v-if="check" style="width: 1.581rem;height:  1.581rem;" src="/static/images/xzz.png">
						</image>
						<image v-else style="width: 1.581rem;height:  1.581rem;" src="/static/images/xzzsd.png"></image>
						<view style="margin-left:0.949rem;">ログインしたままにする</view>
					</view>

					<view class="buttons" @click="login">ログインする</view>
					<view class="buttonx" @click="register">会員登録</view>
					<view @click='contact' style="margin:3.952rem 0 0;color: #F44870;">パスワ—ドを忘れた方はこちら</view>
					<view style="height:3rem;"></view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height: 18.69rem;"></view>
				<view
					style="width: 100vw;background: #FFFFFF;border-radius:  2.372rem;text-align: center;padding-top:3.64rem;">
					<!-- <view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 4.743rem;">
						メールアドレスでログイン</view> -->
					<view class='login_h1' style='margin-bottom:2.5rem'>
						メールアドレス
					</view>
					<view class="flex"
						style="margin-top:2.27rem;margin-bottom:6.59rem;width: calc(100vw - 5.46rem);height:9.32rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;margin:auto;">
						<!-- 	<view style="width:5.296rem;text-align: center;">
							<image style="width: 2.45rem;height: 1.739rem;" src="/static/images/yxx.png"></image>
						</view> -->
						<input class='inputT' v-model="email" style="font-size: 2.95rem;margin-left:1.18rem;width:50rem"
							placeholder="メールアドレスを入力してください" />
					</view>
					<view class='login_h1' style='margin-top:5rem'>
						パスワード
					</view>
					<view class="flex"
						style="width: calc(100vw - 5.46rem);height: 9.32rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;margin: 2.529rem auto 6.324rem;">
						<!-- <view style="width:5.296rem;text-align: center;">
							<image style="width:1.976rem;height:1.897rem" src="/static/images/nkj.png"></image>
						</view> -->
						<input class='inputT' v-model="password" password="password" style="font-size: 2.95rem;margin-left:1.18rem;width:50rem"
							placeholder="パスワードを入力してください" />
					</view>
					<view class="flex" style="justify-content: center;align-items: center;cursor: pointer;"
						@click="check = !check">
						<image v-if="check" style="width: 3.18rem;height:  3.18rem;" src="/static/images/xzz.png">
						</image>
						<image v-else style="width: 3.18rem;height:  3.18rem;" src="/static/images/xzzsd.png"></image>
						<view style="margin-left:0.949rem;font-size: 3.18rem;">ログインしたままにする</view>
					</view>

					<view class="buttons" @click="login">ログインする</view>
					<view class="buttonx" @click="register">会員登録</view>
					<view @click='contact' style="font-weight: 500;
                     font-size: 2.95rem;margin:3.952rem 0 0;color: #F44870;">パスワ—ドを忘れた方はこちら</view>
					<view style="height:3rem;"></view>
				</view>
				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				
			</view>
		</view>
        <toast ref="toast"></toast>
	</view>



</template>

<script>
	export default {
		data() {
			return {
				check: true,
				loginStatu: '0',
				detail: {},

				email: '',
				password: ''
			}
		},
		onLoad() {

		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 1000)
		},
		methods: {
			register() {
				uni.navigateTo({
					url: '/pages/login/register'
				})
			},
			contact() {
				this.$refs.toast.show({
					message: 'パスワードの再設定はサポートしておりません、お手数をおかけしますがサポートへご連絡ください。',
					duration: 2000
				});
			},
			login() {
				// if (!this.check) {
				// 	this.$utils.showtt('入力してください')
				// 	return
				// }
				this.$httpapi('project/login', 'POST', {
					email: this.email,
					password: this.password
				}).then(res => {

					if (res.code == 200) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
						uni.setStorageSync('customerId', res.data.customerId)
						uni.setStorageSync('Informations', res.data)
						getApp().xinxi()
						this.$refs.headers.gengxin(res.data);
						uni.reLaunch({
							url: '/pages/index/index'
						})
					} else {
						this.$refs.toast.show({
							message: 'メールアドレスまたはパスワードに誤りがあります',
							duration: 2000
						});
						console.log(111)
						
					}
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
			margin: 1.423rem auto 2.372rem;
			width: 49.802rem;
			height: 5.85rem;
			background: #f44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #fff;
			line-height: 5.85rem;
			text-align: center;
			cursor: pointer;
		}


		.buttonx {
			margin: auto;
			width: 49.486rem;
			height: 5.533rem;
			border-radius: 1.423rem;
			border: 2px solid #f44870;
			font-size: 1.897rem;
			color: #f44870;
			line-height: 5.533rem;
			text-align: center;
			cursor: pointer;
		}

		@media screen and (max-width: 768px) {
			.buttons {
				margin: 3.18rem auto 3.64rem;
				width: 75rem;
				height: 10.23rem;
				background: #F44870;
				border-radius: 2.27rem;
				font-size: 3.41rem;
				color: #FFFFFF;
				line-height: 10.23rem;
				text-align: center;
				cursor: pointer;
			}

			.buttonx {
				margin: auto;
				width: 75rem;
				height: 10.23rem;
				border-radius: 2.27rem;
				border: 2px solid #F44870;
				font-size: 3.41rem;
				color: #F44870;
				line-height: 10.23rem;
				text-align: center;
				cursor: pointer;
			}
		}


		.login_h1 {
			text-align: left;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #000000;
			line-height: 4.55rem;
			text-align: left;
			font-style: normal;
			text-transform: none;
			// width: 22.05rem;
			height: 4.55rem;
			margin-left: 3.64rem;
		}
	}
</style>