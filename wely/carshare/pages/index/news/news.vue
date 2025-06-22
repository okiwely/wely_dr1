<template>
	<view>
		<view class="content">
			<headers ref="headers" title='メッセージ一覧' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<Navigation :pageIndex="'8'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
			<view class='pc-only'>


				<view style="height:14.229rem;"></view>
				<view
					style="font-weight: bold;font-size: 1.897rem;color: #000000;margin: 2.372rem auto;width:113.834rem;">
					メッセージ一覧</view>
				<view style="width: 113.834rem;margin:0 auto  2.372rem;">
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius:1.581rem;padding:1.265rem 2.529rem 1.423rem 1.581rem;align-items: center;margin-bottom:1.423rem;">

						<view style="width:94rem;">
							<!-- 用户头像和姓名 -->
							<view class="flex" style="align-items: center;" @click="topersonal(item)">
								<image style="width:4.584rem;height:4.584rem;border-radius:50%;margin-right:1.107rem;"
									:src="item.avatar"></image>
								<view style="font-weight: bold;font-size: 1.581rem;">{{item.name}}</view>
							</view>

							<!-- 消息内容 -->
							<view style="font-size: 1.264rem;margin-top:1.423rem;">{{item.content}}</view>

							<!-- 手机号显示 -->
							<view style="font-size: 1.264rem;margin-top:0.5rem;">電話番号: {{item.phone}}</view>

							<!-- 行程详情链接 -->
							<view v-show='item.routeId' @click="navigateToRouteDetail(item.routeId)"
								style="font-size: 1.264rem; color: #1E90FF; cursor: pointer; margin-top:0.5rem;">
								ドライブの詳細へ
							</view>
						</view>

						<!-- 同意按钮 -->
						<view @click="personal(item)" v-if="item.isShow==1"
							style="width: 10.435rem;height: 4.585rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size: 1.739rem;color: #FFFFFF;line-height: 4.585rem;text-align: center;cursor: pointer;">
							承認する
						</view>
					</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height:18.69rem;"></view>
				<view
					style="font-weight: bold;font-size: 3.18rem;color: #000000;margin: 3.64rem 0 2.73rem 3.18rem;width:calc(100vw - 6.36rem);">
					メッセージ一覧</view>
				<view style="width:calc(100vw - 6.36rem);margin:0 auto ">
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius:1.581rem;padding:1.265rem 2.529rem 1.423rem 1.581rem;align-items: center;margin-bottom:1.423rem;">

						<view style="width:94rem;">
							<!-- 用户头像和姓名 -->
							<view class="flex" style="align-items: center;" @click="topersonal(item)">
								<image style="width:10.45rem;height:10.45rem;border-radius:50%;margin-right:2.73rem;"
									:src="item.avatar"></image>
								<view style="font-weight: bold;font-size: 3.41rem;">{{item.name}}</view>
							</view>

							<!-- 消息内容 -->
							<view style="font-size:2.95rem;margin-top:1.423rem;">{{item.content}}</view>

							<!-- 手机号显示 -->
							<view style="font-size: 2.95rem;margin-top:0.5rem;">電話番号: {{item.phone}}</view>

							<!-- 行程详情链接 -->
							<view v-show='item.routeId' @click="navigateToRouteDetail(item.routeId)"
								style="font-size: 2.95rem; color: #1E90FF; cursor: pointer; margin-top:0.5rem;">
								ドライブの詳細へ
							</view>
						</view>

						<!-- 同意按钮 -->
						<view @click="personal(item)" v-if="item.isShow==1"
							style="margin-top:-11rem;width: 11.59rem;height: 5rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size: 2.73rem;color: #FFFFFF;line-height: 5rem;text-align: center;cursor: pointer;">
							承認する
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
				check: false,
				array: ['普通自動車~1300cc', '1300cc~2300cc'],
				index: -1,
				arrays: ['1', '2', '3', '4', '5'],
				indexs: -1,
				arrayx: ['レギュラ—', 'レギュラ二'],
				indexx: -1,
				types: 0,
				list: []
			}
		},
		onShow() {
			this.loads()
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			// 跳转到个人信息页面
			topersonal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation?id=' + item.customerId
				})
			},

			// 处理“承認”按钮点击事件
			personal(item) {

				uni.showModal({
					title: '確認',
					content: 'あなたの電話番号が同乗者に共有されます。続行してもよろしいですか？',
					cancelText:'キャンセル',
					confirmText:'確認',
					success: (res) => {
						if (res.confirm) {
							// 用户点击确认，继续执行请求
							this.$httpapi('project/consentRoute', 'POST', {
								customerId: uni.getStorageSync('customerId'),
								chatId: item.id
							}).then(res => {
								if (res.code == 500) {
									this.$refs.toast.show({
										message: res.msg,
										duration: 2000
									});
								} else {
									this.$refs.toast.show({
										message: '承認しました',
										duration: 2000
									});
								}
								this.loads(); // 重新加载列表
							}).catch(error => {
								// 处理请求错误
								console.error('Error in consentRoute:', error);
								this.$refs.toast.show({
									message: 'リクエスト送信中にエラーが発生しました。',
									duration: 2000
								});
							});
						} else if (res.cancel) {
							// 用户点击取消，不执行任何操作
							console.log('ユーザーが操作をキャンセルしました。');
						}
					},
					fail: (err) => {
						// 处理显示对话框失败的情况
						console.error('Error showing modal:', err);
						this.$refs.toast.show({
							message: '確認ダイアログの表示中にエラーが発生しました。',
							duration: 2000
						});
					}
				});
			},

			// 切换类型
			qiehuan(type) {
				this.types = type
			},

			// 处理 Picker 改变事件
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

			// 加载消息列表
			loads() {
				this.$httpapi('project/getTbCustomerChatList', 'POST', {
					customerId: uni.getStorageSync('customerId'),
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.list = res.data
				})
			},

			// 跳转到首页
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
			},

			// 跳转到注册页面
			register() {
				uni.navigateTo({
					url: '/pages/login/register'
				})
			},

			// 新增方法：跳转到行程详情页
			navigateToRouteDetail(routeId) {
				if (routeId) {
					uni.navigateTo({
						url: `/pages/index/IndexLise/ListDetails?id=${routeId}`
					})
				} else {
					this.$refs.toast.show({
						message: 'マッチングIDが見つかりません。',
						duration: 2000
					});
				}
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
			margin: 3.162rem auto 7.115rem;
			width: 35.89rem;
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
	}
</style>