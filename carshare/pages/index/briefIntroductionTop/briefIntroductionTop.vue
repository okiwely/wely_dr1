<template>
	<view>
		<view class='content'>
			<headers ref="headers" title='プロフィ一ル' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class="pc-only">
				
				<Navigation :pageIndex="'1'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view style="font-size:1.897rem;margin: 2.372rem auto;width:113.834rem;">プロフィ一ル</view>
				<view class="flex" style="margin:0 auto  2.372rem;width:113.834rem;">
					<!-- <view style="width:30.988rem;">
							<view
								style="width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem  1.581rem 1.897rem;font-size:1.423rem;">
						
								<view style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;">
									<view>携带認証</view>
									<view class="flexJusp" style="align-items: center;margin-top:1.423rem;">
										<image v-if="detail.isAuth==1" style="width: 1.581rem;height:1.107rem;"
											src="/static/images/re.png"></image>
										<view v-else @click="upImagex"
											style="width:10rem;height:3rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
											アップロード</view>
									</view>
								</view>
								<view style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;">車情報</view>
								<view v-if="detail.isDriver==0" style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 0;">
									車を持っていない</view>
								<view v-if="detail.isDriver==1" style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 0;">
									車があります</view>
								<view v-if="detail.isDriver==0"
									style="text-align: right;font-weight: bold;font-size: 1.423rem;color: #F44870;margin-top:1.897rem;cursor: pointer;"
									@click="vehicle">車両登録</view>
							</view>
						</view> -->
					<view style="width:104.98rem;margin:0 0 0 3.162rem;">

						<view
							style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;">
							<view class="flexJusp" style="align-items: center;">
								<view class="flex">
									<view style="position: relative;width:8.221rem;height:8.221rem;">
										<image style="width:8.221rem;height:8.221rem;border-radius:50%;"
											:src="detail.avatar && detail.avatar.replace('wely.info', '54.92.100.72:9006')">
										</image>
										<view v-if="bianji==1"
											style="position:absolute;top:0;left:0; width:8.221rem;height:8.221rem;text-align: center;"
											@click="upImages">
											<image style="width:3rem;height:3rem;margin-top:2.61rem;"
												src="/static/images/upImage.png"></image>
										</view>
									</view>
									<view style="margin-left:0.949rem;">
										<view v-if="bianji==0"
											style="font-weight:bold;font-size:1.739rem;height:3rem;line-height:3rem;">
											{{detail.name}}
										</view>
										<input v-if="bianji==1" style="font-weight:bold;font-size:1.739rem;height:3rem;"
											v-model="detail.name" />
									<!-- 	<view v-if='detail.isAuth==1'
											style="font-size: 1.264rem;color: #666666;margin-top:3.427rem;">本人確認書類確認済み
										</view>
										<view v-else style="font-size: 1.264rem;color: #666666;margin-top:3.427rem;">
											本人確認書類提出済み</view> -->
									</view>
								</view>
								<view v-if="bianji==0" @click="bianjix"
									style="width:13.755rem;height:3.32rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
									編集する</view>
								<view v-if="bianji==1" @click="wancheng"
									style="width:13.755rem;height:3.32rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
									編集を完了します</view>
							</view>
						</view>
						<view class="flexJusp"
							style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-top:2rem;align-items: center;">
							<view>
								<view style="font-weight:bold;font-size:1.739rem;height:3rem;">
									￥{{btnActive?Math.floor(detail.money/1.2):0}}（引き出し申請中：￥{{btnActive?0:Math.floor(detail.integral/1.2)}}）</view>
								<view style="font-size: 1.264rem;color: #666666;margin-top:2rem;width:80rem">
									 送金を申請する前に、以下の内容を必ずご確認ください。<br>
									 ・表示の金額(移動実費額)をお引き出しいただけます。<br>
									  （手数料分は同乗者さまに請求しているため、ドライバーさまには請求御座いません。）<br>
									 ・お引き出しは1,100円以上で申請できます。<br>
									 ・申請後、メール宛に振込先口座情報をお送りください。<br>　wely@wayslink.me<br>
									 </view>
																</view>
																<!--  -->
							<view @click="getMoney" v-if='btnActive ' v-show='detail.money>=1100'
								style="width:13.755rem;height:3.32rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
								引き出し</view>
							<view   v-if='btnActive ' v-show='detail.money<1100'
								style="width:13.755rem;height:3.32rem;background: #CCC;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
								引き出し</view>
							<view v-else v-show='detail.money'
								style="width:13.755rem;height:3.32rem;background: #CCCCCC;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
								引き出し確認中</view>
						</view>
						<view
							style="padding: 2.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-top:2rem;align-items: center;">
							<h2>本人確認書類提出</h2>
							<view style='padding:1rem 3rem;'>
								<view class="flexJusp"
									style="align-items: center;margin-top:1.423rem;margin-bottom:1.53rem">
									<image v-if="detail.isAuth==1" style="width: 1.581rem;height:1.107rem;"
										src="/static/images/re.png"></image>
									<view v-else @click="upImagex"
										style="width:10rem;height:3rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
										アップロード</view>
								</view>
								<text>
									【ドライバー・利用者共通】各種健康保険証
									・ご本人様のお名前・生年月日・性別記載面（カードタイプの場合は両面）
									※被保険者等記号・番号、保険者番号、2次元バーコード等はペン等で復元できないよう、黒く塗りつぶしてください。
									※介護保険証は、本人確認書類として取り扱いできません。

									マイナンバー(個人番号)カード
									・ご本人様のお名前・生年月日・性別記載面（マイナンバーの記載がある裏面は不要）
									※通知カード（写真なし）は不可

									住民票の写し
									・発行日から6ヵ月以内のもの

									在留カード・特別永住者証明書等
									・ご本人様のお名前・生年月日・性別記載面（裏面に変更情報がある場合は両面）

									パスポート
									・ご本人様のお名前・生年月日・性別記載面
								</text>
							</view>

						</view>
					</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
			<!-- 	<toast ref="toast"></toast> -->
			</view>
            <view class='mobile-only'>
            
            			<Navigation :pageIndex="'1'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
            			<view style="height:14.229rem;"></view>
            			<view style="font-size:1.897rem;margin: 2.372rem auto;width:calc(100vw - 4.54rem)">プロフィ一ル</view>
            			<view class="flex" style="margin:0 auto;width:calc(100vw - 4.54rem)">
            				<!-- <view style="width:30.988rem;">
            					<view
            						style="width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem  1.581rem 1.897rem;font-size:1.423rem;">
            				
            						<view style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;">
            							<view>携带認証</view>
            							<view class="flexJusp" style="align-items: center;margin-top:1.423rem;">
            								<image v-if="detail.isAuth==1" style="width: 1.581rem;height:1.107rem;"
            									src="/static/images/re.png"></image>
            								<view v-else @click="upImagex"
            									style="width:10rem;height:3rem;background: #F44870;border-radius: 0.79rem;font-size: 1.264rem;color: #FFFFFF;line-height:3.32rem;text-align: center;cursor: pointer;">
            									アップロード</view>
            							</view>
            						</view>
            						<view style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 1.818rem;">車情報</view>
            						<view v-if="detail.isDriver==0" style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 0;">
            							車を持っていない</view>
            						<view v-if="detail.isDriver==1" style="border-bottom:1px solid #F0F0F0;padding: 1.581rem 0 0;">
            							車があります</view>
            						<view v-if="detail.isDriver==0"
            							style="text-align: right;font-weight: bold;font-size: 1.423rem;color: #F44870;margin-top:1.897rem;cursor: pointer;"
            							@click="vehicle">車両登録</view>
            					</view>
            				</view> -->
            				<view style="width:calc(100vw - 5.45rem);margin:0 auto">
            	
            					<view
            						style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;">
            						<view class="flexJusp" style="align-items: center;">
            							<view class="flex">
            								<view style="position: relative;width:11.14rem;height:11.14rem;">
            									<image style="width:11.14rem;height:11.14rem;border-radius:50%;" :src="detail.avatar && detail.avatar.replace('wely.info', '54.92.100.72:9006')">
            									</image>
            									<view v-if="bianji==1"
            										style="position:absolute;top:0;left:0; width:11.14rem;height:11.14rem;text-align: center;"
            										@click="upImages">
            										<image style="width:3rem;height:3rem;margin-top:2.61rem;"
            											src="/static/images/upImage.png"></image>
            									</view>
            								</view>
            								<view style="margin-left:0.949rem;">
            									<view v-if="bianji==0"
            										style="font-weight:bold;font-size:3.41rem;height:3rem;">
            										{{detail.name}}
            									</view>
            									<input v-if="bianji==1" style="font-weight:bold;font-size:3.41rem;line-height: 3rem;"
            										v-model="detail.name" />
            									<view v-if='detail.isAuth==1' style="font-size: 3.18rem;color: #666666;margin-top:3.427rem;">本人確認書類確認済み</view>
            									<view v-else style="font-size: 3.18rem;color: #666666;margin-top:3.427rem;">本人確認書類提出済み</view>
            								</view>
            							</view>
            							<view v-if="bianji==0" @click="bianjix"
            								style="width:12.755rem;height:5.32rem;background: #F44870;border-radius: 0.79rem;font-size: 2.21rem;color: #FFFFFF;line-height:5.32rem;text-align: center;cursor: pointer;">
            								編集する</view>
            							<view v-if="bianji==1" @click="wancheng"
            								style="width:12.755rem;height:5.32rem;background: #F44870;border-radius: 0.79rem;font-size: 2.21rem;color: #FFFFFF;line-height:5.32rem;text-align: center;cursor: pointer;">
            								編集を完了します</view>
            						</view>
            					</view>
            					<view class="flexJusp"
            						style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-top:2rem;align-items: center;flex-direction: column;">
            						<view>
            							<view style="font-weight:bold;font-size:3.41rem;height:3rem;">￥{{btnActive?Math.floor(detail.money/1.2):0}}（引き出し申請中：￥{{btnActive?0:Math.floor(detail.integral/1.2)}}）</view>
            							<view style="font-size: 2.64rem;color: #666666;margin-top:2rem;">
											送金を申請する前に、以下の内容を必ずご確認ください。<br>
											・表示の金額(移動実費額)をお引き出しいただけます。<br>（手数料分は同乗者さまに請求しているため、ドライバーさまには請求御座いません。）<br>
											・お引き出しは1,100円以上で申請できます。<br>
											・申請後、メール宛に振込先口座情報をお送りください。<br>　wely@wayslink.me<br>
											</view>
            						</view>
            						<view @click="getMoney"  v-if='btnActive' v-show='detail.money>=1100'
            							style="width:12.755rem;height:5.32rem;;background: #F44870;border-radius: 0.79rem;font-size: 2.21rem;color: #FFFFFF;line-height:5.32rem;text-align: center;cursor: pointer;">
            							引き出し</view>
									<view  v-if='btnActive' v-show='detail.money<1100'
										style="width:12.755rem;height:5.32rem;;background: #CCC;border-radius: 0.79rem;font-size: 2.21rem;color: #FFFFFF;line-height:5.32rem;text-align: center;cursor: pointer;">
										引き出し</view>
            						<view v-else v-show='detail.money'
            							style="width:12.755rem;height:5.32rem;background: #CCCCCC;border-radius: 0.79rem;font-size: 2.21rem;color: #FFFFFF;line-height:5.32rem;text-align: center;cursor: pointer;">
            							引き出し確認中</view>
            					</view>
            					<view 
            						style="padding: 2.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-top:2rem;align-items: center;">
            						<h2 style='font-size: 3.41rem;'>本人確認書類提出</h2>
            						<view style='padding:1rem 3rem;'>
            							<view class="flexJusp" style="align-items: center;margin-top:1.423rem;margin-bottom:3.53rem">
            								<image v-if="detail.isAuth==1" style="width: 3.16rem;height:2.214rem;"
            									src="/static/images/re.png"></image>
            								<view v-else @click="upImagex"
            									style="width:16rem;height:5.62rem;background: #F44870;border-radius: 0.79rem;font-size: 2.264rem;color: #FFFFFF;line-height:5.62rem;text-align: center;cursor: pointer;">
            									アップロード</view>
            							</view>
            							<text style='font-size: 2.28rem;'>
            							【ドライバー・利用者共通】各種健康保険証
            								・ご本人様のお名前・生年月日・性別記載面（カードタイプの場合は両面）
            								※被保険者等記号・番号、保険者番号、2次元バーコード等はペン等で復元できないよう、黒く塗りつぶしてください。
            								※介護保険証は、本人確認書類として取り扱いできません。
            	
            								マイナンバー(個人番号)カード
            								・ご本人様のお名前・生年月日・性別記載面（マイナンバーの記載がある裏面は不要）
            								※通知カード（写真なし）は不可
            	
            								住民票の写し
            								・発行日から6ヵ月以内のもの
            	
            								在留カード・特別永住者証明書等
            								・ご本人様のお名前・生年月日・性別記載面（裏面に変更情報がある場合は両面）
            	
            								パスポート
            								・ご本人様のお名前・生年月日・性別記載面
            						</text></view>
            					
            					</view>
									<view style='height:6rem'></view>
            				</view>
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
				details: {},
				detail: {},
				btnActive: true,
				bianji: 0
			}
		},
		onLoad() {
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			upImages() {
				var that = this
				uni.chooseImage({
					count: 1, //默认9
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], //从相册选择
					success: async (img) => {
						that.$upShop('api/uploadImage', img.tempFilePaths[0]).then(rex => {
							let arr = JSON.parse(rex.data)
							that.detail.avatar = arr.data.image
						}).catch((e) => {});
					}
				})
			},
			upImagex() {
				var that = this
				uni.chooseImage({
					count: 1, //默认9
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], //从相册选择
					success: async (img) => {
						that.$upShop('api/uploadImage', img.tempFilePaths[0]).then(rex => {
							let arr = JSON.parse(rex.data)
							// that.detail.avatar = arr.data.image
							that.$httpapi('project/submitAudit', 'POST', {
								customerId: uni.getStorageSync('customerId'),
								numberImage: arr.data.image
							}).then(res => {
								that.$refs.toast.show({
									message:'アップロードしました',
									duration: 2000
								});
								that.shuaxin()
							})
						}).catch((e) => {});
					}
				})
			},
			bianjix() {
				this.bianji = 1


			},
			getMoney() {
				// this.bianji = 1
				this.$httpapi('project/withdraw', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if(res.code==200){
						this.$refs.toast.show({
							message: 'キャッシュアウト開始しました',
							duration: 2000
						});
						this.btnActive = false
						this.loads()
					}else{
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					
					
				})

			},
			wancheng() {
				this.bianji = 0
				this.$httpapi('project/editProCustomer', 'POST', {
					customerId: uni.getStorageSync('customerId'),
					name: this.detail.name,
					avatar: this.detail.avatar
				}).then(res => {
					this.$refs.toast.show({
						message: '保存しました',
						duration: 2000
					});
					this.shuaxin()
				})
			},
			shuaxin() {
				this.$httpapi('project/getCustomerIntroduce', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
						return
					}
					uni.setStorageSync('isAuth', res.data.isAuth)
					uni.setStorageSync('isDriver',  res.data.isDriver)
					this.$refs.headers.gengxin(res.data);
				})
			},
			loads() {
				this.$httpapi('project/getCustomerIntroduce', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
						return
					}
					if (res.data.isAuth == 0) {
						this.$refs.toast.show({
							message: '本人確認書類をアップロードしてくだい',
							duration: 2000
						});
					}
					this.detail = res.data
					uni.setStorageSync('isAuth', res.data.isAuth)
					uni.setStorageSync('isDriver',  res.data.isDriver)
					if (this.detail.integral) {
						this.btnActive = false
					}
				})
			},
			vehicle() {
				uni.navigateTo({
					url: '/pages/index/VehicleRegistration/VehicleRegistration'
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
			width: 21.661rem;
			height: 4.427rem;
			border-radius: 1.264rem 1.264rem 1.264rem 1.264rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size: 1.581rem;
			color: #F44870;
			line-height: 4.427rem;
			text-align: center;
			margin: 2.055rem auto 0;
			cursor: pointer;
		}
	}
</style>