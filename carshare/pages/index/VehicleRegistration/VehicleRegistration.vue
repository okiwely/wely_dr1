<template>
	<view>

		<view class="content">

			<headers ref="headers" title='車両登録' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<Navigation :pageIndex="'5'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
			<view class='pc-only'>

				<view style="height:14.229rem;"></view>
				<view
					style="width: 113.834rem;background: #FFFFFF;border-radius: 2.372rem;margin: 2.372rem auto 7.51rem;text-align: center;padding-bottom:1px;">
					<view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">車両登録</view>
					<view style="font-size:  1.581rem;color: #666666;">ドライブ登録をされる前に車両情報をご登録ください。</view>
					<view class="flex" style="align-items: center;width:79.684rem;margin: 3.162rem auto 2.055rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp">
							<text>車</text>
							<text>両</text>
							<text>情</text>
							<text>報</text>
						</view>
						<view class="flexJusp"
							style="width:61.422rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<textarea v-model="info" maxlength="-1"
								style="font-size: 1.739rem;width:61.422rem;text-align: left;height: 4.743rem;padding: 1.739rem 0;"
								placeholder="例）ホンダ フリード 6人乗り 黒色
			     トヨタ ヴィッツ グレー"></textarea>
						</view>
					</view>
					<view class="flex" style="margin: auto;align-items: center;width:79.684rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp">
							<text>排</text>
							<text>気</text>
							<text>量</text>
						</view>
						<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
							<view class="flexJusp"
								style="width:61.422rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width:47.431rem;text-align: left;" v-if="array[index]">
									{{array[index].label}}
								</view>
								<view style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view class="flex" style="margin:2.055rem auto 1.264rem;align-items: center;width:79.684rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp">
							<text>乗</text>
							<text>車</text>
							<text>可</text>
							<text>能</text>
							<text>人</text>
							<text>数</text>
						</view>
						<picker @change="bindPickerChanges" :value="indexs" :range="arrays" range-key="label">
							<view class="flexJusp"
								style="width:61.422rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width:47.431rem;text-align: left;" v-if="arrays[indexs]">
									{{arrays[indexs].label}}
								</view>
								<view style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view class="flex" style="margin:auto;align-items: center;width:79.684rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;"></view>
						<view style="font-size: 1.423rem;color: #888888;">積載人数ではなく、ユーザーを乗せる場合の可能人数を設定ください</view>
					</view>
					<view class="flex" style="margin:2.846rem auto;align-items: center;width:79.684rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;">高速利用</view>
						<view class="flex" style="align-items: center;font-size: 1.581rem;">
							<image v-if="types==0" style="width: 1.739rem;height:  1.739rem;"
								src="/static/images/xzz.png">
							</image>
							<image @click="qiehuan(0)" v-else style="width: 1.739rem;height:1.739rem;cursor: pointer;"
								src="/static/images/isc.png"></image>
							<view @click="qiehuan(0)" style="margin:0 4.743rem 0 0.948rem;cursor: pointer;">
								{{etcList[0].label}}
							</view>

							<image v-if="types==1" style="width: 1.739rem;height:  1.739rem;"
								src="/static/images/xzz.png">
							</image>
							<image @click="qiehuan(1)" v-else style="width: 1.739rem;height:1.739rem;cursor: pointer;"
								src="/static/images/isc.png"></image>
							<view @click="qiehuan(1)" style="margin:0 4.743rem 0 0.948rem;cursor: pointer;">
								{{etcList[1].label}}
							</view>
						</view>

					</view>
					<view class="flex" style="margin: auto;align-items: center;width:79.684rem;">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp">
							<text>ガ</text>
							<text>ソ</text>
							<text>リ</text>
							<text>ン</text>
							<text>タ</text>
							<text>イ</text>
							<text>プ</text>
						</view>
						<picker @change="bindPickerChangex" :value="indexx" :range="arrayx" range-key="label">
							<view class="flexJusp"
								style="width:61.422rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width:47.431rem;text-align: left;" v-if="arrayx[indexx]">
									{{arrayx[indexx].label}}
								</view>
								<view style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view style="color: #666666;font-size: 1.581rem;margin-top:5rem"><text
							style="color: #FF1B1B;">*</text>ドライバ—として活動する方は以下の書類を全てアップロ—ドしてください。</view>
					<view :class="drivingLicense?'buttonyPC':'buttonxPC'" @click="upImage(1)">運転免許証をアップロ—ド <text
							v-if="drivingLicense" style="margin-left:1rem;"> (アップロードしました)</text> </view>
					<view :class="insurance?'buttonyPC':'buttonxPC'" @click="upImage(2)">自動車保険情報をアップロ—ド<text
							v-if="insurance" style="margin-left:1rem;">
							(アップロードしました)</text></view>
					<view :class="insuranceCertificate?'buttonyPC':'buttonxPC'" @click="upImage(3)">車検証をアップロ—ドする<text
							v-if="insuranceCertificate" style="margin-left:1rem;"> (アップロードしました)</text></view>
					<view class="buttons" @click="addCar">保存</view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<view style="height:18.69rem;"></view>
				<view
					style="width: 100vw;background: #FFFFFF;border-radius: 2.372rem;text-align: center;padding-bottom:1px;padding-top:2.95rem ;">

					<view
						style="font-family: Source Han Sans CN, Source Han Sans CN;font-weight: 500;font-size: 2.73rem;color: #666666;text-align: center;font-style: normal;text-transform: none;">
						ドライブ登録をされる前に車両情報をご登録ください。</view>
					<view class="flex" style="margin:3.18rem auto;width:calc(100vw - 5.46rem)">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp login_h1">
							<text>車</text>
							<text>両</text>
							<text>情</text>
							<text>報</text>
						</view>
						<view class="flexJusp mobile_input"
							style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;">
							<textarea v-model="info" maxlength="-1" class='inputT'
								style="text-align: left;height: 4.743rem;"
								placeholder="例）ホンダ フリード 6人乗り 黒色トヨタ ヴィッツ グレー"></textarea>
						</view>
					</view>
					<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem)">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp login_h1">
							<text>排</text>
							<text>気</text>
							<text>量</text>
						</view>
						<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
							<view class="flexJusp mobile_input"
								style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;;">
								<view class='inputT' style="width:47.431rem;text-align: left;" v-if="array[index]">
									{{array[index].label}}
								</view>
								<view class='inputT' style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width: 4.32rem;height:2.27rem;margin-right:3.18rem"
									src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem)">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp login_h1">
							<text>乗</text>
							<text>車</text>
							<text>可</text>
							<text>能</text>
							<text>人</text>
							<text>数</text>
						</view>
						<picker @change="bindPickerChanges" :value="indexs" :range="arrays" range-key="label">
							<view class="flexJusp mobile_input"
								style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;">
								<view class='inputT' style="width:47.431rem;text-align: left;" v-if="arrays[indexs]">
									{{arrays[indexs].label}}
								</view>
								<view class='inputT' style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width: 4.32rem;height:2.27rem;margin-right:3.18rem"
									src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>
					<view class="flex" style="margin:auto;width:calc(100vw - 5.46rem)">
						<view style="width:12.174rem;margin-right: 2.529rem;"></view>
						<view
							style="font-family: Source Han Sans CN, Source Han Sans CN;font-weight: 500;font-size: 2.73rem;color: #888888;text-align: left;font-style: normal;text-transform: none">
							積載人数ではなく、ユーザーを乗せる場合の可能人数を設定ください</view>
					</view>
					<view class="flex" style="margin:2.846rem auto;width:calc(100vw - 5.46rem);">
						<view style=";margin-right: 2.529rem;margin-bottom:1.95rem" class='login_h1'>高速利用</view>
						<view class="flex" style="align-items: center;font-size: 2.95rem;flex-direction: row;">
							<image v-if="types==0" style="width: 3.41rem;height:  3.41rem;"
								src="/static/images/xzz.png">
							</image>
							<image @click="qiehuan(0)" v-else style="width: 3.41rem;height:3.41rem;cursor: pointer;"
								src="/static/images/isc.png"></image>
							<view @click="qiehuan(0)" style="margin:0 4.743rem 0 0.948rem;cursor: pointer;">
								{{etcList[0].label}}
							</view>

							<image v-if="types==1" style="width: 3.41rem;height:  3.41rem;"
								src="/static/images/xzz.png">
							</image>
							<image @click="qiehuan(1)" v-else style="width: 3.41rem;height:3.41rem;cursor: pointer;"
								src="/static/images/isc.png"></image>
							<view @click="qiehuan(1)" style="margin:0 4.743rem 0 0.948rem;cursor: pointer;">
								{{etcList[1].label}}
							</view>
						</view>

					</view>
					<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem)">
						<view style="width:12.174rem;margin-right: 2.529rem;" class="flexJusp login_h1">
						<text>ガ</text>
						<text>ソ</text>
						<text>リ</text>
						<text>ン</text>
						<text>タ</text>
						<text>イ</text>
						<text>プ</text>
					</view>
					<picker @change="bindPickerChangex" :value="indexx" :range="arrayx" range-key="label">
						<view class="flexJusp mobile_input"
							style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;">
							<view class='inputT' style="width:47.431rem;text-align: left;" v-if="arrayx[indexx]">
								{{arrayx[indexx].label}}
							</view>
							<view class='inputT' style="width:47.431rem;text-align: left;" v-else>選択してください</view>
							<image style="width: 4.32rem;height:2.27rem;margin-right:3.18rem"
								src="/static/images/gddu.png"></image>
						</view>
					</picker>
				</view>
				<view class='car_intro' style='margin:3.18rem auto;width:calc(100vw - 5.46rem)'>
					<text
						style="color: #FF1B1B;">*</text>ドライバ—として活動する方は以下の書類を全てアップロ—ドしてください。
				</view>
				<view :class="drivingLicense?'buttony':'buttonx'" @click="upImage(1)">運転免許証をアップロ—ド <text
						v-if="drivingLicense" style="margin-left:1rem;"> (アップロードしました)</text> </view>
				<view :class="insurance?'buttony':'buttonx'" @click="upImage(2)">自動車保険情報をアップロ—ド<text v-if="insurance"
						style="margin-left:1rem;">
						(アップロードしました)</text></view>
				<view :class="insuranceCertificate?'buttony':'buttonx'" @click="upImage(3)">車検証をアップロ—ドする<text
						v-if="insuranceCertificate" style="margin-left:1rem;"> (アップロードしました)</text></view>
				<view class="buttons" @click="addCar">保存</view>
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
				sex: -1,
				name: '',
				email: '',
				phone: '',
				content: '',
				array: [],
				index: -1,
				arrays: [],
				indexs: -1,
				arrayx: [],
				indexx: -1,
				types: 0,
				drivingLicense: '',
				insurance: '',
				insuranceCertificate: '',
				etcList: [],
				detail: {},
				info: ''
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
			qiehuan(type) {
				this.types = type
			},
			bindPickerChange(e) {
				this.index = e.detail.value
			},
			addCar() {
				if (this.info == '') {
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if (this.indexx == -1) {
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if (this.indexs == -1) {
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if (this.index == -1) {
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if (!this.drivingLicense) {
					this.$utils.showtt('書類を全てアップロ—ドしてください')
					return
				}
				if (!this.insurance) {
					this.$utils.showtt('書類を全てアップロ—ドしてください')
					return
				}
				if (!this.insuranceCertificate) {
					this.$utils.showtt('書類を全てアップロ—ドしてください')
					return
				}
				var gasoline = ''
				var total = ''
				var carCc = ''
				var isEtc = this.etcList[this.types].value
				if (this.indexx > -1) {
					gasoline = this.arrayx[this.indexx].value
				}
				if (this.indexs > -1) {
					total = this.arrays[this.indexs].value
				}
				if (this.index > -1) {
					carCc = this.array[this.index].value
				}

				this.$httpapi('project/editProCustomer', 'POST', {
					customerId: uni.getStorageSync('customerId'),
					drivingLicense: this.drivingLicense,
					insurance: this.insurance,
					insuranceCertificate: this.insuranceCertificate,
				}).then(res => {
					if (res.code == 200) {
						// this.$refs.toast.show({
						// 	message: '保存しました',
						// 	duration: 2000
						// });
					} else {
						// this.$refs.toast.show({
						// 	message: res.msg,
						// 	duration: 2000
						// });
					}
				})
				if (this.detail.id) {
					this.$httpapi('project/editTbCustomerCar', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						info: this.info,
						gasoline: gasoline,
						total: total,
						carCc: carCc,
						isEtc: isEtc
					}).then(res => {
						if (res.code == 200) {
							this.$refs.toast.show({
								message: '保存しました',
								duration: 2000
							});
						} else {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}

						// uni.setStorageSync('isDriver', '1')
					})
				} else {
					this.$httpapi('project/addTbCustomerCar', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						info: this.info,
						gasoline: gasoline,
						total: total,
						carCc: carCc,
						isEtc: isEtc
					}).then(res => {

						if (res.code == 200) {
							this.$refs.toast.show({
								message: '保存しました',
								duration: 2000
							});
						} else {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}
						uni.setStorageSync('isDriver', '1')

					})
				}
			},
			bindPickerChanges(e) {
				this.indexs = e.detail.value
			},
			bindPickerChangex(e) {
				this.indexx = e.detail.value
			},
			loads() {
				var that = this
				// var that = this
				this.$httpapi('project/getProCustomerInfo', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					} else {
						// this.name = res.data.name
						// this.email = res.data.email
						// this.phone = res.data.phone
						// this.content = res.data.content
						// this.sex = res.data.sex
						this.drivingLicense = res.data.drivingLicense
						this.insurance = res.data.insurance
						this.insuranceCertificate = res.data.insuranceCertificate

						// for(let i=0;i<this.listCity.length;i++){
						// 	if(this.listCity[i].city == res.data.city){
						// 		console.log(this.listCity[i].city,res.data.city,i)
						// 		this.cityIndex = i
						// 	}
						// }
						setTimeout(() => {
							this.cunList(res.data.area)
						}, 1000)

					}
				})
				this.$httpapi('api/dictData/', 'POST', {
					type: 'tb_car_gasoline'
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.arrayx = res.data
				})
				this.$httpapi('api/dictData/', 'POST', {
					type: 'car_cc'
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.array = res.data
				})
				this.$httpapi('api/dictData/', 'POST', {
					type: 'tb_car_total'
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.arrays = res.data
				})
				this.$httpapi('api/dictData/', 'POST', {
					type: 'yes_no'
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.etcList = res.data
				})
				setTimeout(() => {
					that.$httpapi('project/getTbCustomerCar', 'POST', {
						customerId: uni.getStorageSync('customerId')
					}).then(res => {
						if (res.code == 500) {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
							return
						}

						that.detail = res.data
						if (res.data.id) {
							uni.setStorageSync('isDriver', '1')
							that.info = res.data.info
							for (let i = 0; i < that.arrayx.length; i++) {
								if (that.arrayx[i].value == res.data.gasoline) {
									that.indexx = i
								}
							}
							for (let i = 0; i < that.array.length; i++) {
								if (that.array[i].value == res.data.carCc) {
									that.index = i
								}
							}
							for (let i = 0; i < that.arrays.length; i++) {
								if (that.arrays[i].value == res.data.total) {
									that.indexs = i
								}
							}
							for (let i = 0; i < that.etcList.length; i++) {
								if (that.etcList[i].value == res.data.isEtc) {
									that.types = i
								}
							}
						}
					})
				}, 500)
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

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			margin: 3.952rem auto 3.162rem;
			width: 49.486rem;
			height: 5.85rem;
			background: #F44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #FFFFFF;
			line-height: 5.85rem;
			text-align: center;
			cursor: pointer;
		}
		
		.buttonxPC {
			margin: 2.213rem auto 0;
			    width: 59.763rem;
			    height: 6.64rem;
			    background: #fff;
			    border-radius: 1.106rem;
			    border: 2px solid #ff3d66;
			    font-size: 1.897rem;
			    color: #ff3d66;
			    line-height: 6.64rem;
			    text-align: center;
		}
		.buttonyPC{
			margin: 2.213rem auto 0;
			    width: 59.763rem;
			    height: 6.64rem;
			    background: #fff;
			    border-radius: 1.106rem;
			    border: 2px solid #67c23a;
			    font-size: 1.897rem;
			    color: #67c23a;
			    line-height: 6.64rem;
			    text-align: center;
		}
		.buttonx {
			margin: 2.213rem auto 0;
			width: 65rem;
			height: 8.64rem;
			background: #FFFFFF;
			border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
			border: 0.14rem solid #F44870;
			color: #FF3D66;
			line-height: 6.64rem;
			text-align: center;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 2.18rem;
			line-height: 8.64rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}

		.buttony {
			margin: 2.213rem auto 0;
			width: 65rem;
			height: 8.64rem;
			background: #FFFFFF;
			border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
			border: 0.14rem solid #F44870;
			color: #67C23A;
			line-height: 8.64rem;
			text-align: center;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 2.18rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
	}
</style>