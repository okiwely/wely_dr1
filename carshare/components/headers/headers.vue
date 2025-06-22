<template>
	<view class="headerx">
		
		<view class=' mobile-only h-title' style='height:9.91rem;background-color: #fff;width:100%;text-align: center;line-height: 9.91rem;'>
             <image v-if='canGoBack'  @click="back" style="position:absolute;top:3.15rem;left:2.7rem;height: 3.18rem;width:3.18rem;cursor: pointer;" src="/static/images/back.png">
             </image>
			 {{title}}
		</view>
		<view class="pc-only">
			<view class="flexJusp" style="align-items: center;margin:0  3.32rem 0 6.087rem;height: 7.905rem;">
				<image @click="indexs" style="height: 3.32rem;width:6.64rem;cursor: pointer;" src="/static/logo.jpg">
				</image>
				<view v-if="customerId" class="flex" style="align-items: center;margin-right:6.798rem;">
					<view @click="welys" style="font-size: 1.581rem;color: #FF3D66;cursor: pointer;margin-right:1rem">Welyとは
					</view>
					<!-- 抖动提醒图片 -->
					<image @click="resetAndStartPolling" :class="{'shake': hasNewMessages}"
						style="margin-left:1rem;width:4.664rem;height: 2.609rem;" src="/static/images/email.png"></image>
			
					<image @click="personal"
						style="width:3.715rem;height:3.715rem;border-radius:50%;margin:0 0.79rem 0  3.162rem;cursor: pointer;"
						:src="Informations.avatar && Informations.avatar.replace('wely.info', '54.92.100.72:9006') "></image>
					<view @click="personal" style="font-size:1.265rem;cursor: pointer;">{{Informations.name}}</view>
					<view @click="tuichu"
						style="height:  3.32rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;margin-left:2rem;padding:0 1.5rem;cursor: pointer;">
						ログアウト</view>
				</view>
				<view v-else class="flex" style="align-items: center;margin-right:6.798rem;">
					<view @click="welys" style="font-size: 1.581rem;color: #FF3D66;margin-right: 4.743rem;cursor: pointer;">
						Welyとは</view>
					<view @click="logins"
						style="width: 13.755rem;height:  3.32rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height: 3.32rem;text-align: center;cursor: pointer;">
						会員登録/ログイン</view>
				</view>
			</view>
		</view>
		
		<view class="mobile-only">
		    <view class="flexJusp" style="align-items: center; margin: 0 3.32rem 0 3.32rem; height: 8.78rem;">
		       <image @click="indexs" style="height: 5.45rem;; cursor: pointer;" src="/static/logo.jpg" mode='heightFix'></image>
		     <!--   <view @click="welys" class='wely'>
		            Welyとは
		        </view> -->
		        <view v-if="customerId" class="flex" style="align-items: center;">
		            <!-- 头像 -->
		            <image @click="toggleMenu" 
		                style="width: 5.74rem; height: 6.07rem; border-radius: 50%; cursor: pointer;" 
		                :src="Informations.avatar && Informations.avatar.replace('wely.info', '54.92.100.72:9006')"></image>
		
		            <!-- 下拉菜单 -->
		            <view v-if="menuVisible" class="dropdown-menu" style='width:20vw'>
		                <view @click="personal" style="padding: 1.5rem 0; cursor: pointer;">ダッシュボード</view>
						 <view @click="navigates(2)" style="padding: 1.5rem 0; cursor: pointer;">ドライブ一覧</view>
						 <view @click="navigates(3)" style="padding: 1.5rem 0; cursor: pointer;">リクエスト一覧</view>
						 <view @click="navigates(4)" style="padding: 1.5rem 0; cursor: pointer;">プロフィール</view>
						 <view @click="navigates(5)" style="padding: 1.5rem 0; cursor: pointer;">車両登録</view>
						<view @click="navigates(6)" style="padding: 1.5rem 0; cursor: pointer;">お支払い</view>
						  <view @click="navigates(8)" style="padding: 1.5rem 0; cursor: pointer;">メッセ一ジ</view>
						  
		                <view @click="tuichu" style="padding: 0.5rem 0; cursor: pointer;">ログアウト</view>
		            </view>
		        </view>
		
		        <view v-else class="flex" style="align-items: center;">
		            
		            <view @click="logins" 
		                style="width: 10rem; height: 3.32rem; background: #F44870; border-radius: 0.79rem; font-size: 1.264rem; color: #FFFFFF; line-height: 3.32rem; text-align: center; cursor: pointer;">
		                ログイン
		            </view>
		        </view>
		    </view>
		</view>

		
	</view>

</template>

<script>
	export default {
		name: "headers",
		data() {
			return {
				menuVisible: false,
				Informations: uni.getStorageSync('Informations') || {},
				customerId: uni.getStorageSync('customerId'),
				list: [],
				hasNewMessages: false, // 用于控制图片抖动
				lastListLength: uni.getStorageSync('lastListLength'), // 用于对比上次消息数量
				timer: null, // 定时器
			};
		},
		props: {
		    title: {
		      type: String,
		      required: true,
		      default: 'トップペ—ジ'
		    },
		    canGoBack: {
		      type: Boolean,
		      default: false // 默认没有上级页面
		    }
		  },
		mounted() {
			this.startPolling();
		},
		beforeDestroy() {
			clearInterval(this.timer);
		},
		methods: {
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
			},
			back(){
				uni.navigateBack()
			},
			 toggleMenu() {
			            this.menuVisible = !this.menuVisible; // 切换菜单显示状态
			        },
			// 开始轮询
			startPolling() {
				this.timer = setInterval(() => {
					this.checkForNewMessages();
				}, 60000); // 每60秒检查一次
			},
			// 停止轮询
			stopPolling() {
				if (this.timer) {
					clearInterval(this.timer);
					this.timer = null;
				}
			},
			// 检查是否有新消息
			checkForNewMessages() {
				this.$httpapi('project/getTbCustomerChatList', 'POST', {
					customerId: uni.getStorageSync('customerId'),
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					} else {
						// 检查是否有新消息
						const newList = res.data;

						if (newList.length > this.lastListLength) {
							this.hasNewMessages = true; // 开启抖动效果
							this.stopPolling(); // 停止轮询
						}
						// 更新 list 和 lastListLength

						this.list = newList;
						uni.setStorageSync('lastListLength', newList.length)
						this.lastListLength = newList.length
						// this.lastListLength = newList.length;
					}
				});
			},
			// 点击后重置状态并重新开始轮询
			resetAndStartPolling() {
				this.hasNewMessages = false; // 停止抖动
				this.startPolling(); // 重新开始轮询
				uni.navigateTo({
					url: '/pages/index/news/news'
				});

			},
			gengxin(item) {
				if (item) {
					this.Informations = item;
					this.$forceUpdate();
				}
			},
			welys() {
				location.href =
					"https://wayslink.me/wely-info/";
			},
			personal() {
				uni.navigateTo({
					url: '/pages/index/briefIntroductionTop/briefIntroductionTop?id=' + this.Informations
						.customerId
				});
			},
			tuichu() {
				this.Informations = '';
				uni.setStorageSync('customerId', '');
				uni.setStorageSync('Informations', '');
				uni.reLaunch({
					url: '/pages/index/index'
				});
			},
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				});
			},
			logins() {
				uni.navigateTo({
					url: '/pages/login/login'
				});
			}
		}
	}
</script>

<style>
	.dropdown-menu {
	    position: absolute;
	    top: 17rem;
	    right: 2rem;
	    background: white;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    border-radius: 0.5rem;
	    width: 12rem;
	    padding: 1rem;
		z-index:1000;
		font-weight: 700;
	}
	
	.dropdown-menu view {
	    padding: 0.5rem 0;
	    cursor: pointer;
	}

	.headerx {
		z-index: 3;
		width: 100%;
		height: 7.905rem;
		background-color: #FFFFFF;
	}
	.h-title{
		font-family: PingFang SC, PingFang SC;
		font-weight: bold;
		font-size: 4.05rem;
		color: #000000;
		line-height: 5.63rem;
		text-align: center;
		font-style: normal;
		text-transform: none;
	}
    .wely{
		font-family: Source Han Sans CN, Source Han Sans CN;
		font-weight: 500;
		font-size: 3.6rem;
		color: #FF3D66;
		line-height: 0rem;
		text-align: left;
		font-style: normal;
		text-transform: none;
	}
	.shake {
		animation: shake 0.5s infinite;
	}

	@keyframes shake {

		0%,
		100% {
			transform: translateX(0);
		}

		25% {
			transform: translateX(-3px);
		}

		50% {
			transform: translateX(3px);
		}

		75% {
			transform: translateX(-3px);
		}
	}

	
</style>