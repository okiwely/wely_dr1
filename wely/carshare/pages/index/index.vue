<template>
	<view class="content">
		<headers ref="headers" style="position: fixed;top:0;left:0;z-index: 3;"></headers>
		<view class='pc-only'>
			<view style="height: 7.905rem;"></view>
			<view>
				<image style="width: 100%;height: 36.838rem;position: relative;z-index: 1;" mode="widthFix" src="/static/images/we.png"></image>
				<view style="width: 100%;height: 36.838rem;color: #FFF;margin-top:-36.838rem;position: relative;z-index: 2;">
					<view style="height:1px;"></view>
					<view style="width:113.834rem;margin:5.929rem auto 0;">
						<view style="font-weight: bold;font-size:  2.372rem;color: #FF3D66;">退屈な移動を楽しいドライブに。</view>
						<view style="font-size:  1.581rem;color: #333333;margin-top: 5.688rem;">女性専用ライドシェア</view>
				
						<view class="flex" style='margin-top:5rem'>
							<view style="width: 14.545rem;height: 4.743rem;background: #F44870;border-radius: 1.106rem;font-weight: bold;font-size: 1.897rem;color: #FFF;line-height: 4.743rem;text-align: center;cursor: pointer;" @click="souList">ドライブ検索</view>
							<view style="width: 16.442rem;height: 4.743rem;background: #F44870;border-radius: 1.106rem;font-weight: bold;font-size: 1.897rem;color: #FFF;line-height: 4.743rem;text-align: center;margin-left: 2.372rem;cursor: pointer;" @click="userList">リクエスト検索</view>
						</view>
					</view>
				</view>
				<view style="width:113.834rem;margin:auto;">
					<view style="font-size: 1.897rem;color: #000000;margin:3.162rem 0  2.372rem;">最新のドライブ</view>
					<view class="flexJusp" v-for="(item,index) in listCar" :key="index" style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view style="width: 29.17rem;height:22.213rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view class="flex"  @click='topersonal(item)'>
								<image style="width: 10.83rem;height:10.83rem;border-radius:50%;" :src="item.avatar"></image>
								<view style="margin-left:1.107rem;">
									<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding:0.949rem 0 1.264rem;">{{item.name}}</view>
									<view class="flex" style="align-items: center;" v-if="item.score!=0">
										<image style="width:1.897rem;height:1.739rem;" src="/static/images/bxs.png"></image>
										<view style="font-size: 1.581rem;color: #F88400;margin:0 0.948rem 0 6px;">{{item.score}}</view>
										<view style="font-size: 1.739rem;color: #333333;">-1rating</view>
									</view>
									<view v-if="item.isAuth==1" style="font-size: 1.423rem;color: #666666;margin-top: 1.581rem;">本人確認書類提出済み</view>
								</view>
							</view>
							<view class="flexJusp" style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view>
									<view style="font-size:  1.581rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
								</view>
								<view style="width:9.17rem;">
									<view style="font-size:  1.581rem;color: #666666;">同乗人数</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">{{item.alreadyTotal}}/{{item.total}}</view>
								</view>
							</view>
						</view>
						<view style="width:44.901rem;height:22.213rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view style="font-size: 2.372rem;color: #F44870;">{{item.startTime.slice(0, 16)}}</view>
							<view class="flex" style="align-items: center;font-weight: bold;font-size: 1.897rem;margin:2.529rem 0 2.055rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:5.259rem;height:0.79rem;margin:0  1.581rem;" src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view style="width:44.901rem;height:  7.905rem;background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:2.055rem 0;">
								<view class="flex" style="margin:1.423rem 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;" src="/static/images/q.png"></image>
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">起</view> -->
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.startAddress}}</view>
								</view>
								<view class="flex" style="margin:0 1.264rem;">
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">終</view> -->
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;" src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.endAddress}}</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;">
								<image style="width:2.213rem;height:1.818rem;" src="/static/images/c.png"></image>
								<view class="yihang" style="font-size: 1.739rem;color: #000000;margin-left:0.79rem;width:40rem;">車:{{item.model}}</view>
							</view>
						</view>
						<view style="width: 19.209rem;height:22.213rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="details(item)" style="width: 19.209rem;height: 5.06rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size:  1.739rem;color: #FFFFFF;line-height: 5.06rem;text-align: center;margin:4.268rem 0 3.636rem;cursor: pointer;">詳細</view>
							<view @click="jiaru(item)" style="width: 19.209rem;height: 5.06rem;border-radius: 1.264rem;border: 1px solid #F44870;font-weight: bold;font-size:  1.739rem;color: #F44870;line-height: 5.06rem;text-align: center;cursor: pointer;">リクエスト送信</view>
						</view>
					</view>
				</view>
			</view>
			<view style="height:16.126rem"></view>
		</view>
		<view class='mobile-only'>
			<view style="height: 18.69rem;"></view>
			<view>
				<image style="width: 100vw;height: 39.19rem;position: relative;z-index: 1;"  src="/static/images/we.png"></image>
				<view style="width: 100vw;height: 39.19rem;margin-top:-39.19rem;color: #FFF;position: relative;z-index: 2;text-align: center;">
					<view style="height:5.16rem;"></view>
					<view >
						<view class='h_h1'>退屈な移動を楽しいドライブに。</view>
						<view class="h_h2">女性専用ライドシェア</view>
				
						<view class="flex" style='margin-top:2rem;justify-content: center;'>
							<view style="width: 25.545rem;height: 4.743rem;background: #F44870;border-radius: 1.106rem;font-weight: bold;font-size: 1.897rem;color: #FFF;line-height: 4.743rem;text-align: center;cursor: pointer;" @click="souList">ドライブ検索</view>
							<view style="width: 25.442rem;height: 4.743rem;background: #F44870;border-radius: 1.106rem;font-weight: bold;font-size: 1.897rem;color: #FFF;line-height: 4.743rem;text-align: center;margin-left: 5.372rem;cursor: pointer;" @click="userList">リクエスト検索</view>
						</view>
					</view>
				</view>
				<view style="width:calc(100vw - 4.54rem);margin:auto;">
					<view class='h_h3' style="margin:2.25rem 2.7rem;">最新のドライブ</view>
					<view class="flexJusp" v-for="(item,index) in listCar" :key="index" style="flex-direction:column;padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view style="width: calc(100vw - 10rem);height:18.18rem;border-radius:  1.581rem;padding: 2.5rem;">
							<view class="flex"  @click='topersonal(item)'>
								<image style="width: 10.91rem;height:10.91rem;border-radius:50%;" :src="item.avatar"></image>
								<view style="margin-left:2.05rem;margin-top:-0.68rem">
									<view style="font-weight: bold;font-size: 3.81rem;color: #000000;">{{item.name}}</view>
									<view class="flex" style="align-items: center;margin:0.91rem 0 0.91rem 0;" v-if="item.score!=0" >
										<!--  -->
										<image style="width:2.95rem;height:2.73rem;" src="/static/images/bxs.png"></image>
										<view style="font-size: 2.73rem;color: #F88400;">{{item.score}}</view>
										<view style="font-size: 2.73rem;color: #333333;">-1rating</view>
									</view>
									<view style='height:4.55rem' v-else>
										
									</view>
									<view v-if="item.isAuth==1" style="font-size:2.73rem;color: #666666;">本人確認書類提出済み</view>
								</view>
								<view style='flex:1'></view>
								<view style="font-size: 3.18rem;color: #F44870;margin-right:2.27rem">{{item.startTime.slice(0, 16)}}</view>
							</view>
							<view style='height:0px;border: 0.11rem solid rgba(0,0,0,0.08);;width:calc(100vw - 10rem);margin:2.27rem auto'>
								
							</view>
							<!-- <view class="flexJusp" style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view>
									<view style="font-size:  1.581rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
								</view>
								<view style="width:9.17rem;">
									<view style="font-size:  1.581rem;color: #666666;">同乗人数</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">{{item.alreadyTotal}}/{{item.total}}</view>
								</view>
							</view> -->
						</view>
						<view style="width:calc(100vw - 10rem);margin-top:-4rem;border-radius:  1.581rem;padding: 1.581rem;">
							
							<view class="flex" style="align-items: center;font-weight: bold;font-size:3.18rem;margin:2.529rem 0 2.055rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:7.95rem;height:1.34rem;margin:0 5.36rem;" src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view style="width:calc(100vw - 15.89rem);background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:0 auto;padding:2.27rem 2.73rem">
								<view class="flex" style='margin-bottom:3.41rem' >
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;" src="/static/images/q.png"></image>
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">起</view> -->
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">{{item.startAddress}}</view>
								</view>
								<view class="flex" >
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">終</view> -->
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;" src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">{{item.endAddress}}</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;margin-top:1.59rem">
								<image style="width:3.86rem;height:3.18rem;" src="/static/images/c.png"></image>
								<view class="yihang" style="font-size: 2.95rem;color: #000000;margin-left:0.79rem;width:40rem;">車:{{item.model}}</view>
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
										{{item.alreadyTotal}}/{{item.total}}</view>
									<view style="color: #666666;">同乗人数</view>
							
								</view>
							</view>
						</view>
						<view style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<view @click="details(item)" class='detail'>詳細</view>
							<view @click="jiaru(item)" class='send' >リクエスト送信</view>
						</view>
					</view>
				</view>
			</view>
			<view style="height:58.41rem;"></view>
		</view>
		
		<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
		<toast ref="toast"></toast>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list:[],
				index:-1,
				indexs:-1,
				listCar:[]
			}
		},
		onLoad() {
		},
		onShow() {
			this.loads()
			// Informations
			var data = getApp().globalData.Informations
			
			setTimeout(()=>{
				console.log(data,'今のデータ-data----------data-')
				this.$refs.headers.gengxin(data)
			}, 1000)
		},
		methods: {
			topersonal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation?id=' + item.customerId
				})
			},
			jiaru(item){
				if(!uni.getStorageSync('customerId')){
					uni.navigateTo({
						url:'/pages/login/login'
					})
					return
				}
				if(uni.getStorageSync('isAuth')==0){
					uni.navigateTo({
						url:'/pages/index/briefIntroductionTop/briefIntroductionTop?id='+uni.getStorageSync('customerId')
					})
					return
				}
				
				
				  uni.showModal({
				            title: '確認',
				            content: 'あなたの電話番号がドライバーに表示されます。続行してもよろしいですか？',
							cancelText:'キャンセル',
							confirmText:'確認',
				            success: (res) => {
				                if (res.confirm) {
				                    // 用户点击确认，继续执行请求
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
				                        this.loads();
				                    }).catch(error => {
				                        // 处理请求错误
				                        console.error('Error adding customer chat:', error);
				                        this.$refs.toast.show({
				                            message: 'リクエスト送信中にエラーが発生しました。',
				                            duration: 2000
				                        });
				                    });
				                } else if (res.cancel) {
				                    // 用户点击取消，不执行任何操作
				                    console.log('ユーザーが操作をキャンセルしました。');
				                }
				            }
				        });
			},
			bindPickerChange(e){
				this.index = e.detail.value
			},
			bindPickerChanges(e){
				this.indexs = e.detail.value
			},
			loads(){
				this.$httpapi('project/getCityList', 'POST', {}).then(res => {
					this.list = res.data
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
				})
				this.$httpapi('project/getTbCustomerRouteListS', 'POST', {}).then(res => {
					this.listCar = res.rows.filter(item => item.price >0);
					// res.data.filter(item => item.model === true);
					if(res.code == 500){
						this.$refs.toast.show({
							message:res.msg,
							duration: 2000
						});
					}
				})
			},
			souList(){
				uni.navigateTo({
					url:'/pages/index/IndexLise/IndexLise'
				})
			},
			userList(){
				uni.navigateTo({
					url:'/pages/index/userList/userList'
				})
			},
			details(item){
				uni.navigateTo({
					url:'/pages/index/IndexLise/ListDetails?id='+item.id
				})
			}
		}
	}
</script>

<style lang="scss">
	page{
		background-color: #F6F6F6;
	}
	.content{
		min-height:100vh;
		position: relative;
	}
	.h_h1{
		font-family: Source Han Sans CN, Source Han Sans CN;
		font-weight: bold;
		font-size: 4.05rem;
		color: #FF3D66;
		line-height: 10.59rem;
		text-align: center;
		font-style: normal;
		text-transform: none;
	}
	.h_h2{
		font-family: Source Han Sans CN, Source Han Sans CN;
		font-weight: 500;
		font-size: 3.15rem;
		color: #333333;
		line-height: 10.59rem;
		text-align: center;
		font-style: normal;
		text-transform: none;
	}
	.h_h3{
		font-family: Source Han Sans CN, Source Han Sans CN;
		font-weight: 500;
		font-size: 3.38rem;
		color: #000000;
		line-height: 5.86rem;
		text-align: left;
		font-style: normal;
		text-transform: none;
		margin-left:2.7rem;
	}
</style>
