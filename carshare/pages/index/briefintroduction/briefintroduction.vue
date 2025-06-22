<template>
	<view class="contents">
		<headers ref="headers" title='プロフィール' style="position: fixed;top:0;left:0;z-index: 1;"></headers>

		<view class='pc-only'>
			<Navigation :pageIndex="'4'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
			<view style="height:14.229rem;"></view>
			<view style="font-size:  1.581rem;margin: 2.372rem auto  2.529rem;width:113.834rem;"><text
					style="cursor: pointer;" @click="indexs">TOPページ >></text><text style="color: #FF3D66;">プロフィール</text>
			</view>

			<view
				style="width: 113.834rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto 7.51rem;text-align: center;padding-bottom:1px;">
				<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 3.952rem;">
					プロフィール
				</view>
				<view class="flex" style="margin: auto;align-items: center;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp">
						<text>性</text>
						<text>別</text>
					</view>
					<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
						<view class="flexJusp"
							style="width:56.284rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<view style="width:47.431rem;text-align: left;" v-if="array[index]">
								{{array[index].label}}
							</view>
							<view style="width:47.431rem;text-align: left;" v-else>選択してください</view>
							<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
						</view>
					</picker>
					<!-- 	<picker @change="bindPickerChange" :value="index" :range="array">
								<view class="flexJusp"
									style="width:56.284rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<view style="width:47.431rem;text-align: left;">{{array[index]||'選択してください'}}</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
								</view>
							</picker> -->
				</view>
				<view class="flex" style="margin:2.055rem auto;align-items: center;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp">
						<text>表</text>
						<text>示</text>
						<text>名</text>
						<text>(</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp"
						style="width:56.284rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
						<input v-model="name" style="font-size: 1.739rem;width:47.431rem;" placeholder="表示名" />
					</view>
				</view>
				<view class="flex" style="margin:0 auto;align-items: center;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp">
						<text>メ</text>
						<text>-</text>
						<text>ル</text>
						<text>ア</text>
						<text>ド</text>
						<text>レ</text>
						<text>ス</text>
						<text>(</text>
						<text>非</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp"
						style="width:56.284rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
						<input v-model="email" style="font-size: 1.739rem;width:47.431rem;" placeholder="メールアドレス" />
					</view>
				</view>
				<view class="flex" style="margin:2.055rem auto;align-items: center;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp">
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
									style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0 1.739rem;">
									<view style="width:200px;text-align: left;">日本</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
								</view> -->
					<view class="flexJusp"
						style="width:56.284rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0 1.739rem;">
						<input v-model="phone" style="width:30rem;" placeholder="電話番号を入力してください" />
					</view>
					<!-- </view> -->
				</view>
				<view class="flex" style="margin:0 auto;align-items: center;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp">
						<text>主</text>
						<text>な</text>
						<text>出</text>
						<text>発</text>
						<text>地</text>
						<text>(</text>
						<text>非</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp" style="width:59.763rem;text-align: left;">
						<!-- <view class="flexJusp"
									style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<view style="width:2 4.743rem;">選択してください</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
								</view>
			
								<view class="flexJusp"
									style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<view style="width:2 4.743rem;">選択してください</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
								</view> -->
						<picker @change="bindPickerChanges" :value="cityIndex" :range="listCity" range-key="city">
							<view class="flexJusp"
								style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view v-if="listCity[cityIndex]">{{listCity[cityIndex].city}}</view>
								<view v-else style="width:2 4.743rem;">選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
								</image>
							</view>

						</picker>
						<picker @change="bindPickerChangex" :value="areaIndex" :range="listArea" range-key="area">
							<view class="flexJusp"
								style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view v-if="listArea[areaIndex]">{{listArea[areaIndex].area}}</view>
								<view v-else style="width:2 4.743rem;">選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
								</image>
							</view>
						</picker>
					</view>

				</view>
				<view class="flex" style="margin:2.055rem auto 3.952rem;width:79.684rem;">
					<view style="width:17.154rem;margin-right: 2.529rem;line-height:5.217rem;" class="flexJusp">
						<text>自</text>
						<text>己</text>
						<text>紹</text>
						<text>介</text>
					</view>
					<view class="flexJusp"
						style="width:56.284rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:1.423rem  1.739rem;">
						<textarea v-model="content"
							style="font-size: 1.739rem;width:56.284rem;height:1 2.372rem;text-align: left;"
							placeholder="簡単な自己紹介、相乘り歴、ドライプのスタイルなどを記載してくださ"></textarea>
					</view>
				</view>
				<view v-show='false'>
					<view style="color: #666666;font-size: 1.581rem;"><text
							style="color: #FF1B1B;">*</text>ドライバ—として活動する方は以下の書類を全てアップロ—ドしてください。</view>
					<view class="buttonx" @click="upImage(1)">運転免許証をアップロ—ド <text v-if="drivingLicense"
							style="margin-left:1rem;"> (アップロードしました)</text> </view>
					<view class="buttonx" @click="upImage(2)">自動車保険情報をアップロ—ド<text v-if="insurance"
							style="margin-left:1rem;">
							(アップロードしました)</text></view>
					<view class="buttonx" @click="upImage(3)">車検証をアップロ—ドする<text v-if="insuranceCertificate"
							style="margin-left:1rem;"> (アップロードしました)</text></view>

				</view>

				<view class="buttonsPC" @click="baocun">保存</view>
			</view>
			<view style="height:16.126rem"></view>
			<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
		<!-- 	<toast ref="toast"></toast> -->
		</view>
		<view class='mobile-only'>
			<view style="height: 18.69rem;"></view>
			<view
				style="width: 100vw;background: #FFFFFF;border-radius:  2.372rem;text-align: center;padding-bottom:1px;">

				<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem);">
					<view style="width:17.154rem;margin-right:2.529rem;margin-top:3.64rem" class="flexJusp login_h1">
						<text>性</text>
						<text>別</text>
					</view>
					<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
						<view class="flexJusp mobile_input" style="">
							<view class='inputT' style="font-size: 2.95rem;margin-left:3.18rem;" v-if="array[index]">
								{{array[index].label}}
							</view>
							<view class='inputT' style="font-size: 2.95rem;margin-left:3.18rem" v-else>選択してください
							</view>
							<image style="width:2.83rem;height:2.83rem;margin-right:3rem" src="/static/images/gddu.png">
							</image>
						</view>
					</picker>
				</view>
				<!-- <view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem);">
						<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp login_h1">
							<text>表</text>
							<text>示</text>
							<text>名</text>
							<text>(</text>
							<text>開</text>
							<text>示</text>
							<text>)</text>
						</view>
						<view class="flexJusp"
							style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<input v-model="name" class='inputT' placeholder="表示名" />
						</view>
					</view> -->
				<view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem)">
					<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
						<text>表</text>
						<text>示</text>
						<text>名</text>
						<text>(</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp mobile_input">
						<input v-model="name" style='width:55rem' class='inputT' placeholder="登録された表示名が開示されます" />
					</view>
				</view>
				<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem)">
					<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
						<text>メ</text>
						<text>ー</text>
						<text>ル</text>
						<text>ア</text>
						<text>ド</text>
						<text>レ</text>
						<text>ス</text>
						<text>(</text>
						<text>非</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>

					</view>
					<view class="flexJusp mobile_input">
						<input v-model="email" class='inputT' placeholder="メールアドレス" />
					</view>
				</view>
				<view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem)">
					<view style="width:17.154rem;margin-right: 2.529rem;" class="flexJusp login_h1">
						<text>電</text>
						<text>話</text>
						<text>番</text>
						<text>号</text>
						<text>(</text>
						<text>非</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp mobile_input">
						<input v-model="phone" class='inputT' style='width:55rem' placeholder="電話番号を入力してください" />
					</view>
				</view>
				<!-- 主な出発地 -->
				<view class="flex" style="margin:2.055rem auto 4.743rem;width:calc(100vw - 5.46rem)">
					<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
						<text>主</text>
						<text>な</text>
						<text>出</text>
						<text>発</text>
						<text>地</text>
						<text>(</text>
						<text>非</text>
						<text>開</text>
						<text>示</text>
						<text>)</text>
					</view>
					<view class="flexJusp mobile_input" style='border:none'>
						<picker @change="bindPickerChanges" :value="cityIndex" :range="listCity" range-key="city">
							<view class="flexJusp mobile_input"
								style="width:calc(50vw - 8rem);background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;padding:0  1.739rem;">
								<view class='inputT' v-if="listCity[cityIndex]">{{listCity[cityIndex].city}}</view>
								<view v-else class='inputT'>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
								</image>
							</view>
						</picker>
						<picker @change="bindPickerChangex" :value="areaIndex" :range="listArea" range-key="area">
							<view class="flexJusp mobile_input"
								style="width:calc(50vw - 8rem);background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;padding:0  1.739rem;">
								<view class='inputT' v-if="listArea[areaIndex]">{{listArea[areaIndex].area}}</view>
								<view v-else class='inputT'>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
								</image>
							</view>
						</picker>
					</view>
				</view>
				<view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem)">
					<view style="width:17.154rem;margin-right: 2.529rem;line-height:5.217rem;"
						class="flexJusp login_h1">
						<text>自</text>
						<text>己</text>
						<text>紹</text>
						<text>介</text>
					</view>
					<view class="flexJusp "
						style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding-top:2.27rem 0;margin-top:2.5rem">
						<textarea v-model="content" class='inputT'
							style="width:calc(100vw - 11.82rem);height:1 2.372rem;text-align: left;"
							placeholder="簡単な自己紹介、相乘り歴、ドライプのスタイルなどを記載してくださ"></textarea>
					</view>
				</view>


				<view class="buttons" @click="baocun">保存</view>
			</view>
			<view style="height:58.41rem;"></view>
			<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
			


		</view>
<toast ref="toast"></toast>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				check: false,
				array: [],
				index: -1,
				name: '',
				email: '',
				phone: '',
				city: '',
				listCity: [],
				cityIndex: -1,
				listArea: [],
				areaIndex: 0,
				drivingLicense: '',
				insurance: '',
				insuranceCertificate: '',
				content: '',
				zhuce: true
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
			loadx() {
				var that = this
				this.$httpapi('project/getProCustomerInfo', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					} else {
						this.name = res.data.name
						this.email = res.data.email
						this.phone = res.data.phone
						this.content = res.data.content
						this.index = res.data.sex
						this.drivingLicense = res.data.drivingLicense
						this.insurance = res.data.insurance
						this.insuranceCertificate = res.data.insuranceCertificate

						for (let i = 0; i < this.listCity.length; i++) {
							if (this.listCity[i].city == res.data.city) {
								console.log(this.listCity[i].city, res.data.city, i)
								this.cityIndex = i
							}
						}
						setTimeout(() => {
							this.cunList(res.data.area)
						}, 1000)

					}
				})
			},
			bindPickerChange(e) {
				if (e.detail.value == 0) {
					location.href =
						"https://docs.google.com/forms/d/e/1FAIpQLSfqk-lAtoGQNyGD3GNZYL4FosfnUkZBvQk4pIqMj7sm1lNv-A/viewform"
				} else {
					this.index = e.detail.value
				}
			},
			bindPickerChanges(e) {
				this.cityIndex = e.detail.value
				this.areaIndex = 0
				this.cunList()
			},
			bindPickerChangex(e) {
				this.areaIndex = e.detail.value
			},
			upImage(type) {
				var that = this
				uni.chooseImage({
					count: 1, //默认9
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], //从相册选择
					success: async (img) => {
						// success: async (img) => {
						// let res = await that.$all.upload(img.tempFilePaths[0])
						// if(res.code==1){
						// 	that.user.avatar = res.data.url
						// }
						console.log(img.tempFilePaths)

						that.$upShop('api/uploadImage', img.tempFilePaths[0]).then(rex => {
							let arr = JSON.parse(rex.data)
							if (type == 1) {
								that.drivingLicense = arr.data.image
							} else if (type == 2) {
								that.insurance = arr.data.image
							} else if (type == 3) {
								that.insuranceCertificate = arr.data.image
							}
						}).catch((e) => {});
					}
				})
			},
			cunList(area) {
				console.log(this.listCity, this.cityIndex, '---------------')
				this.$httpapi('project/getAreaList', 'POST', {
					city: this.listCity[this.cityIndex].city
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.listArea = res.data
					for (let i = 0; i < res.data.length; i++) {
						if (res.data[i].area == res.data.area) {
							this.areaIndex = i
						}
					}
				})
			},
			baocun() {
				if (this.zhuce) {
					this.zhuce = false

					this.$httpapi('project/editProCustomer', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						name: this.name,
						sex: this.array[this.index].value,
						email: this.email,
						phone: this.phone,
						city: this.listCity[this.cityIndex].city,
						area: this.listArea[this.areaIndex].area,
						drivingLicense: this.drivingLicense,
						insurance: this.insurance,
						insuranceCertificate: this.insuranceCertificate,
						content: this.content
					}).then(res => {
						if (res.code == 200) {
							this.$refs.toast.show({
								message: '保存しました。',
								duration: 2000
							});
						} else {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}

						this.zhuce = true
					})
				}
			},
			loads() {
				this.$httpapi('api/dictData/', 'POST', {
					type: 'sys_user_sex'
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.array = res.data
				})
				this.$httpapi('project/getCityList', 'POST', {}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.listCity = res.data
					this.loadx()
				})

			},
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
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
	@media screen and (max-width: 768px) {
		.flex {
			flex-direction: column;
		}

	}

	page {
		background-color: #F6F6F6;
	}

	.contents {
		min-height: 100vh;
		position: relative;

		.buttons {
			margin: 3.952rem auto 3.162rem;
			width: 37.95rem;
			height: 9.77rem;
			background: #F44870;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.41rem;
			color: #FFFFFF;
			border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
			line-height: 9.77rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
		.buttonsPC{
			margin: 3.952rem auto 3.162rem;
			    width: 49.486rem;
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