<template>
	<view>
		<view class='pc-only'>
			<view class="content">
				<headers ref="headers"  style="position: fixed;top:0;left:0;z-index: 1;"></headers>
				<Navigation :pageIndex="'7'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view
					style="width: 113.834rem;height: 43rem;background: #FFFFFF;border-radius: 2.372rem;margin: 2.372rem auto 7.51rem;text-align: center;">
					<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 7.115rem;">
						携帯番号の認証を行います</view>
					<view class="flex" style="margin:2.055rem auto 4.743rem;align-items: center;width:79.684rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>携</text>
							<text>带</text>
							<text>番</text>
							<text>号</text>
							<text>(</text>
							<text>非</text>
							<text>開</text>
							<text>示</text>
							<text>)</text>
						</view>
						<!-- <view class="flexJusp" style="width:59.763rem;"> -->
							<!-- <view class="flexJusp"
								style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width: 15.81em;;text-align: left;">日本</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view> -->
			
							<view class="flexJusp"
								style="width:59.763rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<input v-model="phone" style="width:30rem;" placeholder="電話番号を入力してください" />
							</view>
						<!-- </view> -->
					</view>
					<view style="margin:9.486rem 0 3.162rem;color: #666666;font-size: 1.581rem;">SMSに4桁の認証番号を送付します</view>
					<view class="buttons" @click="login">送信</view>
			
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<toast ref="toast"></toast>
			</view>
			
		</view>
		<view class='mobile-only'>
			<view class="content">
				<headers ref="headers"  style="position: fixed;top:0;left:0;z-index: 1;"></headers>
				<Navigation :pageIndex="'7'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view
					style="width: 113.834rem;height: 43rem;background: #FFFFFF;border-radius: 2.372rem;margin: 2.372rem auto 7.51rem;text-align: center;">
					<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 7.115rem;">
						携帯番号の認証を行います</view>
					<view class="flex" style="margin:2.055rem auto 4.743rem;align-items: center;width:79.684rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>携</text>
							<text>带</text>
							<text>番</text>
							<text>号</text>
							<text>(</text>
							<text>非</text>
							<text>開</text>
							<text>示</text>
							<text>)</text>
						</view>
						<!-- <view class="flexJusp" style="width:59.763rem;"> -->
							<!-- <view class="flexJusp"
								style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width: 15.81em;;text-align: left;">日本</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view> -->
			
							<view class="flexJusp"
								style="width:59.763rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<input v-model="phone" style="width:30rem;" placeholder="電話番号を入力してください" />
							</view>
						<!-- </view> -->
					</view>
					<view style="margin:9.486rem 0 3.162rem;color: #666666;font-size: 1.581rem;">SMSに4桁の認証番号を送付します</view>
					<view class="buttons" @click="login">送信</view>
			
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<toast ref="toast"></toast>
			</view>
			
		</view>
	</view>
	
</template>

<script>
	export default {
		data() {
			return {
				check: false,
				
				phone: ''
			}
		},
		onLoad() {
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(()=>{
				this.$refs.headers.gengxin(data)
			}, 1000)
		},
		methods: {
			loads() {
				
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
			margin: 1.423rem auto 2.372rem;
			width: 49.486rem;
			height: 5.85rem;
			background: #F44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #FFFFFF;
			line-height: 5.85rem;
			text-align: center;
		}

		.buttonx {
			margin: auto;
			width: 49.486rem;
			height: 5.533rem;
			border-radius: 1.423rem;
			border: 2px solid #F44870;
			font-size: 1.897rem;
			color: #F44870;
			line-height: 5.533rem;
			text-align: center;
		}
	}
</style>