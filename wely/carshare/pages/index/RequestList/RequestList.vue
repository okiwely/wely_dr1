<template>
	<view>
		<view class='content'>
			<headers ref="headers" title='リクエスト一覧' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class="pc-only">
				<Navigation :pageIndex="'3'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view style="margin: 2.372rem auto;width:104.98rem;">
					<view class="flex" style="margin-bottom:2.055rem;">
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(1)">
							<view :style="type==1?'font-size: 1.739rem;font-weight: bold;':'font-size: 1.581rem;'">マッチング
							</view>
							<view v-if="type==1" class="xian"></view>
						</view>
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(2)">
							<view :style="type==2?'font-size: 1.739rem;font-weight: bold;':'font-size: 1.581rem;'">
								リクエスト投稿済み
							</view>
							<view v-if="type==2" class="xian"></view>
						</view>
					</view>
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;width:104.98rem;">
						<view
							style="width: 26.798rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 3.162rem  1.581rem  1.581rem;">
							<view class="flex" @click='topersonal(item)'>
								<image style="width: 10.869rem;height:10.869rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:1.107rem;">
									<view style="font-weight: bold;font-size: 1.897rem;color: #000000;">{{item.name}}
									</view>
									<view v-if="item.score!=0" class="flex"
										style="align-items: center;margin:0.949rem 0  1.581rem;">
										<image style="width: 1.739rem;height: 1.581rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 1.423rem;color: #F88400;margin:0 0.948rem 0 6px;">
											{{item.score}}
										</view>
										<view style="font-size:  1.581rem;color: #333333;">-1rating</view>
									</view>
									<view style="font-size: 1.264rem;color: #666666;">本人確認書類提出済み</view>
								</view>
							</view>
							<view v-if='item.model' class="flex"
								style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view style="width:2 2.372rem;">
									<view style="font-size: 1.423rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size:1.529rem;color: #000000;margin-top:1.897rem">
										￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
								</view>
								<view>
									<view
										style="font-size: 1.423rem;color: #666666;margin-left:5.2rem;text-align: center;">
										同乗人数
									</view>
									<view
										style="font-size: 1.529rem;color: #000000;margin-top:1.897rem;margin-left:5.8rem">
										{{item.alreadyTotal}}/{{item.total}}
									</view>
								</view>
							</view>

						</view>
						<view
							style="width: 44.269rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view style="font-size: 2.055rem;color: #F44870;">{{item.startTime}}</view>
							<view class="flex"
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin:2.371rem 0 1.897rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:5.059rem;height:0.79rem;margin:0  1.581rem;"
									src="/static/images/gdd.png">
								</image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width: 41.502rem;height: 7.431rem;background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:1.897rem 0;">
								<view class="flex" style="margin:1.423rem 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">
										{{item.startAddress}}
									</view>
								</view>
								<view class="flex" style="margin:0 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.endAddress}}
									</view>
								</view>
							</view>
							<view v-if='item.model' class="flex" style="align-items: center;">
								<image style="width:2.055rem;height: 1.66rem;" src="/static/images/c.png"></image>
								<view style="font-size: 1.423rem;color: #000000;margin-left:0.79rem;">車:{{item.model}}
								</view>
							</view>
						</view>
						<view v-if="item.orderStatus==0"
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<!-- <view @click="details(item)" class="buttons">レビコ—する</view> -->
							<view style='margin-top: 7rem;' @click="delects(item)" class="buttonx">削除する</view>
						</view>
						<view v-if="item.orderStatus==1"
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="zhifu(item)" class="buttons" style="margin: 6.087rem 0 0;">お支払い</view>
						</view>
						<view v-if="item.orderStatus==3"
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="pingjia(item)" class="buttons" style="margin: 6.087rem 0 0;">レビュー</view>
						</view>
					</view>
					<view class="buttonss" @click="addride">リクエスト登録</view>
				</view>
			<!-- 	<div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
					<div class="modal">
						<form id="paymentForm">
							<div class="form-group">
								<label for="cardNo">カード番号:</label>
								<input style='width:95%' v-model="cardNo" type="text" id="cardNo"
									placeholder="123456789012345">
							</div>

							<div class="form-group">
								<label for="expire">有効期間 (年月：2606):</label>
								<input style='width:95%' v-model="expire" type="text" id="expire" placeholder="2606">
							</div>

							<div class="form-group">
								<label for="securityCode">セキュリティコード:</label>
								<input style='width:95%' v-model="securityCode" type="text" id="securityCode"
									placeholder="CVC">
							</div>

							<div class="form-group">
								<label for="holderName">カード名義人:</label>
								<input style='width:95%' v-model="holderName" type="text" id="holderName"
									placeholder="TARO YAMADA">
							</div>

							<button type="button" class="payment-button" @click="submitPayment">お支払い</button>
						</form>

						<div id="result"></div>
						<button @click="showModal = false" class="close-modal-button">X</button>
					</div>
				</div> -->
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				<!-- <toast ref="toast"></toast> -->
			</view>
			<view class='mobile-only'>
				<Navigation :pageIndex="'3'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:19.229rem;"></view>
				<view style="margin: 2.372rem auto;width:calc(100vw - 4.74rem);">
					<view class="flex" style="margin-bottom:2.055rem;">
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(1)">
							<view class='list_h1' style='text-align: center;'>マッチング
							</view>
							<view v-if="type==1" class="xian"></view>
						</view>
						<view style="width:50%;text-align: center;cursor: pointer;" @click="qiehuan(2)">
							<view class='list_h1' style='text-align: center;'>リクエスト投稿済み
							</view>
							<view v-if="type==2" class="xian"></view>
						</view>
					</view>
					<!-- <view class="flexJusp" v-for="(item,index) in list" :key="index"
            				style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;width:104.98rem;">
            				<view
            					style="width: 26.798rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 3.162rem  1.581rem  1.581rem;">
            					<view class="flex" @click='topersonal(item)'>
            						<image style="width: 10.869rem;height:10.869rem;border-radius:50%;" :src="item.avatar">
            						</image>
            						<view style="margin-left:1.107rem;">
            							<view style="font-weight: bold;font-size: 1.897rem;color: #000000;">{{item.name}}</view>
            							<view v-if="item.score!=0" class="flex"
            								style="align-items: center;margin:0.949rem 0  1.581rem;">
            								<image style="width: 1.739rem;height: 1.581rem;" src="/static/images/bxs.png">
            								</image>
            								<view style="font-size: 1.423rem;color: #F88400;margin:0 0.948rem 0 6px;">
            									{{item.score}}
            								</view>
            								<view style="font-size:  1.581rem;color: #333333;">-1rating</view>
            							</view>
            							<view style="font-size: 1.264rem;color: #666666;">本人確認書類提出済み</view>
            						</view>
            					</view>
            					<view v-if='item.model' class="flex"
            						style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
            						<view style="width:2 2.372rem;">
            							<view style="font-size: 1.423rem;color: #666666;">1人あたり募集金額</view>
            							<view style="font-size:1.529rem;color: #000000;margin-top:1.897rem">
            								￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
            						</view>
            						<view>
            							<view style="font-size: 1.423rem;color: #666666;margin-left:5.2rem;text-align: center;">
            								同乗人数
            							</view>
            							<view style="font-size: 1.529rem;color: #000000;margin-top:1.897rem;margin-left:5.8rem">
            								{{item.alreadyTotal}}/{{item.total}}
            							</view>
            						</view>
            					</view>
            
            				</view>
            				<view
            					style="width: 44.269rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
            					<view style="font-size: 2.055rem;color: #F44870;">{{item.startTime}}</view>
            					<view class="flex"
            						style="align-items: center;font-weight: bold;font-size: 1.897rem;margin:2.371rem 0 1.897rem;">
            						<view class="yihang">{{item.startAddress}}</view>
            						<image style="width:5.059rem;height:0.79rem;margin:0  1.581rem;"
            							src="/static/images/gdd.png">
            						</image>
            						<view class="yihang">{{item.endAddress}}</view>
            					</view>
            					<view
            						style="width: 41.502rem;height: 7.431rem;background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:1.897rem 0;">
            						<view class="flex" style="margin:1.423rem 1.264rem;">
            							<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
            								src="/static/images/q.png"></image>
            							<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.startAddress}}
            							</view>
            						</view>
            						<view class="flex" style="margin:0 1.264rem;">
            							<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
            								src="/static/images/w.png"></image>
            							<view class="yihang" style="font-size: 1.502rem;color: #333333;">{{item.endAddress}}
            							</view>
            						</view>
            					</view>
            					<view v-if='item.model' class="flex" style="align-items: center;">
            						<image style="width:2.055rem;height: 1.66rem;" src="/static/images/c.png"></image>
            						<view style="font-size: 1.423rem;color: #000000;margin-left:0.79rem;">車:{{item.model}}
            						</view>
            					</view>
            				</view> -->
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="flex-direction:column;padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view
							style="width: calc(100vw - 10rem);height:18.18rem;border-radius:  1.581rem;padding: 2.5rem;">
							<view class="flex" @click='topersonal(item)'>
								<image style="width: 10.91rem;height:10.91rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:2.05rem;margin-top:-0.68rem">
									<view style="font-weight: bold;font-size: 3.81rem;color: #000000;">{{item.name}}
									</view>
									<view class="flex" style="align-items: center;margin:0.91rem 0 0.91rem 0;"
										v-if="item.score!=0">

										<image style="width:2.95rem;height:2.73rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 2.73rem;color: #F88400;">{{item.score}}</view>
										<view style="font-size: 2.73rem;color: #333333;">-1rating</view>
									</view>
									<view style='height:4.55rem' v-else>

									</view>
									<view v-if="item.isAuth==1" style="font-size:2.73rem;color: #666666;">本人確認書類提出済み
									</view>
								</view>
								<view style='flex:1'></view>
								<view style="font-size: 3.18rem;color: #F44870;margin-right:2.27rem">{{item.startTime}}
								</view>
							</view>
							<view
								style='height:0px;border: 0.11rem solid rgba(0,0,0,0.08);;width:calc(100vw - 10rem);margin:2.27rem auto'>

							</view>

						</view>
						<view
							style="width:calc(100vw - 10rem);margin-top:-4rem;border-radius:  1.581rem;padding: 1.581rem;">

							<view class="flex"
								style="align-items: center;font-weight: bold;font-size:3.18rem;margin:2.529rem 0 2.055rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:7.95rem;height:1.34rem;margin:0 5.36rem;"
									src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width:calc(100vw - 15.89rem);background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:0 auto;padding:2.27rem 2.73rem">
								<view class="flex" style='margin-bottom:3.41rem'>
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">起</view> -->
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">
										{{item.startAddress}}
									</view>
								</view>
								<view class="flex">
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">終</view> -->
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">{{item.endAddress}}
									</view>
								</view>
							</view>
							<view v-if='item.model' class="flex" style="align-items: center;margin-top:1.59rem">
								<image style="width:3.86rem;height:3.18rem;" src="/static/images/c.png"></image>
								<view class="yihang"
									style="font-size: 2.95rem;color: #000000;margin-left:0.79rem;width:40rem;">
									車:{{item.model}}</view>
							</view>

						</view>
						<view v-if='item.model' class="flexJusp"
							style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
							<view class='price_num'>
								<view style="color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} -
									{{Math.floor(item.maxPrice)}}
								</view>

								<view style="color: #666666;">1人あたり募集金額</view>
							</view>
							<view class='price_num'>
								<view style="color: #000000;margin-top:1.897rem">
									{{item.alreadyTotal}}/{{item.total}}
								</view>
								<view style="color: #666666;">同乗人数</view>

							</view>
						</view>
						<!-- 	<view 
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							
							<view style='margin-top: 7rem;' @click="delects(item)" class="buttonx">削除する</view>
						</view> -->
						<view v-if="item.orderStatus==0"
							style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<!-- 	<view @click="details(item)" class='detail'>詳細</view>
							<view @click="jiaru(item)" class='send' >リクエスト送信</view> -->
							<view @click="delects(item)" class="detail" style='margin:0 auto;width: 55.23rem;'>削除する
							</view>
						</view>
						<view v-if="item.orderStatus==1"
							style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<!-- 	<view @click="details(item)" class='detail'>詳細</view>
							<view @click="jiaru(item)" class='send' >リクエスト送信</view> -->
							<view @click="zhifu(item)" class="detail" style='margin:0 auto;width: 55.23rem;'>お支払い</view>
						</view>
						<view v-if="item.orderStatus==3"
							style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<!-- 	<view @click="details(item)" class='detail'>詳細</view>
							<view @click="jiaru(item)" class='send' >リクエスト送信</view> -->
							<view @click="pingjia(item)" class="detail" style='margin:0 auto;width: 55.23rem;'>レビュー</view>
						</view>
						<!-- <view v-if="item.orderStatus==1"
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="zhifu(item)" class="buttons" style="margin: 6.087rem 0 0;">お支払い</view>
						</view>
						<view v-if="item.orderStatus==3"
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="pingjia(item)" class="buttons" style="margin: 6.087rem 0 0;">评价</view>
						</view> -->
					</view>
					<view class="buttonss" @click="addride">リクエスト登録</view>
				</view>

				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				


			</view>
			<toast ref="toast"></toast>
			<div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
				<div class="modal">
					<!-- <h1>Fincode 支払示例</h1> -->
					<form id="paymentForm">
						<div class="form-group">
							<label for="cardNo">カード番号:</label>
							<input style='width:95%' v-model="cardNo" type="text" id="cardNo"
								placeholder="123456789012345">
						</div>

						<div class="form-group">
							<label for="expire">有効期間 (年月：2606)</label>
							<input style='width:95%' v-model="expire" type="text" id="expire" placeholder="2606">
						</div>

						<div class="form-group">
							<label for="securityCode">セキュリティコード:</label>
							<input style='width:95%' v-model="security_code" type="text" id="securityCode"
								placeholder="CVC">
						</div>

						<div class="form-group">
							<label for="holderName">カード名義人:</label>
							<input style='width:95%' v-model="holderName" type="text" id="holderName"
								placeholder="TARO YAMADA">
						</div>

						<button type="button" class="payment-button" @click="submitPayment">お支払い</button>
						<!--  @click="submitPayment" -->
					</form>

					<div id="result"></div>

					<!-- 关闭弹窗按钮 -->
					<button @click="showModal = false" class="close-modal-button">キャンセル</button>
				</div>
			</div>
		</view>
	</view>
</template>
<script src="../../../https/fincode"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	export default {
		data() {
			return {
				showModal: false,
				type: 1,
				list: [],
				cardNo: '',
				expire: '',
				securityCode: '',
				holderName: '',
				detailx: {},
				expire_mm: '',
				expire_yy: '',
				holder_name: '',
				security_code: '',
				amount: "500",
				fincode: '',
				publicKey: 'p_prod_MjFkMjM4ODQtY2I3YS00MzRlLWE5MDMtMGJkMTgxYzAxZWRiNTYyYzUxM2EtZDExZi00MWIwLTg1NmUtMDFkNDhlZjMzMWU3c18yNDA4MDY2OTExNQ',
				user: {
					cardNo: '',
					expire: '',
					security_code: '',
					holder_name: '',
				},
				transaction: {
					id: "",
					pay_type: 'Card',
					access_id: '',
					card_no: '',
					expire: '',
					method: '1'
				},
			}
		},
		onShow() {
			this.fincode = this.Fincode(
				'p_prod_MjFkMjM4ODQtY2I3YS00MzRlLWE5MDMtMGJkMTgxYzAxZWRiNTYyYzUxM2EtZDExZi00MWIwLTg1NmUtMDFkNDhlZjMzMWU3c18yNDA4MDY2OTExNQ'
			);
			this.loads()
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
				this.getPayInfo()
			}, 300)

		},
		methods: {
			topersonal(item) {
				if(!item.subId){
					return
				}
				if (item.orderStatus != 1 && item.orderStatus != 3) {
					return
				}
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation?id=' + item.subId
				})
			},
			getPayInfo() {
				this.$httpapi('project/getProCustomerCard', 'POST', {
					customerId: uni.getStorageSync('customerId')
				}).then(res => {
					if (res.code == '200') {
						this.holder_name = res.data.name
						this.types = 1
						this.user = {
							cardNo: res.data.cardNo,
							expire: res.data.expire,
							security_code: res.data.securityCode,
							holder_name: res.data.name,
						}
						if (res.data.cardNo) {
							this.typex = 2
						}
					} else {
						alert(res.msg)
					}

				})
			},
			delects(item) {


				this.$httpapi('project/deleteTbCustomerRoute', 'POST', {
					routeId: item.id,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.loads()
				})
			},
			loads() {
				const customerId = uni.getStorageSync('customerId'); // 获取 customerId

				if (this.type == 1) {

					Promise.all([
						this.$httpapi('project/getTbCustomerRouteListNow', 'POST', {
							customerId: customerId,
							type: 1
						}),
						this.$httpapi('project/getTbCustomerRouteListOld', 'POST', {
							customerId: customerId,
							type: 1
						})
					]).then(([resNow, resOld]) => {
						// 检查第一个接口的返回码
						if (resNow.code == 500) {
							this.$refs.toast.show({
								message: resNow.msg,
								duration: 2000
							});
							return; // 终止后续操作
						}

						// 检查第二个接口的返回码
						if (resOld.code == 500) {
							this.$refs.toast.show({
								message: resOld.msg,
								duration: 2000
							});
							return; // 终止后续操作
						}

						// 过滤出 model == false 的数据
						const filteredNow = resNow.data.filter(item => item.model);

						// 获取第二个接口的所有数据
						const oldData = resOld.data.filter(item => item.model);

						// 合并两部分数据
						// 合并数组
						// const allData = [...filteredNow, ...oldData];

						// // 统计每个 id 的出现次数
						// const idCountMap = new Map();

						// allData.forEach(item => {
						//   const count = idCountMap.get(item.id) || 0;
						//   idCountMap.set(item.id, count + 1);
						// });

						// 过滤掉重复 id 的项
						this.list = Array.from(
							new Map(
								[...filteredNow, ...oldData].map(item => [item.id, item])
							).values()
						);
						// this.list = [...filteredNow, ...oldData];
					}).catch(error => {
						// 处理请求错误
						console.error('Error fetching routes:', error);
						this.$refs.toast.show({
							message: 'データ取得中にエラーが発生しました。',
							duration: 2000
						});
					});
				} else if (this.type == 2) {
					// 当 type == 2 时，同时调用 getTbCustomerRouteListNow 和 getTbCustomerRouteListOld 接口
					Promise.all([
						this.$httpapi('project/getTbCustomerRouteListNow', 'POST', {
							customerId: customerId,
							type: 1
						}),
						this.$httpapi('project/getTbCustomerRouteListOld', 'POST', {
							customerId: customerId,
							type: 1
						})
					]).then(([resNow, resOld]) => {
						// 检查第一个接口的返回码
						if (resNow.code == 500) {
							this.$refs.toast.show({
								message: resNow.msg,
								duration: 2000
							});
							return; // 终止后续操作
						}

						// 检查第二个接口的返回码
						if (resOld.code == 500) {
							this.$refs.toast.show({
								message: resOld.msg,
								duration: 2000
							});
							return; // 终止后续操作
						}

						// 过滤出 model == false 的数据
						const filteredNow = resNow.data.filter(item => !item.model);

						// 获取第二个接口的所有数据
						const oldData = resOld.data.filter(item => !item.model);

						// 合并两部分数据
						// this.list = [...filteredNow, ...oldData];
						// const allData = [...filteredNow, ...oldData];

						// // 统计每个 id 的出现次数
						// const idCountMap = new Map();

						// allData.forEach(item => {
						//   const count = idCountMap.get(item.id) || 0;
						//   idCountMap.set(item.id, count + 1);
						// });

						// 过滤掉重复 id 的项
						this.list = Array.from(
							new Map(
								[...filteredNow, ...oldData].map(item => [item.id, item])
							).values()
						);
					}).catch(error => {
						// 处理请求错误
						console.error('Error fetching routes:', error);
						this.$refs.toast.show({
							message: 'データ取得中にエラーが発生しました。',
							duration: 2000
						});
					});
				}
			},
			loadbeifen() {
				if (this.type == 1) {
					this.$httpapi('project/getTbCustomerRouteListNow', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						type: 1
					}).then(res => {
						if (res.code == 500) {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}
						this.list = res.data
					})
				} else {
					this.$httpapi('project/getTbCustomerRouteListOld', 'POST', {
						customerId: uni.getStorageSync('customerId'),
						type: 1
					}).then(res => {
						if (res.code == 500) {
							this.$refs.toast.show({
								message: res.msg,
								duration: 2000
							});
						}
						this.list = res.data
					})
				}
			},

			zhifu(item) {
				this.detailx = item
				if (this.user.cardNo) {
					this.submitPayment()
				} else {
					this.showModal = true
				}
			},
			pingjia(item) {
				uni.navigateTo({
					url: '/pages/index/evaluate/evaluate?subId=' + item.subId + '&orderCode=' + item.orderCode
				})
			},
			submitPayment() {
				var that = this
				const {
					cardNo,
					expire,
					security_code,
					holder_name
				} = this.user;
				console.log(this.security_code)
				if(!(cardNo || this.cardNo)){
					this.$utils.showtt('入力内容に誤りがあります。1')
					return
				}
				if(!(expire || this.expire)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if(!(security_code || this.security_code)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if(!(holder_name || this.holderName)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				uni.showModal({
					title: '確認',
					cancelText:'キャンセル',
					confirmText:'確認',
					content: 'リクエストを確定して'+ this.detailx.maxPrice / this.detailx
						.alreadyTotal + '円の決済を行います。',
					success: (res) => {
						if (res.confirm) {
							// 用户点击确认，继续执行请求
							if (typeof this.Fincode !== 'undefined') {
								const fincode = this.Fincode(this.publicKey);

								const card = {
									cardNo: cardNo || this.cardNo,
									expire: expire || this.expire,
									securityCode: security_code || this.security_code,
									name: holder_name || this.holderName,
								};

								// 使用 Fincode 生成 Token
								fincode.tokens({
										card_no: cardNo || this.cardNo,
										expire: (expire && expire.replace(/\//g, '') )|| (this.expire && this.expire.replace(/\//g,'')),
										security_code: security_code || this.security_code,
										holder_name: holder_name || this.holderName
									}, (status, response) => {
										if (status === 200) {
											console.log('Token 成功生成:', response);
											that.$httpapi('project/payOrder', 'POST', {
												orderCode: this.detailx.orderCode,
												customerId: uni.getStorageSync('customerId'),
												...card,
												token: response.list[0].token
											}).then(res => {
												// this.listCar = res.rows
												if (res.code == 500) {
												
												this.$refs.toast.show({
													message: res.msg,
													duration: 2000
												});
												this.loads()
												}else{
													this.$refs.toast.show({
														message: res.msg,
														duration: 2000
													});
													this.loads()
													this.showModal = false
												}
											})

											// document.getElementById('result').innerText = '生成的 Token: ' + response.list[0].token;
											// 发送 Token 到后端（此处省略，见之前的代码）

										} else {
											// console.error('生成 Token 失败:', response);
											// alert(response.errors[0].error_message)
											this.$refs.toast.show({
												message: response.errors[0].error_message,
												duration: 2000
											});
											// document.getElementById('result').innerText = 'Token 生成失败: ' + response.message;
										}
									},
									() => {
										console.error('Token 生成过程中发生错误');
										document.getElementById('result').innerText = 'Token 生成过程中发生错误';
									}
								);
							} else {
								console.error('Fincode 库未定义或未正确加载');
								document.getElementById('result').innerText = 'Fincode 库未定义或未正确加载';
							}

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
				// 确保 Fincode 库已经加载


			},
			Fincode(apiKey) {
				var config;
				if (_checkRequire(apiKey)) return {
					config: config = {
						api: {
							host: "https://api.fincode.jp/",
							// host:"https://api.test.fincode.jp/v1/",
							context: "v1"
						},
						headers: {
							accept: "application/json",
							contentType: "application/json",
							tenantShopId: "",
							idempotentKey: ""
						},
						apiKey: apiKey
					},
					setTenantShopId: function(tenantShopId) {
						if (!_checkRequire(tenantShopId)) throw new Error("tenantShopId が指定されていません");
						! function(tenantShopId) {
							config.headers.tenantShopId = tenantShopId
						}(tenantShopId)
					},
					setIdempotentKey: function(idempotentKey) {
						if (!_checkRequire(idempotentKey)) throw new Error("idempotentKey が指定されていません");
						! function(idempotentKey) {
							config.headers.idempotentKey = idempotentKey
						}(idempotentKey)
					},
					payments: function(transaction, callBack, errorCallBack) {
						if (!_checkRequire(transaction)) throw new Error("transaction が指定されていません");
						let id = null;
						var data = {};
						if (_isObject(transaction))
							for (let i = 0, keys = Object.keys(transaction); i < keys.length; i++) {
								var key = keys[i];
								"id" == key ? id = transaction[key] : data[key] = transaction[key]
							}
						if (!_checkRequire(id)) throw new Error("transaction.id が指定されていません");
						! function(order_id, transaction, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/payments/" + order_id, "PUT",
								transaction,
								callBack, errorCallBack)
						}(id, data, callBack, errorCallBack)
					},
					cards: function(card, callBack, errorCallBack) {
						if (!_checkRequire(card)) throw new Error("card が指定されていません");
						let customer_id = null,
							card_id = null;
						var data = {};
						if (_isObject(card))
							for (let i = 0, keys = Object.keys(card); i < keys.length; i++) {
								var key = keys[i];
								"customer_id" == key ? customer_id = card[key] : "card_id" == key ? card_id = card[
										key] :
									data[key] = card[key]
							}
						if (!_checkRequire(customer_id)) throw new Error("card.customer_id が指定されていません");
						_checkRequire(card_id) ? function(customer_id, card_id, card, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards/" + card_id, "PUT", card, callBack, errorCallBack)
						}(customer_id, card_id, data, callBack, errorCallBack) : function(customer_id, card,
							callBack,
							errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards",
								"POST", card, callBack, errorCallBack)
						}(customer_id, data, callBack, errorCallBack)
					},
					tokens: function(card, callBack, errorCallBack) {
						console.log(card, '--------card----------------')
						if (!_checkRequire(card)) throw new Error("card が指定されていません");
						var data = {};
						if (_isObject(card))
							for (let i = 0, keys = Object.keys(card); i < keys.length; i++) {
								var key = keys[i];
								data[key] = card[key]
							}! function(card, callBack, errorCallBack) {
								_sendRequest(config.api.host + config.api.context + "/tokens/cards", "POST", card,
									callBack,
									errorCallBack)
							}(data, callBack, errorCallBack)
					},
					getCardsList: function(customer_id, callBack, errorCallBack) {
						if (!_checkRequire(customer_id)) throw new Error("customer_id が指定されていません");
						! function(customer_id, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards",
								"GET", "", callBack, errorCallBack)
						}(customer_id, callBack, errorCallBack)
					},
					ui: function(appearance) {
						if (!_checkRequire(appearance)) throw new Error("appearance が指定されていません");
						if (_isObject(appearance))
							for (let i = 0, keys = Object.keys(appearance); i < keys.length; i++) {
								var key = keys[i];
								key, appearance[key]
							}
						return _ui(appearance)
					}
				};
				throw new Error("Public key が指定されていません");

				function _checkRequire(arg) {
					return null != arg && "" !== arg
				}

				function _isObject(obj) {
					return "object" == (void 0 === obj ? "undefined" : typeof obj) && null !== obj
				}

				function _sendRequest(url, method, data, callBack, errorCallBack) {
					var xhr = new XMLHttpRequest;
					xhr.open(method, url), xhr.setRequestHeader("Accept", config.headers.accept), xhr.setRequestHeader(
						"Content-Type", config.headers.contentType), xhr.setRequestHeader("Authorization", "Bearer " +
						config
						.apiKey), _checkRequire(config.headers.tenantShopId) && xhr.setRequestHeader("Tenant-Shop-Id",
						config
						.headers.tenantShopId), _checkRequire(config.headers.idempotentKey) && xhr.setRequestHeader(
						"idempotent_key", config.headers.idempotentKey), xhr.addEventListener("load", () => {
						null != callBack && "function" == typeof callBack && callBack(xhr.status, JSON.parse(xhr
							.response))
					}), xhr.addEventListener("error", () => {
						null != errorCallBack && "function" == typeof errorCallBack && errorCallBack(
							"request errro.")
					}), xhr.send(JSON.stringify(data))
				}

				function _ui(appearance) {
					var ui;
					if (_checkRequire(appearance)) return ui = {
						api: {
							host: "https://js.fincode.jp/_templates/CardPaymentInputElements",
							host2: "https://js.fincode.jp",
							context: "v1",
							urls: ""
						},
						apiKey: config.apiKey,
						appearance: appearance,
						elementId: "",
						tenantShopId: config.headers.tenantShopId,
						form: {
							cardNo: "",
							CVC: "",
							year: "",
							month: ""
						}
					}, window.addEventListener("message", function(event) {
						return event.origin !== ui.api.host2 ? 0 : "getCardData" == event.data.action ? (ui
							.form = event
							.data.form, event.data.form) : void("iframeSize" == event.data.action && (event
							.data
							.size, document.getElementById(ui.elementId + "-ui").style.height =
							parseInt(event
								.data.size.height, 10) + 80 + "px", document.getElementById(ui
								.elementId +
								"-form").style.height = document.getElementById(ui.elementId + "-form")
							.scrollHeight + 12 + "px", document.getElementById(ui.elementId).style
							.width = event
							.data.size.width))
					}), {
						appearance: ui,
						create: function(method, appearance, callBack, errorCallBack) {
							if (!_checkRequire(appearance)) throw new Error("appearance が指定されていません");
							if (!_checkRequire(method)) throw new Error("method が指定されていません");
							var data = {};
							if (_isObject(appearance))
								for (let i = 0, keys = Object.keys(appearance); i < keys.length; i++) {
									var key = keys[i];
									data[key] = appearance[key]
								}
							_create(method, data)
						},
						mount: function(elementId, width = "500", callBack, errorCallBack) {
							if (!_checkRequire(elementId)) throw new Error("elementId が指定されていません");
							"loading" === document.readyState && console.warn("DOM が読み込まれていません"),
								function(elementId, width = "500") {
									parseInt(width, 10) <= 250 ? width = "250" : 768 <= parseInt(width, 10) &&
										(width =
											"768"), ui.elementId = elementId;
									const base = document.getElementById(elementId);
									var base2 = document.getElementById(elementId + "-form"),
										formWidth = parseInt(width, 10) + 30,
										fragment = (base2.setAttribute("style", "width:" + formWidth +
												"px; height:250px; padding:1.186rem; margin:1.186rem; border-radius:0.5em; box-shadow: 0px 0px 0px 0.5px rgb(50 50 93 / 10%), 0px 2px 5px 0px rgb(50 50 93 / 10%), 0px 1px 1.5px 0px rgb(0 0 0 / 7%)"
											), "fincode" === ui.appearance.theme ? base2.style
											.backgroundColor =
											"#000054" : "dark" === ui.appearance.theme ? base2.style
											.backgroundColor =
											"#1f1f1f" : base2.style.backgroundColor = "#" + ui.appearance
											.colorBackground, (obj = document.createElement("iframe")).id =
											elementId +
											"-ui", obj.setAttribute("frameBorder", "0"), obj.setAttribute(
												"scrolling",
												"no"), obj.style.width = width + "px", obj.style.height =
											"500px", obj
											.src = ui.api.urls, document.createDocumentFragment());
									fragment.appendChild(obj), "complete" === document.readyState ? null ===
										document
										.getElementById(obj.id) && base.appendChild(fragment) : null ===
										document
										.getElementById(obj.id) && window.addEventListener("load", function() {
											null === document.getElementById(obj.id) && base.appendChild(
												fragment)
										})
								}(elementId, width)
						},
						getFormData: async function() {
							return data = await _get()
						},
						destroy: function(callBack, errorCallBack) {
							if (!_checkRequire(ui.elementId)) throw new Error("elementId が存在しません");
							var elementId;
							elementId = ui.elementId, document.getElementById(elementId).innerHTML = ""
						}
					};
					throw new Error("Appearance が指定されていません");

					function _create(method, appearance) {
						! function(method, appearance) {
							var data = appearance,
								appearance = (appearance.apiKey = config.apiKey, appearance.tenantShopId = config.headers
									.tenantShopId, new URLSearchParams(data).toString()),
								data = encodeURI(appearance),
								appearance = ui.api.host + "?method=" + method + "&" + data;
							ui.api.urls = appearance
						}(method, appearance)
					}
					async function _get() {
						var num;
						return document.getElementById(ui.elementId + "-ui").contentWindow.postMessage({
							action: "getCardData"
						}, ui.api.host2), num = 30, await new Promise(s => setTimeout(s, num)), ui.form
					}
				}
			},
			addride() {
				if (uni.getStorageSync('isAuth') == 0) {
					this.$refs.toast.show({
						message: '本人確認が完了していません。マイページから本人確認を行ってください。',
						duration: 2000
					});
					return
				}
				uni.navigateTo({
					url: '/pages/index/Addride/Addride?type=1'
				})
			},
			qiehuan(type) {
				this.type = type
				this.loads()
			},
			personal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation'
				})
			},
			indexs() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
			},
			details(item) {
				uni.navigateTo({
					url: '/pages/index/IndexLise/ListDetails'
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

		.xian {
			margin: 0.79rem auto 0;
			width: 15.91rem;
			height: 0.68rem;
			background: #FF3D66;
			border-radius: 0px 0px 0px 0px;
		}

		.buttons {
			width: 17.233rem;
			height: 5.06rem;
			background: #F44870;
			border-radius: 1.264rem;
			font-weight: bold;
			font-size: 1.739rem;
			color: #FFFFFF;
			line-height: 5.06rem;
			text-align: center;
			margin: 2.213rem 0 2.688rem;
			cursor: pointer;
		}

		.buttonss {
			margin: 4.743rem auto 0;
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

		@media screen and (max-width: 768px) {
			.buttonss {
				margin: 4.743rem auto 0;
				// width: 49.486rem;
				// height: 5.85rem;
				background: #F44870;
				border-radius: 1.423rem;
				font-size: 3.41rem;
				color: #FFFFFF;
				line-height: 10.23rem;
				text-align: center;
				cursor: pointer;
				width: 75.23rem;
				height: 10.23rem;
			}
		}

		.buttonx {
			width: 17.233rem;
			height: 5.06rem;
			border-radius: 1.264rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size: 1.739rem;
			color: #F44870;
			line-height: 5.06rem;
			text-align: center;
		}

		/* 支付按钮样式 */
		.open-payment-button {
			padding: 12px 20px;
			background-color: #4caf50;
			color: white;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			cursor: pointer;
		}

		/* 模态框遮罩层 */
		.modal-overlay {
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: rgba(0, 0, 0, 0.5);
			display: flex;
			justify-content: center;
			align-items: center;
			z-index: 800;
		}

		/* 弹窗样式 */
		.modal {
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			width: 90%;
			max-width: 400px;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}

		/* 表单样式 */
		.form-group {
			margin-bottom: 15px;
		}

		label {
			display: block;
			margin-bottom: 5px;
			font-weight: bold;
		}

		input {
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
			font-size: 16px;
		}

		.payment-button {
			width: 100%;
			padding: 10px;
			background-color: #4caf50;
			color: white;
			border: none;
			border-radius: 4px;
			font-size: 16px;
			cursor: pointer;
		}

		/* 关闭弹窗按钮样式 */
		.close-modal-button {
			margin-top: 20px;
			background-color: #F44870;
			color: white;
			border: none;
			padding: 10px;
			width: 100%;
			font-size: 16px;
			border-radius: 4px;
			cursor: pointer;
		}
	}
</style>