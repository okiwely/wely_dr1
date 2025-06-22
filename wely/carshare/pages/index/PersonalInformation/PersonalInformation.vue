<template>
	<view>

		<view class="content">
			<headers ref="headers" canGoBack="true" :title='detail.name'
				style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>

				<!-- 	<Navigation  :pageIndex="''" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation> -->
				<view style="height: 7.905rem;"></view>
				<view
					style="font-weight: bold;font-size: 1.897rem;color: #888888;line-height:1.897rem;margin: 2.372rem auto 2.925rem;width:139.13rem;">
					<text @click="back" style="cursor: pointer;">前のページに戻ります</text>
				</view>
				<view class="flex" style="margin: 2.372rem auto;width:113.834rem;">
					<view style="width:30.988rem;">
						<view
							style="width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem 1.581rem 1.897rem;">
							<view style="font-weight: bold;font-size:  1.739rem;margin-bottom: 1.581rem;">ユーザー</view>
							<view class="flex">
								<view style="margin-right:0.949rem;position: relative;">
									<image style="width:8.221rem;height:8.221rem;border-radius:50%;"
										:src="detail.avatar"></image>
									<image
										style="width: 1.739rem;height: 1.739rem;position: absolute;bottom:0;right:13px;"
										src="/static/images/nv.png"></image>
								</view>
								<view>
									<view
										style="font-weight: bold;font-size:  1.739rem;color: #000000;padding:0.79rem 0  2.529rem;">
										{{detail.name}}
									</view>
									<view style="font-size: 1.423rem;color: #666666;">本人確認書類提出済み</view>
								</view>
							</view>
							<!-- <view class="buttons">コンタクト</view> -->
							<!-- <view class="flex" style="align-items: center;margin-top:5rem">
									<image style="width:2.055rem;height: 1.66rem;" src="/static/images/c.png"></image>
									<view style="font-size: 1.423rem;color: #000000;margin-left:0.79rem;">車:{{111}}
									</view>
								</view> -->
						</view>
					</view>
					<view style="width:104.98rem;margin:0 0 0  3.162rem;">
						<view
							style="padding: 1.739rem 1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom:2.213rem;">
							<view class="flexJusp" style="font-weight: bold;font-size:  1.739rem;">
								<view>自己紹介</view>
								<!-- <view style="color: #FF3D66;">本人確認とは</view> -->
							</view>
							<view style="margin-top:1.423rem;font-size: 1.423rem;color: #666666;">{{content}}</view>
						</view>
						<view class="flexJusp"
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size:  1.739rem;">全体評価</view>
							<view style="font-size: 1.423rem;">
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:11.383rem;">
										<text>非</text><text>常</text><text>に</text><text>索</text><text>晴</text><text>ら</text><text>し</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:31.62rem;border-radius:5px;overflow: hidden;">
										<progress style="width:31.62rem;" :percent="detail.appraise[5]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[5]}}</view>
								</view>
								<view class="flex" style="align-items: center;margin:0.949rem 0;">
									<view class="flexJusp" style="width:11.383rem;">
										<text>索</text><text>晴</text><text>ら</text><text>し</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:31.62rem;border-radius:5px;overflow: hidden;">
										<progress style="width:31.62rem;" :percent="detail.appraise[4]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[4]}}</view>
								</view>
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:11.383rem;">
										<text>普</text><text>通</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:31.62rem;border-radius:5px;overflow: hidden;">
										<progress style="width:31.62rem;" :percent="detail.appraise[3]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[3]}}</view>
								</view>
								<view class="flex" style="align-items: center;margin:0.949rem 0;">
									<view class="flexJusp" style="width:11.383rem;">
										<text>良</text><text>く</text><text>な</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:31.62rem;border-radius:5px;overflow: hidden;">
										<progress style="width:31.62rem;" :percent="detail.appraise[2]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[2]}}</view>
								</view>
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:11.383rem;">
										<text>非</text><text>常</text><text>に</text><text>良</text><text>く</text><text>な</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:31.62rem;border-radius:5px;overflow: hidden;">
										<progress style="width:31.62rem;" :percent="detail.appraise[1]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[1]}}</view>
								</view>
							</view>
						</view>
						<view style="font-size: 1.897rem;margin-bottom:2.055rem;">レビュ—</view>
						<view v-for="(item,index) in detail.appraiseList" :key="index" class="flex"
							style="margin-bottom:2.055rem;">
							<image style="width:5.533rem;height:5.533rem;border-radius:50%;margin-right:1.423rem;"
								:src="item.avatar"></image>
							<view
								style="width: 95.178rem;background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius: 1.264rem;padding:1.423rem 1.264rem;">
								<view class="flexJusp">
									<view style="font-weight: bold;font-size:  1.581rem;">{{item.name}}</view>
									<view class="flex" style="align-items: center;">
										<image style="width:  1.739rem;height: 1.581rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 1.423rem;color: #F88400;margin:0  1.581rem 0 0.711rem;">
											{{item.level}}
										</view>
										<view  v-if='item.level==5'  style="font-size:  1.581rem;">非常に索晴らしい</view>
										<view  v-if='item.level==4'  style="font-size:  1.581rem;">索晴らしい</view>
										<view v-if='item.level==3'  style="font-size:  1.581rem;">普 通</view>
										<view v-if='item.level==2'  style="font-size:  1.581rem;">良くない</view>
										<view  v-if='item.level==1' style="font-size:  1.581rem;">非常に良くない</view>
									</view>
								</view>
								<view style="font-size: 1.185rem;color: #888888;margin:1.265rem 0  1.581rem;">
									{{  item.createTime &&  new Date(item.createTime).toLocaleString('zh-CN', { timeZone: 'Asia/Tokyo' }).replace('T', ' ')}}
								</view>
								<view style="font-size: 1.343rem;">{{item.content}}</view>
							</view>
						</view>
					</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<!-- 	<Navigation  :pageIndex="''" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation> -->
				<view style="height: 18.69rem;"></view>

				<view class="flex" style="margin: 2.372rem auto;width:100vw;flex-wrap: wrap;">
					<view style="width:calc(100vw - 4.54rem);margin:0 auto">
						<view
							style="width:calc(100vw - 7.54rem);background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 1.423rem;padding: 1.739rem 1.581rem 1.897rem;">
							<!-- <view style="font-weight: bold;font-size:  1.739rem;margin-bottom: 1.581rem;">ユーザー</view> -->
							<view class="flex">
								<view style="margin-right:2.27rem;position: relative;">
									<image style="width:11.4rem;height:11.4rem;border-radius:50%;" :src="detail.avatar">
									</image>
									<image
										style="width: 1.81rem;height: 2.42rem;position: absolute;bottom:0;right:13px;"
										src="/static/images/nv.png"></image>
								</view>
								<view>
									<view
										style="font-weight: bold;font-size:  3.41rem;color: #000000;padding:0.79rem 0  1.09rem;">
										{{detail.name}}
									</view>
									<view style="font-size: 3.18rem;color: #666666;">本人確認書類提出済み</view>
								</view>
							</view>
						</view>
					</view>
					<view style="width:calc(100vw - 4.54rem);margin:2.27rem auto;">
						<view
							style="padding: 1.739rem 1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom:2.213rem;">
							<view class="flexJusp" style="font-weight: bold;font-size:3.18rem;">
								<view>自己紹介</view>
								<!-- <view style="color: #FF3D66;">本人確認とは</view> -->
							</view>
							<view style="margin-top:1.423rem;font-size: 2.95rem;color: #666666;">{{content}}</view>
						</view>
						<view class="flexJusp"
							style="padding:1.897rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:1.581rem;margin-bottom: 1.581rem;flex-direction: column;">
							<view style="font-weight: bold;font-size:  3.18rem;margin-bottom:2.05rem">全体評価</view>
							<view style="font-size: 2.73rem;">
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:21.82rem;">
										<text>非</text><text>常</text><text>に</text><text>索</text><text>晴</text><text>ら</text><text>し</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:47.27rem;border-radius:5px;overflow: hidden;">
										<progress style="width:47.27rem;" :percent="detail.appraise[5]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[5]}}</view>
								</view>
								<view class="flex" style="align-items: center;margin:0.949rem 0;">
									<view class="flexJusp" style="width:21.82rem;">
										<text>索</text><text>晴</text><text>ら</text><text>し</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:47.272rem;border-radius:5px;overflow: hidden;">
										<progress style="width:47.27rem;" :percent="detail.appraise[4]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[4]}}</view>
								</view>
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:21.82rem;">
										<text>普</text><text>通</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:47.27rem;border-radius:5px;overflow: hidden;">
										<progress style="width:47.27rem;" :percent="detail.appraise[3]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[3]}}</view>
								</view>
								<view class="flex" style="align-items: center;margin:0.949rem 0;">
									<view class="flexJusp" style="width:21.82rem;">
										<text>良</text><text>く</text><text>な</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:47.27rem;border-radius:5px;overflow: hidden;">
										<progress style="width:47.27rem;" :percent="detail.appraise[2]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[2]}}</view>
								</view>
								<view class="flex" style="align-items: center;">
									<view class="flexJusp" style="width:21.82rem;">
										<text>非</text><text>常</text><text>に</text><text>良</text><text>く</text><text>な</text><text>い</text>
									</view>
									<view
										style="margin:0 1.423rem 0  2.372rem;width:47.27rem;border-radius:5px;overflow: hidden;">
										<progress style="width:47.27rem;" :percent="detail.appraise[1]/total*100"
											stroke-width="10" activeColor="#F44870" />
									</view>
									<view>{{detail.appraise[1]}}</view>
								</view>
							</view>
						</view>
						<view style="font-size: 1.897rem;margin-bottom:2.055rem;">レビュ—</view>
						<view v-for="(item,index) in detail.appraiseList" :key="index" class="flex"
							style="margin-bottom:2.055rem;">

							<view
								style="width: calc(100vw - 5.45rem);background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius: 1.264rem;padding:2.27rem 0;">
								<view class="flexJusp" style='justify-content: flex-start;'>
									<image style="width:10rem;height:10rem;border-radius:50%;margin-left:2.27rem;"
										:src="item.avatar"></image>
									<view style="font-weight: bold;font-size:  3.41rem;margin-left:2.27rem">
										{{item.name}}
										<view style="font-size: 2.73rem;color: #888888;margin:1.265rem 0  1.581rem;">
										<!-- 	{{item.createTime}} -->
											{{ item.createTime &&  new Date(item.createTime).toLocaleString('zh-CN', { timeZone: 'Asia/Tokyo' }).replace('T', ' ')}}
										</view>
									</view>
									<view style='flex:1'></view>
									<view class="flex" style="margin-top:3.23rem;margin-right:2.27rem;" >
										<image style="width: 2.95rem;height: 2.73rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 2.73rem;color: #F88400;margin:0  1.581rem 0 0.711rem;">
											{{item.level}}
										</view>
										<view v-if='item.level==5' style="font-size: 2.73rem;">非常に索晴らしい</view>
										<view v-if='item.level==4' style="font-size: 2.73rem;">索晴らしい</view>
										<view v-if='item.level==3' style="font-size: 2.73rem;">普 通</view>
										<view v-if='item.level==2' style="font-size: 2.73rem;">良くない</view>
										<view v-if='item.level==1' style="font-size: 2.73rem;">非常に良くない</view>
									</view>
								</view>

								<view style="font-size: 2.73rem;padding: 2.05rem 2.27rem">{{item.content}}</view>
							</view>
						</view>
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
				total: 0,
				id: '',
				drivingLicense: '',
				insurance: '',
				insuranceCertificate: '',
				detail: {},
				content: ''
			}
		},
		onLoad(option) {
			this.id = option.id
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			back() {
				uni.navigateBack();
			},
			loads() {

				this.$httpapi('project/getProCustomerInfo', 'POST', {
					customerId: this.id,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.content = res.data.content
				})
				this.$httpapi('project/getProCustomer', 'POST', {
					customerId: this.id,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.detail = res.data
					this.total = this.detail.appraise[1] + this.detail.appraise[2] + this.detail.appraise[3] + this
						.detail.appraise[4] + this.detail.appraise[5]

					var num = 0
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