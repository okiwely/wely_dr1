<template>
	<view>

		<view class="content">
			<headers ref="headers" canGoBack="true" title='' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>
				<view style="height: 7.905rem;"></view>
				<view
					style="width: 113.834rem;background: #FFFFFF;border-radius:2.372rem;margin: 2.372rem auto;padding:2rem;">
					<rich-text class="ql-editor" :nodes="content"></rich-text>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height: 18.69rem;"></view>
				<view
					style="width:calc(100vw - 12rem);background: #FFFFFF;border-radius:2.372rem;margin: 0 auto;padding:6rem;">
					<rich-text class="ql-editor" style='font-size: 2.95rem;' :nodes="content"></rich-text>
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

				content: '',
				type: 1
			}
		},
		onLoad(option) {
			this.type = option.type
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			loads() {
				var type = '11'
				if (this.type == 2) {
					type = '12'
				}
				if (this.type == 3) {
					type = '13'
				}
				this.$httpapi('api/getAgreement', 'POST', {
					type: type
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.content = res.data.content
				})
			},
		}
	}
</script>

<style lang="scss">
	@import "./css/quillBubble.css";
	@import "./css/quillBubble.css";
	@import "./css/quillBubble.css";

	page {
		background-color: #F6F6F6;
	}

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			margin: 1.423rem auto 2.371rem;
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
			width: 626px;
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