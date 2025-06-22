<template>
	<view class="bottomx">
		<view class='pc-only'>
			<view class="flex" style="width:113.834rem;margin:0 auto;color: #FFFFFF;padding-top:1.372rem;">
				<view style="width:40%;">
					<view style="font-weight: bold;font-size:  1.581rem;">WaysLink株式会社</view>
					<view style="margin:0.949rem 0;">所在地：〒901-1104　沖縄県南風原町字宮平894－11</view>
					<view>代表電話番号：050-5830-0623</view>
					<view style="margin:0.949rem 0;">contact@wely.info</view>
				</view>
				<view style="width:30%;">
					<view @click="indexList" style="cursor: pointer;">ドライブ一覧</view>
					<view style="margin:0.849rem 0;cursor: pointer;" @click="userList">リクエスト一覧</view>
					<view style="cursor: pointer;margin:0.849rem 0;" @click="indexs">マイページ</view>
					<!-- 			<view style="margin:0.849rem 0;cursor: pointer;" @click="login">ログイン</view> -->
					<view @click="register" style="cursor: pointer;">会員登録</view>
				</view>
				<view style="width:30%;">
					<view @click="welys" style="cursor: pointer;">Welyとは</view>
					<view style="margin:0.949rem 0;cursor: pointer;" @click="agreement('1')">運営会社</view>
					<view @click="agreement('2')" style="cursor: pointer;">利用規約</view>
					<view style="margin:0.949rem 0;cursor: pointer;" @click="agreement('3')">プライバシーポリシー</view>
				</view>
			</view>
		</view>
		<view class='mobile-only'>
			
			<view class="flex" style="width:calc(100vw - 9.1rem);margin:0 auto;color: #FFFFFF;padding:4.32rem 4.55rem;flex-wrap: wrap;">
				<view style="width:100vw;margin-bottom:5.6rem">
					<view style="font-weight: bold;font-size:  4.09rem;">WaysLink株式会社</view>
					<view style="margin:0.949rem 0;">所在地：〒901-1104　沖縄県南風原町字宮平894－11</view>
					<view>代表電話番号：050-5830-0623</view>
					<view style="margin:0.949rem 0;">contact@wely.info</view>
				</view>
				<view style="width:50%;">
					<view @click="indexList" style="cursor: pointer;">ドライブ一覧</view>
					<view style="margin:0.849rem 0;cursor: pointer;" @click="userList">リクエスト一覧</view>
					<view style="cursor: pointer;margin:0.849rem 0;" @click="indexs">マイページ</view>
					<!-- 			<view style="margin:0.849rem 0;cursor: pointer;" @click="login">ログイン</view> -->
					<view @click="register" style="cursor: pointer;">会員登録</view>
				</view>
				<view style="width:50%;">
					<view @click="welys" style="cursor: pointer;">Welyとは</view>
					<view style="margin:0.949rem 0;cursor: pointer;" @click="agreement('1')">運営会社</view>
					<view @click="agreement('2')" style="cursor: pointer;">利用規約</view>
					<view style="margin:0.949rem 0;cursor: pointer;" @click="agreement('3')">プライバシーポリシー</view>
				</view>
			</view>
		</view>


	</view>
</template>

<script>
	export default {
		name: "bottoms",
		data() {
			return {
				customerId: uni.getStorageSync('customerId'),
			};
		},
		methods: {
			agreement(type) {
				uni.navigateTo({
					url: '/pages/index/agreement/agreement?type=' + type
				})
			},
			welys() {
				location.href =
					"https://www.canva.com/design/DAGRWwFkIIg/kfoDOBL_S1a2xju-6vX90g/view?utm_content=DAGRWwFkIIg&utm_campaign=designshare&utm_medium=link&utm_source=editor"
			},
			indexs() {
				// pages/index/briefIntroductionTop/briefIntroductionTop?id=26
				if (this.customerId) {
					uni.navigateTo({
						url: '/pages/index/briefIntroductionTop/briefIntroductionTop?id=' + this.customerId
					})
				} else {
					uni.navigateTo({
						url: '/pages/login/login'
					})
				}

			},
			indexList() {
				uni.navigateTo({
					url: '/pages/index/IndexLise/IndexLise'
				})
			},
			userList() {
				uni.navigateTo({
					url: '/pages/index/userList/userList'
				})
			},
			register() {
				uni.navigateTo({
					url: '/pages/login/register'
				})
			},
			login() {
				uni.navigateTo({
					url: '/pages/login/login'
				})
			}
		}
	}
</script>

<style>
	.bottomx {
		width: 100%;
		height: 16.126rem;
		background: #FF587F;
		font-size: 1.423rem;
	}
	@media screen and (max-width: 768px) {
		.bottomx {
			width: 100vw;
			height: 58.41rem;
			background: #FF587F;
			font-size: 2.73rem;
		}
	}
		
	
</style>