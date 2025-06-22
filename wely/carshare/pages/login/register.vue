<template>
	<view>

		<view class="content">
			<headers ref="headers" title='会員登録' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>
				<view style="height: 7.905rem;"></view>
				<view
					style="width: 113.834rem;height: 91rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto;text-align: center;">
					<view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 3.952rem;">
						会員登録</view>

					<!-- 性別 -->
					<view class="flex" style="margin: auto;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>性</text>
							<text>別</text>
						</view>
						<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
							<view class="flexJusp"
								style="width:56.285rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
								<view style="width:47.431rem;text-align: left;" v-if="array[index]">
									{{array[index].label}}
								</view>
								<view style="width:47.431rem;text-align: left;" v-else>選択してください</view>
								<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>

					<!-- 表示名 -->
					<view class="flex" style="margin:2.055rem auto;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>表</text>
							<text>示</text>
							<text>名</text>
							<text>(</text>
							<text>開</text>
							<text>示</text>
							<text>)</text>
						</view>
						<view class="flexJusp"
							style="width:56.285rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<input v-model="name" style="font-size: 1.739rem;width:47.431rem;"
								placeholder="登録された表示名が開示されます" />
						</view>
					</view>

					<!-- メールアドレス -->
					<view class="flex" style="margin: auto;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
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
						<view class="flexJusp"
							style="width:56.285rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
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
					<!-- パスワード -->
					<view class="flex" style="margin:2.055rem auto;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>パ</text>
							<text>ス</text>
							<text>ワ</text>
							<text>ー</text>
							<text>ド</text>
						</view>
						<view class="flexJusp"
							style="width:56.285rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<input v-model="password" password="password" style="font-size: 1.739rem;width:47.431rem;"
								placeholder="パスワード" />
						</view>
					</view>

					<!-- パスワード確認 -->
					<view class="flex" style="margin: auto;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
							<text>パ</text>
							<text>ス</text>
							<text>ワ</text>
							<text>ー</text>
							<text>ド</text>
							<text>確</text>
							<text>認</text>

						</view>
						<view class="flexJusp"
							style="width:56.285rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
							<input v-model="passwords" password="password" style="font-size: 1.739rem;width:47.431rem;"
								placeholder="パスワード確認" />
						</view>
					</view>

					<!-- 主な出発地 -->
					<view class="flex" style="margin:2.055rem auto 4.743rem;align-items: center;width:79.683rem;">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp">
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
							<picker @change="bindPickerChanges" :value="cityIndex" :range="listCity" range-key="city">
								<view class="flexJusp"
									style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<view v-if="listCity[cityIndex]">{{listCity[cityIndex].city}}</view>
									<view v-else style="width:24.743rem;">選択してください</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
									</image>
								</view>
							</picker>
							<picker @change="bindPickerChangex" :value="areaIndex" :range="listArea" range-key="area">
								<view class="flexJusp"
									style="width:25.138rem;height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<view v-if="listArea[areaIndex]">{{listArea[areaIndex].area}}</view>
									<view v-else style="width:24.743rem;">選択してください</view>
									<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
									</image>
								</view>
							</picker>
						</view>
					</view>

					<!-- ログインしたままにする -->
					<view class="flex" style="justify-content: center;align-items: center;cursor: pointer;"
						@click="check = !check">
						<image v-if="check" style="width: 1.581rem;height:  1.581rem;" src="/static/images/xzz.png">
						</image>
						<image v-else style="width: 1.581rem;height:  1.581rem;" src="/static/images/xzzsd.png"></image>
						<view style="margin-left:0.949rem;">ログインしたままにする</view>
					</view>

					<!-- 会員登録ボタン -->
					<view class="buttons" @click="validateAndRegister">会員登録</view>
					<view style="color: #F44870;cursor: pointer;" @click="login">アカウントをお持ちの方はこちらからログイン</view>
					<view style="height:2rem;"></view>
				</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>

				<view style="height: 18.69rem;"></view>
				<view
					style="width: 100vw;background: #FFFFFF;border-radius:  2.372rem;text-align: center;padding-top:3.64rem;">
					<!-- <view style="font-weight: bold;font-size: 1.897rem;color: #000000;padding: 2.529rem 0 3.952rem;">
						会員登録</view> -->

					<!-- 性別 -->
					<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem)">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
							<text>性</text>
							<text>別</text>
						</view>
						<picker @change="bindPickerChange" :value="index" :range="array" range-key="label">
							<view class="flexJusp mobile_input" style="">
								<view class='inputT' style="font-size: 2.95rem;margin-left:3.18rem;"
									v-if="array[index]">
									{{array[index].label}}
								</view>
								<view class='inputT' style="font-size: 2.95rem;margin-left:3.18rem" v-else>選択してください
								</view>
								<image style="width:2.83rem;height:2.83rem;margin-right:3rem"
									src="/static/images/gddu.png"></image>
							</view>
						</picker>
					</view>

					<!-- 表示名 -->
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
							<input v-model="name" class='inputT'  style='width:55rem'  placeholder="登録された表示名が開示されます" />
						</view>
					</view>

					<!-- メールアドレス -->
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
					<!-- パスワード -->
					<view class="flex" style="margin:2.055rem auto;width:calc(100vw - 5.46rem)">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
							<text>パ</text>
							<text>ス</text>
							<text>ワ</text>
							<text>ー</text>
							<text>ド</text>
						</view>
						<view class="flexJusp mobile_input">
							<input v-model="password" password="password" class='inputT' placeholder="パスワード" />
						</view>
					</view>

					<!-- パスワード確認 -->
					<view class="flex" style="margin: auto;width:calc(100vw - 5.46rem)">
						<view style="width:17.154rem;margin-right:2.529rem;" class="flexJusp login_h1">
							<text>パ</text>
							<text>ス</text>
							<text>ワ</text>
							<text>ー</text>
							<text>ド</text>
							<text>確</text>
							<text>認</text>

						</view>
						<view class="flexJusp mobile_input">
							<input v-model="passwords" password="password" class='inputT' placeholder="パスワード確認" />
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

					<!-- ログインしたままにする -->
					<view style="justify-content: center;cursor: pointer;display: flex;align-items: center"
						@click="check = !check">
						<image v-if="check" style="width: 3.18rem;height:  3.18rem" src="/static/images/xzz.png">
						</image>
						<image v-else style="width: 3.18rem;height: 3.18rem" src="/static/images/xzzsd.png"></image>
						<view style="margin-left:0.949rem;font-size: 3.18rem;">ログインしたままにする</view>
					</view>

					<!-- 会員登録ボタン -->
					<view class="buttons" @click="validateAndRegister">会員登録</view>
					<view style="color: #F44870;cursor: pointer;font-size: 2.95rem;" @click="login">
						アカウントをお持ちの方はこちらからログイン</view>
					<view style="height:2rem;"></view>
				</view>
				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				
			</view>

		</view>
      <toast ref="toast"></toast>

	</view>
</template>

<script>
	export default {
		data() {
			return {
				check: true,
				array: [{
						label: '男性',
						value: '0'
					},
					{
						label: '女性',
						value: '1'
					}
				],
				phone: '',
				index: -1, // 性別
				name: '', // 表示名
				email: '', // メールアドレス
				password: '', // パスワード
				passwords: '', // パスワード確認
				city: '', // 市
				area: '', // 地区
				listCity: [], // 市リスト
				listArea: [], // 地区リスト
				cityIndex: -1, // 市選択インデックス
				areaIndex: 0, // 地区選択インデックス
				zhuce: true // 登録ボタンの状態
			};
		},
		onLoad() {
			this.loads();
		},
		methods: {
			bindPickerChange(e) {
				if (e.detail.value == 0) {
					location.href =
						"https://forms.gle/ZZa7omZPBWaPwZXz9"
				} else {
					this.index = e.detail.value
				}
			},
			// バリデーションと登録処理
			validateAndRegister() {
				// 必須項目のバリデーション
				if (this.index === -1) {
					return this.$refs.toast.show({
						message: '性別を選択してください',
						duration: 2000
					});
				}
				if (!this.name) {
					return this.$refs.toast.show({
						message: '表示名を入力してください',
						duration: 2000
					});
				}
				if (!this.email || !this.validateEmail(this.email)) {
					return this.$refs.toast.show({
						message: '有効なメールアドレスを入力してください',
						duration: 2000
					});
				}
				if (!this.phone) {
					return this.$refs.toast.show({
						message: '携帯番号を入力してください',
						duration: 2000
					});
				}
				if (!this.password) {
					return this.$refs.toast.show({
						message: 'パスワードを入力してください',
						duration: 2000
					});
				}
				if (this.password !== this.passwords) {
					return this.$refs.toast.show({
						message: 'パスワードが一致しません',
						duration: 2000
					});
				}
				if (this.cityIndex === -1) {
					return this.$refs.toast.show({
						message: '出発地を選択してください',
						duration: 2000
					});
				}
				if (this.areaIndex === -1) {
					return this.$refs.toast.show({
						message: '出発地を選択してください',
						duration: 2000
					});
				}

				// 登録処理
				this.register();
			},

			// 登録APIコール
			register() {
				if (this.zhuce) {
					this.zhuce = false;
					this.$httpapi('project/register', 'POST', {
						name: this.name,
						email: this.email,
						password: this.password,
						phone: this.phone,
						sex: this.array[this.index].value,
						city: this.listCity[this.cityIndex]?.city || '',
						area: this.listArea[this.areaIndex]?.area || ''
					}).then(res => {
						if (res.code === 200) {
							this.$refs.toast.show({
								message: '会員登録しました',
								duration: 2000
							});
							setTimeout(() => {
								this.zhuce = true;
								uni.navigateBack();
							}, 1000);
						} else {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
							this.zhuce = true;
						}
					});
				}
			},

			// メールアドレスのバリデーション
			validateEmail(email) {
				const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				return re.test(email);
			},

			// 市データの取得
			loads() {
				this.$httpapi('project/getCityList', 'POST', {}).then(res => {
					this.listCity = res.data;
				});
			},
			bindPickerChanges(e) {
				this.cityIndex = e.detail.value;
				this.areaIndex = 0;
				this.cunList();
			},
			bindPickerChangex(e) {
				this.areaIndex = e.detail.value;
			},
			cunList() {
				this.$httpapi('project/getAreaList', 'POST', {
					city: this.listCity[this.cityIndex].city
				}).then(res => {
					this.listArea = res.data;
				});
			},
			login() {
				uni.redirectTo({
					url: '/pages/login/login'
				});
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
			margin: 1.423rem auto 2.371rem;
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

		@media screen and (max-width: 768px) {
			.buttons {
				margin: 3.18rem auto 3.64rem;
				width: 75rem;
				height: 10.23rem;
				background: #F44870;
				border-radius: 2.27rem;
				font-size: 3.41rem;
				color: #FFFFFF;
				line-height: 10.23rem;
				text-align: center;
				cursor: pointer;
			}


		}
	}
</style>