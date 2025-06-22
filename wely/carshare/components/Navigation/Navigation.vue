<template>
	<view class="headerx pc-only">
		<view class="flexJusp" style="align-items: center;margin:auto;height:6.324rem;width:113.834rem;">
			<view @click="navigates('1')" style="cursor: pointer;" :style="pageIndex=='1'?'color:#F44870;font-weight: bold;':''">ダッシュボード</view>
			<view @click="navigates('2')" style="cursor: pointer;" :style="pageIndex=='2'?'color:#F44870;font-weight: bold;':''">ドライブ一覧</view>
			<view @click="navigates('3')" style="cursor: pointer;" :style="pageIndex=='3'?'color:#F44870;font-weight: bold;':''">リクエスト一覧</view>
			<view @click="navigates('4')" style="cursor: pointer;" :style="pageIndex=='4'?'color:#F44870;font-weight: bold;':''">プロフィール</view>
			<view @click="navigates('5')" style="cursor: pointer;" :style="pageIndex=='5'?'color:#F44870;font-weight: bold;':''">車両登録</view>
			<view @click="navigates('6')" style="cursor: pointer;" :style="pageIndex=='6'?'color:#F44870;font-weight: bold;':''">お支払い</view>
			<!-- <view @click="navigates('7')" style="cursor: pointer;" :style="pageIndex=='7'?'color:#F44870;font-weight: bold;':''">電話番号認証</view> -->
			<view @click="navigates('8')" style="cursor: pointer;" :style="pageIndex=='8'?'color:#F44870;font-weight: bold;':''">メッセ一ジ</view>
		</view>
	</view>
</template>

<script>
	export default {
		name:"Navigation",
		props:{
			pageIndex:{
				type: String,
				default: "1"
			}
		},
		data() {
			return {
				
			};
		},
		methods:{
			navigates(type){
				if(type=='1'){
					uni.reLaunch({
						url:'/pages/index/briefIntroductionTop/briefIntroductionTop'
					})
				}else if(type=='2'){
					uni.navigateTo({
						url:'/pages/index/WritetoList/WritetoList'
					})
				}else if(type=='3'){
					uni.navigateTo({
						url:'/pages/index/RequestList/RequestList'
					})
				}else if(type=='4'){
					uni.navigateTo({
						url:'/pages/index/briefintroduction/briefintroduction'
					})
				}else if(type=='5'){
					uni.navigateTo({
						url:'/pages/index/VehicleRegistration/VehicleRegistration'
					})
				}else if(type=='6'){
					uni.navigateTo({
						url:'/pages/index/payment/payment'
					})
				}else if(type=='7'){
					uni.navigateTo({
						url:'/pages/login/bindPhone'
					})
				}else if(type=='8'){
					uni.navigateTo({
						url:'/pages/index/news/news'
					})
				}
			}
		}
	}
</script>

<style>
.headerx{
	z-index: 1;
	width:100%;
	height:6.324rem;
	background-color: #F6E4E8;
}
</style>