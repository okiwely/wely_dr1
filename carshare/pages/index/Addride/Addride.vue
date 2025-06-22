<template>
	<view>

		<view class="content">
			<headers ref="headers" title='新規作成' style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>
				<view style="height: 7.905rem;"></view>
				<view style="font-size:  1.581rem;color: #000000;margin: 2.372rem auto  2.529rem;width:139.13rem;"><text
						style="cursor: pointer;" @click="writetoList">一覧ページ>></text> <text
						style="color: #FF3D66;">新規作成</text></view>

				<view class="flex" style="margin:0 auto  2.372rem;width:139.13rem;">
					<view style="width:9 1.739rem;margin:0  3.162rem 0 0;">
						<view
							style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">ル—ト</view>

							<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
								<view style="margin-right:1.739rem;" class="flexJusp">出発地</view>
								<view class="flexJusp"
									style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;align-items: center;">
									<!-- <bjx-inputs ref='inputs1' style="width:54.743rem;" :value="value1" item-key="description"
											placeholder='日本、東京都千代田区丸の内1丁目9 東京駅' @list="getData1" @select='select1' @focus="focus1"
											@blur="blur1">
			
										</bjx-inputs> -->
									<!-- <input id="origin" type="text" placeholder="入力 出発地" /> -->

									<!-- <input id="destination" type="text" placeholder="入力 目的地" /> -->
									<input class="origin"  type="text" v-model="startAddress"
										style="width:54.743rem;border-radius: 1.106rem;font-size: 1.739rem;"
										placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
								</view>
							</view>
							<view class="flex"
								style="font-size: 1.897rem;height:5.217rem;align-items: center;margin: 2.372rem 0 2.055rem;">
								<view style="margin-right: 1.739rem;" class="flexJusp">目的地</view>
								<!-- <picker @change="bindPickerChangex" :value="indexs" :range="listCity" range-key="city">
										<view style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;line-height:5.217rem;">
											<view v-if="listCity[indexs]">{{listCity[indexs].city}}</view>
											<view v-else style="width:2 4.743rem;">選択してください</view>
										</view>
									</picker> -->
								<view class="flexJusp"
									style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;align-items: center;">
									<input class="destination" type="text" v-model="endAddress"
										style="width:54.743rem;border-radius: 1.106rem;font-size: 1.739rem;"
										placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
									<!-- <bjx-inputs ref='inputs2' style="width:54.743rem;" :value="value2" item-key="description"
											placeholder='日本、東京都千代田区丸の内1丁目9 東京駅' @list="getData2" @select='select2' @focus="focus2"
											@blur="blur2">
										</bjx-inputs> -->
								</view>
								<!-- <input @click="dakaiDitu(2)" v-model="endAddress" style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;" placeholder="日本、神奈川県横浜市西区高岛2丁目16 横浜駅" /> -->
							</view>
							<view style="background: #F7F8F9;border-radius: 1.423rem;padding:1.423rem;"
								v-if="detail.startAddress">
								<view class="flexJusp" style="align-items: center;">
									<view style="font-size: 1.423rem;">前回のリクエスト</view>
									<view @click="shiyong"
										style="width: 16.205rem;height: 2.372rem;background: rgba(255,255,255,0);border-radius: 7px;border: 1px solid #F44870;font-size: 1.106rem;color: #F44870;line-height: 2.372rem;text-align: center;cursor: pointer;">
										前回のリクエストをコビ-する</view>
								</view>
								<view class="flex" style="margin: 1.581rem 0 0.948rem;align-items: center;">
									<image style="width:1.818rem;height: 1.739rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<view style="font-size: 1.264rem;color: #333333;">{{detail.startAddress}}</view>
								</view>
								<view class="flex">
									<image style="width:1.818rem;height: 1.739rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view style="font-size: 1.264rem;color: #333333;">{{detail.endAddress}}</view>
								</view>
							</view>
						</view>
						<view
							style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">日程</view>

							<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
								<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
									<text>繰</text>
									<text>り</text>
									<text>返</text>
									<text>し</text>
									<text>設</text>
									<text>定</text>
								</view>
								<picker @change="bindPickerChangess" :value="state" :range="list" range-key="label">
									<view class="flexJusp"
										style="align-items: center;width: 51.225rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;">
										<!-- <input style="width: 47.431rem;" placeholder="繰り返し"/> -->
										<view style="width:47.431rem;" v-if="list[state]">{{list[state].label}}</view>
										<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
										</image>
									</view>
								</picker>
							</view>
							<view class="flex"
								style="font-size: 1.897rem;height:5.217rem;align-items: center;margin:2.292rem 0 1.502rem;align-items: center;">
								<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
									<text>出</text>
									<text>発</text>
									<text>日</text>
									<text>時</text>
								</view>
								<view v-if="state==1" class="flexJusp" @click="onShowDatePicker('date')"
									style="width: 30.225rem; height: 5.217rem;border-radius: 7px;border: 1px solid #707070;align-items: center;font-size: 1.739rem;padding:0  1.739rem;cursor: pointer;">
									<view>{{date||'日付'}}</view>
									<image style="width: 1.739rem;height:1.818rem;" src="/static/images/mnvjyt.png">
									</image>
								</view>

								<!-- <el-date-picker style="width:19.447rem;height:3.162rem;border-radius: 7px;border: 1px solid #707070;font-size:  1.581rem;" v-model="date" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker> -->
								<view v-if="state==0" class="flex" style="align-items: center;font-size: 1.581rem;">
									<image @click="qiehuan(0)" v-if="types1==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(0)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(0)" style="margin:0  3.162rem 0 0.948rem;">月</view>

									<image @click="qiehuan(1)" v-if="types2==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(1)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(1)" style="margin:0  3.162rem 0 0.948rem;">火</view>

									<image @click="qiehuan(2)" v-if="types3==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(2)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(2)" style="margin:0  3.162rem 0 0.948rem;">水</view>

									<image @click="qiehuan(3)" v-if="types4==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(3)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(3)" style="margin:0  3.162rem 0 0.948rem;">木</view>

									<image @click="qiehuan(4)" v-if="types5==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(4)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(4)" style="margin:0  3.162rem 0 0.948rem;">金</view>

									<image @click="qiehuan(5)" v-if="types6==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(5)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(5)" style="margin:0  3.162rem 0 0.948rem;">土</view>

									<image @click="qiehuan(6)" v-if="types7==1"
										style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(6)" v-else style="width: 1.739rem;height:  1.739rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(6)" style="margin:0  3.162rem 0 0.948rem;">日</view>
								</view>
								<!-- margin:2.292rem 0 1.502rem; -->
								<view v-if="state==1" class="flex"
									style="font-size: 1.897rem;height:5.217rem;align-items: center;margin-left: 3.162rem;">
									<!-- <view style="margin-right: 1.739rem;width:11.383rem;"></view> -->
									<view class="flex" style="align-items: center;">

										<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
											<view class="flexJusp boxs">
												<view>{{shiList[shiIndex]||'00'}}</view>
												<image style="width:1.423rem;height:0.869rem;"
													src="/static/images/rnh.png">
												</image>
											</view>
										</picker>
										<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
											<view class="flexJusp boxs" style="margin:0 0.79rem;">
												<view>{{fenList[fenIndex]||'00'}}</view>
												<image style="width:1.423rem;height:0.869rem;"
													src="/static/images/rnh.png">
												</image>
											</view>
										</picker>
										<!-- <view style="font-weight: bold;font-size:  1.581rem;">-</view>
											<picker @change="bindPickerChange3" :value="shiIndexs" :range="shiList">
												<view class="flexJusp boxs" style="margin:0 0.79rem;">
													<view>{{shiList[shiIndexs]||'00'}}</view>
													<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
													</image>
												</view>
											</picker>
											<picker @change="bindPickerChange4" :value="fenIndexs" :range="fenList">
												<view class="flexJusp boxs">
													<view>{{fenList[fenIndexs]||'00'}}</view>
													<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
													</image>
												</view>
											</picker> -->
									</view>
								</view>
							</view>
							<view v-if="state==0" class="flex"
								style="font-size: 1.897rem;height:5.217rem;align-items: center;">
								<view style="margin-right: 1.739rem;width:11.383rem;"></view>
								<view class="flex" style="align-items: center;">

									<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
										<view class="flexJusp boxs">
											<view>{{shiList[shiIndex]||'00'}}</view>
											<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
											</image>
										</view>
									</picker>
									<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
										<view class="flexJusp boxs" style="margin:0 0.79rem;">
											<view>{{fenList[fenIndex]||'00'}}</view>
											<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
											</image>
										</view>
									</picker>
								</view>
							</view>
						</view>
						<view
							style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size: 2.055rem;padding:2.055rem 0 2.371rem;">その他</view>

							<view class="flex" style="font-size: 1.897rem;height:5.217rem;align-items: center;">
								<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
									<text>事</text>
									<text>前</text>
									<text>確</text>
									<text>認</text>
									<text>事</text>
									<text>項</text>
								</view>
								<input v-model="attention"
									style="width: 51.225rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;"
									placeholder="入力してください" />
							</view>
							<!-- 	<view class="flex"
									style="font-size: 1.897rem;height:5.217rem;align-items: center;margin: 2.372rem 0 2.055rem;">
									<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp">
										<text>コ</text>
										<text>メ</text>
										<text>ン</text>
										<text>ト</text>
									</view>
									<input v-model="comment"
										style="width: 51.225rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;"
										placeholder="入力してください" />
								</view> -->
						</view>
					</view>

					<view
						style="width:58.34rem;padding:2.372rem;background-color: #FFF;border-radius: 1.581rem;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);height:41.265rem;">
						<div style="width:58.34rem;height:41.265rem;" id="googleMaps"></div>
					</view>
				</view>
				<view v-if="type==2" class="flexJusp"
					style="width: 133.913rem;height: 12.332rem;background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius:1.581rem;margin:0 auto 2.372rem;padding:2.372rem 3.162rem 2.372rem 2.055rem;align-items: center;">
					<view>
						<view style="font-size: 3.478rem;margin-bottom:1rem">￥{{Math.floor(price)}}</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●募集金額の内訳</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●移動実費　{{Math.floor(Math.floor(price)/1.2)}}円</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●Wely手数料　{{Math.floor(price) - Math.floor(Math.floor(price)/1.2) }}円（20％）
						</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●※移動実費の費用に関してはマイページより振込申請ができます</view>

					</view>


				</view>
				<view v-else></view>
				<view @click="chuangjian"
					style="margin:5rem auto;width: 17.233rem;height: 5.06rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size:1.739rem;color: #FFFFFF;line-height:5.06rem;text-align: center;cursor: pointer;">
					登録する</view>
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
			<!-- 	<toast ref="toast"></toast>
				<uni-popup ref="popup">
					<view style="background-color: #FFF;border-radius: 1.581rem;padding: 1.581rem;">
						<div class="map" id="googleMap"></div>
						<view class="flexJusp" style="margin-top: 1.581rem;">
							<view></view>
							<view class="flex">
								<view class="buttonsx" @click="close">キャンセル</view>
								<view class="buttonss" @click="queding">確認</view>
							</view>
						</view>
					</view>
				</uni-popup> -->
				<div style="width:0.01rem;height:0.01rem;" id="googleMapx"></div>

				<mx-date-picker :show="showPicker" :type="type" :value="value" :show-tips="true" format="yyyy-mm-dd"
					:show-seconds="true" @confirm="ed" @cancel="ed" />
			</view>
			<view class='mobile-only'>
				<view style="height: 18.69rem;"></view>
		
             <!--   <view
                	style="width:100vw;background-color: #FFF;border-radius: 1.581rem;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);height:41.265rem;"> -->
                	<div style="width:100vw;height:41.265rem;" id="googleMapsMB"></div>
                <!-- </view> -->
				<view class="flex" style="margin:0 auto;calc(100vw - 6.36rem);margin-top:4rem">
					<view style="width:calc(100vw - 6.36rem);margin:0  auto;">
						<view
							style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size: 4.15rem;padding:2.055rem 0 2.371rem;">ル—ト</view>

							<view class="flex" style="font-size: 1.897rem;flex-direction: column;">
								<view style="margin-right:1.739rem;margin-bottom:1.18rem" class="flexJusp login_h1">出発地</view>
								<view class="flexJusp "
									style="width: calc(100vw - 14.45rem); height: 8.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 3.18rem;padding:0  1.739rem;align-items: center;">
									<!-- <bjx-inputs ref='inputs1' style="width:54.743rem;" :value="value1" item-key="description"
            									placeholder='日本、東京都千代田区丸の内1丁目9 東京駅' @list="getData1" @select='select1' @focus="focus1"
            									@blur="blur1">
            	
            								</bjx-inputs> -->
									<!-- <input id="origin" type="text" placeholder="入力 出発地" /> -->

									<!-- <input id="destination" type="text" placeholder="入力 目的地" /> -->
									<input class="origin"  ref="originInput"  id="origin" type="text" v-model="startAddress"
										style="width: calc(100vw - 14.45rem);border-radius: 1.106rem;font-size: 3.18rem;"
										placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
								</view>
							</view>
							<view class="flex"
								style="font-size: 1.897rem;flex-direction: column;;margin: 2.372rem 0 2.055rem;">
								<view style="margin-right: 1.739rem;margin-bottom:1.18rem" class="flexJusp login_h1">目的地</view>
								<!-- <picker @change="bindPickerChangex" :value="indexs" :range="listCity" range-key="city">
            								<view style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;line-height:5.217rem;">
            									<view v-if="listCity[indexs]">{{listCity[indexs].city}}</view>
            									<view v-else style="width:2 4.743rem;">選択してください</view>
            								</view>
            							</picker> -->
								<view class="flexJusp"
									style="width: calc(100vw - 14.45rem); height: 8.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 3.18rem;padding:0  1.739rem;align-items: center;">
									<input ref="destinationInput" class="destination" id="destination" type="text" v-model="endAddress"
										style="width: calc(100vw - 14.45rem);border-radius: 1.106rem;font-size: 3.18rem;"
										placeholder="日本、東京都千代田区丸の内1丁目9 東京駅" />
									<!-- <bjx-inputs ref='inputs2' style="width:54.743rem;" :value="value2" item-key="description"
            									placeholder='日本、東京都千代田区丸の内1丁目9 東京駅' @list="getData2" @select='select2' @focus="focus2"
            									@blur="blur2">
            								</bjx-inputs> -->
								</view>
								<!-- <input @click="dakaiDitu(2)" v-model="endAddress" style="width: 57.549rem; height: 5.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;" placeholder="日本、神奈川県横浜市西区高岛2丁目16 横浜駅" /> -->
							</view>
							<view style="background: #F7F8F9;border-radius: 1.423rem;padding:1.423rem;"
								v-if="detail.startAddress">
								<view class="flexJusp" style="align-items: center;">
									<view style="font-size: 3.18rem;">前回のリクエスト</view>
									<view @click="shiyong"
										style="width: 34rem;height: 5.2rem;background: rgba(255,255,255,0);border-radius: 7px;border: 1px solid #F44870;font-size: 2.18rem;color: #F44870;line-height: 5.2rem;text-align: center;cursor: pointer;">
										前回のリクエストをコビ-する</view>
								</view>
								<view class="flex" style="margin: 1.581rem 0 0.948rem;align-items: center;">
									<image style="width:4.3rem;height: 4.3rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<view style="font-size: 2.73rem;color: #333333;">{{detail.startAddress}}</view>
								</view>
								<view class="flex">
									<image style="width:4.3rem;height: 4.3rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view style="font-size: 2.73rem;color: #333333;">{{detail.endAddress}}</view>
								</view>
							</view>
						</view>
						<view
							style="padding:0 1.897rem 2.055rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;">
							<view style="font-weight: bold;font-size:4.15rem;padding:2.055rem 0 2.371rem;">日程</view>

							<view class="flex" style="font-size: 1.897rem;flex-direction: column;">
								<view style="margin-right: 1.739rem;width:11.383rem;margin-bottom:3.18rem" class="flexJusp login_h1">
									<text>繰</text>
									<text>り</text>
									<text>返</text>
									<text>し</text>
									<text>設</text>
									<text>定</text>
								</view>
								<picker @change="bindPickerChangess" :value="state" :range="list" range-key="label">
									<view class="flexJusp"
										style="align-items: center;width: 51.225rem; height: 8.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;font-size: 1.739rem;padding:0  1.739rem;">
										<!-- <input style="width: 47.431rem;" placeholder="繰り返し"/> -->
										<view style="width:47.431rem;font-size: 3.18rem;" v-if="list[state]">{{list[state].label}}</view>
										<image style="width:1.976rem;height:1.186rem;" src="/static/images/gddu.png">
										</image>
									</view>
								</picker>
							</view>
							<view class="flex"
								style="font-size: 1.897rem;margin:2.292rem 0 1.502rem;flex-direction: column;">
								<view style="margin-right: 1.739rem;width:11.383rem;margin-bottom:3.18rem" class="flexJusp login_h1">
									<text>出</text>
									<text>発</text>
									<text>日</text>
									<text>時</text>
								</view>
								<view v-if="state==1" class="flexJusp" @click="onShowDatePicker('date')"
									style="width:51.225rem; height: 8.217rem;border-radius: 7px;border: 1px solid #707070;align-items: center;font-size: 3.18rem;padding:0  1.739rem;cursor: pointer;">
									<view>{{date||'日付'}}</view>
									<image style="width: 1.739rem;height:1.818rem;" src="/static/images/mnvjyt.png">
									</image>
								</view>

								<!-- <el-date-picker style="width:19.447rem;height:3.162rem;border-radius: 7px;border: 1px solid #707070;font-size:  1.581rem;" v-model="date" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker> -->
								<view v-if="state==0" class="flex" style="align-items: center;font-size: 2.95rem;margin-bottom:3.18rem">
									<image @click="qiehuan(0)" v-if="types1==1"
										style="width: 3.41rem;height:  3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(0)" v-else style="width: 3.41rem;height:  3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(0)" style="margin:0  3.162rem 0 0.948rem;">月</view>

									<image @click="qiehuan(1)" v-if="types2==1"
										style="width: 3.41rem;height:  3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(1)" v-else style="width: 3.41rem;height:  3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(1)" style="margin:0  3.162rem 0 0.948rem;">火</view>

									<image @click="qiehuan(2)" v-if="types3==1"
										style="width: 3.41rem;height:  3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(2)" v-else style="width: 3.41rem;height:  3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(2)" style="margin:0  3.162rem 0 0.948rem;">水</view>

									<image @click="qiehuan(3)" v-if="types4==1"
										style="width: 3.41rem;height: 3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(3)" v-else style="width: 3.41rem;height:  3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(3)" style="margin:0  3.162rem 0 0.948rem;">木</view>

									<image @click="qiehuan(4)" v-if="types5==1"
										style="width: 3.41rem;height:  3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(4)" v-else style="width: 3.41rem;height:  3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(4)" style="margin:0  3.162rem 0 0.948rem;">金</view>

									<image @click="qiehuan(5)" v-if="types6==1"
										style="width: 3.41rem;height:  3.41rem;" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(5)" v-else style="width:3.41rem;height:  3.41rem"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(5)" style="margin:0  3.162rem 0 0.948rem;">土</view>

									<image @click="qiehuan(6)" v-if="types7==1"
										style="width: 3.41rem;height:  3.41rem" src="/static/images/xzz.png"></image>
									<image @click="qiehuan(6)" v-else style="width: 3.41rem;height: 3.41rem;"
										src="/static/images/isc.png"></image>
									<view @click="qiehuan(6)" style="margin:0  3.162rem 0 0.948rem;">日</view>
								</view>
								<!-- margin:2.292rem 0 1.502rem; -->
								<view v-if="state==1" class="flex "
									style="font-size:3.18rem;align-items: center;margin-top:3rem">
									<!-- <view style="margin-right: 1.739rem;width:11.383rem;"></view> -->
									<view class="flex" style="align-items: center;">

										<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
											<view class="flexJusp boxs" style='width:11rem;height:5.8rem'>
												<view>{{shiList[shiIndex]||'00'}}</view>
												<image style="width:1.423rem;height:0.869rem;"
													src="/static/images/rnh.png">
												</image>
											</view>
										</picker>
										<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
											<view class="flexJusp boxs" style="margin:0 0.79rem;width:11rem;height:5.8rem">
												<view>{{fenList[fenIndex]||'00'}}</view>
												<image style="width:1.423rem;height:0.869rem;"
													src="/static/images/rnh.png">
												</image>
											</view>
										</picker>
									
									</view>
								</view>
							</view>
							<view v-if="state==0" class="flex"
								style="font-size: 3.18rem;height:5.217rem;align-items: center;">
							<!-- 	<view style="margin-right: 1.739rem;width:11.383rem;"></view> -->
								<view class="flex" style="align-items: center;">

									<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
										<view class="flexJusp boxs"  style='width:11rem;height:5.8rem'>
											<view>{{shiList[shiIndex]||'00'}}</view>
											<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
											</image>
										</view>
									</picker>
									<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
										<view class="flexJusp boxs" style="margin:0 0.79rem;width:11rem;height:5.8rem;">
											<view>{{fenList[fenIndex]||'00'}}</view>
											<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
											</image>
										</view>
									</picker>
								</view>
							</view>
						</view>
						<view
							style="background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:  1.581rem;margin-bottom: 1.581rem;padding:1.82rem 2.73rem ">
							<view style="font-weight: bold;font-size: 4.15rem;padding:2.055rem 0 2.371rem;">その他</view>

							<view class="flex" style="font-size: 3.18rem;flex-direction: column">
								<view style="margin-right: 1.739rem;width:11.383rem;" class="flexJusp login_h1">
									<text>事</text>
									<text>前</text>
									<text>確</text>
									<text>認</text>
									<text>事</text>
									<text>項</text>
								</view>
								<!-- input v-model="attention"
								    class='inputT'
									style="background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;"
									placeholder="入力してください" /> -->
								<view class="flexJusp"
									style="margin-top:1.18rem;margin-bottom:2.18rem;width:66rem;height: 8.217rem;background: #FFFFFF;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0  1.739rem;">
									<input v-model="attention" style="font-size: 3.18rem;width:47.431rem;"
										placeholder="入力してください" />
								</view>
							</view>
						</view>
					</view>

					
				</view>
				<view v-if="type==2" class="flexJusp"
					style="width: calc(100vw - 11.86rem);background: #FFFFFF;box-shadow: 0px 3px 1.106rem 1px rgba(0,0,0,0.04);border-radius:1.581rem;margin:0 auto;padding:2.372rem 3.162rem 2.372rem 2.055rem;align-items: center;">
					<view>
						<!-- <view style="font-size: 3.478rem;margin-bottom:1rem">￥{{Math.floor(price)}}</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●募集金額の内訳</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●移動実費　{{Math.floor(Math.floor(price)/1.2)}}円</view>
						<view style="font-size: 1.281rem;margin-bottom:0.5rem">●Wely手数料　{{Math.floor(price) - Math.floor(Math.floor(price)/1.2) }}円（20％） -->
						<view style="font-size: 4.15rem;margin-bottom:1rem">￥{{Math.floor(price)}}</view>
						<view style="font-size: 2.85rem;margin-bottom:0.5rem">●募集金額の内訳</view>
						<view style="font-size:  2.85rem;margin-bottom:0.5rem">●移動実費　{{Math.floor(Math.floor(price)/1.2)}}円</view>
						<view style="font-size:  2.85rem;margin-bottom:0.5rem">●Wely手数料　{{Math.floor(price) - Math.floor(Math.floor(price)/1.2)}}円（20％）
						</view>
						<view style="font-size:  2.85rem;margin-bottom:0.5rem">●※移動実費の費用に関してはマイページより振込申請ができます</view>

					</view>


				</view>
				<view v-else></view>
				<view @click="chuangjian"
					style="margin:5rem auto;width: 22rem;height:7.73rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size:3.18rem;color: #FFFFFF;line-height:7.73rem;text-align: center;cursor: pointer;">
					登録する</view>
				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
				
				<div style="width:0.01rem;height:0.01rem;" id="googleMapx"></div>

				<mx-date-picker :show="showPicker" :type="type" :value="value" :show-tips="true" format="yyyy-mm-dd"
					:show-seconds="true" @confirm="ed" @cancel="ed" />



			</view>
			<toast ref="toast"></toast>
			<uni-popup ref="popup">
				<view style="background-color: #FFF;border-radius: 1.581rem;padding: 1.581rem;">
					<div class="map" id="googleMap"></div>
					<view class="flexJusp" style="margin-top: 1.581rem;">
						<view></view>
						<view class="flex">
							<view class="buttonsx" @click="close">キャンセル</view>
							<view class="buttonss" @click="queding">確認</view>
						</view>
					</view>
				</view>
			</uni-popup>
		</view>

	</view>
</template>

<!-- <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk&v=alpha&libraries=maps3d"></script> -->

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk&region=JP&libraries=places&language=ja">
</script>
<script>
	import BjxInputs from '@/components/bjx-inputs/bjx-inputs.vue'
	import GoogleMap from "@/https/GoogleMap"; //引入mixins封装的函数
	import MxDatePicker from "@/components/mx-datepicker/mx-datepicker.vue";
	import {
		Loader
	} from '@googlemaps/js-api-loader' //引入
	export default {
		components: {
			BjxInputs,
			MxDatePicker
			// bjxList // 若要查看微信小程序 自定义组件嵌套产生的问题 可打开
		},
		mixins: [GoogleMap],
		props: {
			//mapType属性值为:
			//selectPoint时是地图选点
			//POLYGON是绘制地图多边形区域

			//地图id
			mapID: {
				type: String,
				default: () => {
					return 'googleMap'
				},
			},
			//谷歌地图类型
			mapType: {
				type: String,
				default: () => {
					return 'default'
				},
			},
			//谷歌地图配置
			mapOptions: {
				type: Object,
				default: () => {
					return {
						//为了关闭默认控件集,设置地图的disableDefaultUI的属性为true
						disableDefaultUI: false,
						// 启用缩放和平移
						gestureHandling: 'greedy',
						panControl: true,
						zoomControl: true,
						scaleControl: true,
						//关闭街景
						streetViewControl: false,
					}
				},
			},
			//谷歌地图中心点
			googleMapCenter: {
				type: Object,
				default: () => {
					return {
						lat: 35.9593,
						lng: 139.6344,
					}
				},
			},
			//谷歌地图缩放级别
			zoom: {
				type: Number,
				default () {
					return 11
				},
			},
			//谷歌地图图形path
			mapPath: {
				type: String,
				default: () => {
					return ''
				},
			},
		},
		data() {
			return {
				showPicker: false,
				value: '',
				alue1: '',
				data1: [{
						id: 1,
						formatted_address: '这是默认值2'
					},
					{
						id: 2,
						formatted_address: '数组中嵌套json格式数据'
					},
					{
						id: 3,
						formatted_address: '这种格式比较常用'
					},
					{
						id: 4,
						formatted_address: '只需在组件中设定item-key属性即可，如当前可设为 item-key="value"'
					},
				],
				types1: 0,
				types2: 0,
				types3: 0,
				types4: 0,
				types5: 0,
				types6: 0,
				types7: 0,
				list: [],
				listCity: [],
				index: -1,
				indexs: -1,
				state: 1,
				date: '',
				shiList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23'
				],
				shiIndex: 0,
				shiIndexs: 23,
				fenList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31',
					'32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47',
					'48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59'
				],
				fenIndex: 0,
				fenIndexs: 59,
				attention: '',
				comment: '',
				startLonLat: '',
				endLonLat: '',
				detail: {
					startAddress: '',
					endAddress: '',
					startLonLat: '',
					endLonLat: ''
				},
				endAddress: '',
				startAddress: '',
				//地图选点回显值
				longlat: this.googleMapCenter.lng + ',' + this.googleMapCenter.lat,
				//标记点
				marker: null,
				markers: [],
				//图形实例
				graphicalExample: null,
				//图形路径经纬度
				graphicalPath: [],
				apiKey: 'AIzaSyBltUdYH_KjpYkVqRScXv2l6TWhZr3fqLk',
				type: 2,
				typex: 1,
				googleApi: '',
				googleMap: '',
				googleApis: '',
				googleMaps: '',
				value1: '',
				service: '',
				infowindow: '',
				value2: '',
				autocomplete: '',
				autocompletes: '',
				startlocation: '',
				endlocation: '',
				price: 0
			}
		},
		onLoad(option) {
			if (option) {
				if (option.type) {
					this.type = option.type
				}
			}
			this.loads()
			this.loadx()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			onInput(event) {
				console.log(event, '----------------')
			},
			onShowDatePicker(type) { //显示
				this.showPicker = true;
				this.value = this[type];
			},
			ed(e) { //选择
				this.showPicker = false;
				if (e) {
					this[this.type] = e.value;
					//选择的值
					console.log('value => ' + e.value);
					//原始的Date对象
					console.log('date => ' + e.date);
					this.date = e.value
				}
			},
			// 远程加载数据 返回一个对象，{value: 输入框值, callback: 回调函数}
			getData1(e) {
				var that = this
				// console.log(e, '----e-------------------')

				// this.infowindow = new google.maps.InfoWindow();

				// const mapOptions = {
				// 	center: {
				// 		lat: this.googleMapCenter.lat * 1,
				// 		lng: this.googleMapCenter.lng * 1
				// 	}, //中心点
				// 	zoom: 15 //缩放级别
				// }
				// const map = new google.maps.Map(document.getElementById('googleMapx'), mapOptions)


				// var request = {
				// 	query: e.value,
				// 	fields: ['name', 'geometry', 'formatted_address'],
				// };

				// var service = new google.maps.places.PlacesService(map);
				// service.findPlaceFromQuery(request, function(results, status) {
				// 	console.log(results, status, '-0----------results, status------------------')
				// 	if (status === google.maps.places.PlacesServiceStatus.OK) {
				// 		// 覆盖 value1
				// 		that.value1 = e.value
				// 		if (!e.value) {
				// 			e.callback(results)
				// 		} else {
				// 			let data = []
				// 			results.forEach(item => {
				// 				console.log(item, 'item.indexOf')
				// 				if (item.formatted_address.indexOf(e.value) > -1) {
				// 					data.push(item)
				// 				}
				// 			})
				// 			console.log(data, '-data------------------')
				// 			e.callback(data)
				// 		}
				// 	}
				// });




				const displaySuggestions = function(predictions, status) {
					console.log(predictions, status, 'predictions, status------------predictions, status-')
					// 覆盖 value1
					that.value1 = e.value
					if (!e.value) {
						e.callback(predictions)
					} else {
						let data = []
						predictions.forEach(item => {
							data.push(item)
						})
						console.log(data, '-data------------------')
						e.callback(data)
					}
				};

				const service = new google.maps.places.AutocompleteService();
				service.getQueryPredictions({
					input: e.value
				}, displaySuggestions);


			},
			select1(value) {
				this.value1 = value.value
				console.log(1, value)
			},
			focus1(e) {
				console.log('框1聚焦', e)
			},
			blur1(e) {
				console.log('框1失焦', e)
			},
			// 远程加载数据 返回一个对象，{value: 输入框值, callback: 回调函数}
			getData2(e) {
				const displaySuggestions = function(predictions, status) {
					console.log(predictions, status, 'predictions, status------------predictions, status-')
					// 覆盖 value2
					that.value2 = e.value
					if (!e.value) {
						e.callback(predictions)
					} else {
						let data = []
						predictions.forEach(item => {
							data.push(item)
						})
						e.callback(data)
						console.log(data, '-data------------------')
					}
				};

				const service = new google.maps.places.AutocompleteService();
				service.getQueryPredictions({
					input: e.value
				}, displaySuggestions);

			},
			select2(value) {
				this.value2 = value.value
				console.log(2, value)
			},
			focus2(e) {
				console.log('框2聚焦', e)
			},
			blur2(e) {
				console.log('框2失焦', e)
			},
			dakaiDitu(type) {
				this.typex = type
				this.$nextTick(() => {
					const loader = new Loader({
						apiKey: this.apiKey, //之前的key
						version: 'weekly', //版本
						libraries: ['places'], //插件库places为基础库 drawing为绘制工具库
						region: 'Canada',
						language: 'ja',
					})
					const mapOptions = {
						center: {
							lat: this.googleMapCenter.lat * 1,
							lng: this.googleMapCenter.lng * 1
						}, //中心点
						zoom: this.zoom, //缩放级别
						...this.mapOptions, //其他配置
					}
					loader.load().then((google) => {
							const map = new google.maps.Map(document.getElementById(this.mapID), mapOptions)
							this.googleMap = map
							this.googleApi = google
							// this.selectPoint()

							this.googleMap.addListener('click', (e) => {
								this.clickGmap(e)
							})
							console.log(this.googleMap, '谷歌地图实例')
							console.log(this.googleApi, '谷歌地图api')
							let drawingModesList = {

							}
							const drawingManager = new this.googleApi.maps.drawing.DrawingManager({
								drawingControl: true,
								drawingControlOptions: {
									position: this.googleApi.maps.ControlPosition.TOP_CENTER,
									drawingModes: [drawingModesList[this
										.mapType]], //这是个数组，因为我只需要多边形的就只传了一个
								},
								polygonOptions: {
									fillColor: 'blue',
									strokeColor: 'blue',
									strokeOpacity: 0.8,
									fillOpacity: 0.4,
									strokeWeight: 5,
									clickable: false,
									editable: true,
									zIndex: 1,
								},
							})
							drawingManager.setMap(map)
						})
						.catch((e) => {
							// do something
							console.log(e)
						})
				})
				this.$refs.popup.open('center')
			},
			isMobileDevice() {
				return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
			},
			loadx() {
				this.$nextTick(() => {

					const loader = new Loader({
						apiKey: this.apiKey, //之前的key
						version: 'weekly', //版本
						libraries: ['places'], //插件库places为基础库 drawing为绘制工具库
						region: 'JP',
						language: 'ja',
					})
					const mapOptions = {
						center: {
							lat: 35.6762,
							lng: 139.6503
						}, // 设置地图中心为东京
						zoom: 5, // 显示整个日本区域
						restriction: {
							latLngBounds: {
								north: 45.551483,
								south: 24.396308,
								west: 122.93457,
								east: 153.986672
							},
							strictBounds: true
						}
					}
					loader.load().then((google) => {
							// const map = new google.maps.Map(document.getElementById('googleMaps'), mapOptions)
							let map
							if (this.isMobileDevice()) {
								map = new google.maps.Map(document.getElementById('googleMapsMB'), mapOptions);
							} else {
								map = new google.maps.Map(document.getElementById('googleMaps'), mapOptions);
							}
							this.googleMaps = map
							this.googleApis = google
							var directionsService = new google.maps.DirectionsService();
							var directionsRenderer = new google.maps.DirectionsRenderer({
								suppressMarkers: true // 禁用默认的A和B标记
							});
							directionsRenderer.setMap(map);
                            let input
							let inputs
							  // let originInputComponent = this.$refs.originInput;
							  // let destinationInputComponent = this.$refs.destinationInput;
							 
                            if (this.isMobileDevice()) {
								document.querySelectorAll("input")[3].placeholder = '';
								document.querySelectorAll("input")[4].placeholder = '';
								input = document.querySelectorAll("input")[3];
								inputs = document.querySelectorAll("input")[4];
                            } else {
								document.querySelectorAll("input")[0].placeholder = '';
								document.querySelectorAll("input")[1].placeholder = '';
								input = document.querySelectorAll("input")[0];
								inputs = document.querySelectorAll("input")[1];
                            	// map = new google.maps.Map(document.getElementById('googleMaps'), mapOptions);
                            }
							
							console.log(input,'input')
							
							
							this.autocomplete = new google.maps.places.Autocomplete(input, {
								componentRestrictions: {
									country: 'jp'
								},
								language: 'ja',
								fields: ['geometry', 'name']
							});
							console.log('language: jp', '----------')
							this.autocompletes = new google.maps.places.Autocomplete(inputs, {
								componentRestrictions: {
									country: 'jp'
								}, // 限制为日本
								language: 'ja',
								fields: ['geometry', 'name']
							});

							// 初始化自动补全并限制区域为日本
							// this.originAutocomplete = new google.maps.places.Autocomplete(document.getElementById('origin'));
							// this.destinationAutocomplete = new google.maps.places.Autocomplete(document.getElementById('destination'));

							// 当输入出发地时，自动标记在地图上
							// this.autocomplete.addListener('place_changed',this.autocompleteListener);

							this.autocomplete.addListener('place_changed', () => {
								const place = this.autocomplete.getPlace();
								console.log(place, 'place-----1111-------')
								if (!place.geometry) {
									console.error('出発地のジオメトリを取得できません');
									return;
								}
								this.startLonLat = place.geometry.location.lng() + ',' + place.geometry
									.location.lat()

								this.startAddress = place.name
								// input.value
								this.startlocation = place.geometry.location
								this.xianshi()

								//    this.addMarker(place.geometry.location, "出発地");
								//    if (this.destinationPlace) {
								//        this.calculateAndDisplayRoute();
								//    }
							});

							// 当输入出发地时，自动标记在地图上
							this.autocompletes.addListener('place_changed', () => {

								const place = this.autocompletes.getPlace();
								console.log(place, '目的地-------------');
								if (!place.geometry) {
									console.log('目的地のジオメトリを取得できません');
									return;
								}
								this.endLonLat = place.geometry.location.lng() + ',' + place
									.geometry
									.location.lat()
								// inputs.value
								this.endAddress = place.name 
								this.endlocation = place.geometry.location
								this.xianshi()
							});
						})
						.catch((e) => {
							// do something
							console.log(e)
						})
				})
			},
			xianshi() {
				if (this.markers.length) {
					for (let i = 0; i < this.markers.length; i++) {
						this.markers[i].setMap(null);
					}
				}
				console.log(this.startLonLat, this.endLonLat)
				if (this.startLonLat && this.endLonLat) {
					const [startLng, startLat] = this.startLonLat.split(',').map(coord => parseFloat(coord.trim()));
					const [endLng, endLat] = this.endLonLat.split(',').map(coord => parseFloat(coord.trim()));

					if (!isNaN(startLat) && !isNaN(startLng) && !isNaN(endLat) && !isNaN(endLng)) {
						const directionsService = new this.googleApis.maps.DirectionsService();
						const directionsRenderer = new this.googleApis.maps.DirectionsRenderer({
							suppressMarkers: true // 禁用默认的起点和终点标记
						});
						directionsRenderer.setMap(this.googleMaps);

						const request = {
							origin: {
								lat: startLat,
								lng: startLng
							},
							destination: {
								lat: endLat,
								lng: endLng
							},
							travelMode: this.googleApis.maps.TravelMode.DRIVING, // 行驶模式
						};

						directionsService.route(request, (result, status) => {
							if (status === 'OK') {
								directionsRenderer.setDirections(result);
							} else {
								console.error('Directions request failed due to ' + status);
							}
						});
					} else {
						console.error("Invalid start or end location coordinates");
					}
				}
				// this.googleApis.maps.Marker.setMap(null);
				if (this.startLonLat) {
					var list = this.startLonLat.split(',')
					var marker = new this.googleApis.maps.Marker({
						map: this.googleMaps,
						position: this.startlocation,
						draggable: false,
					})
					this.markers.push(marker)
				}
				if (this.endLonLat) {
					var lists = this.endLonLat.split(',')
					var marker = new this.googleApis.maps.Marker({
						map: this.googleMaps,
						position: this.endlocation,
						draggable: false,
					})
					this.markers.push(marker)
				}
				if (this.startLonLat) {
					if (this.endLonLat) {
						var list = this.startLonLat.split(',')
						var lists = this.endLonLat.split(',')
						this.$httpapi('project/calculatePrice', 'POST', {
							customerId: uni.getStorageSync('customerId'),
							startLonLat: list[1] + ',' + list[0],
							endLonLat: lists[1] + ',' + lists[0],
						}).then(res => {
							if (res.code == 500) {
								// this.$refs.toast.show({
								// 	message: res.msg,
								// 	duration: 2000
								// });
							}
							if (res.code == 200) {
								this.price = res.data.price
							}
						})
					}
				}
				console.log(this.googleApis.maps.Marker, 'console.log(this.googleApis.maps.Marker)-----------')

			},
			autocompleteListener(predictions, status) {
				console.log(predictions, status, this.autocomplete, 'this.autocomplete------------')
				// 处理返回的预测结果
			},
			close() {
				this.$refs.popup.close()
			},
			queding() {
				if (this.typex == 1) {
					this.startLonLat = this.longlat
				} else {
					this.endLonLat = this.longlat
				}
				this.loadx()
				this.$refs.popup.close()
			},
			shiyong() {

				this.startAddress = this.detail.startAddress
				this.endAddress = this.detail.endAddress
				this.startLonLat = this.detail.startLonLat
				this.endLonLat = this.detail.endLonLat
				this.xianshi()
			},
			writetoList() {
				uni.redirectTo({
					url: '/pages/index/WritetoList/WritetoList'
				})
			},
			bindPickerChange1(e) {
				this.shiIndex = e.detail.value
			},
			bindPickerChange2(e) {
				this.fenIndex = e.detail.value
			},
			bindPickerChange3(e) {
				this.shiIndexs = e.detail.value
			},
			bindPickerChange4(e) {
				this.fenIndexs = e.detail.value
			},
			bindPickerChangess(e) {
				this.state = e.detail.value
			},
			bindPickerChanges(e) {
				this.index = e.detail.value
			},
			bindPickerChangex(e) {
				this.indexs = e.detail.value
			},
			loads() {
				// this.$httpapi('project/getCityList', 'POST', {}).then(res => {
				// 	if (res.code == 500) {
				// 		this.$refs.toast.show({
				// 			message: res.msg,
				// 			duration: 2000
				// 		});
				// 	}
				// 	this.listCity = res.data
				// })
				this.$httpapi('api/dictData/', 'POST', {
					type: 'tb_route_state'
				}).then(res => {
					if (res.code == 500) {
						// 	this.$refs.toast.show({
						// 		message: res.msg,
						// 		duration: 2000
						// 	});
					}
					this.list = res.data
				})
				this.$httpapi('project/getLastRoute', 'POST', {
					customerId: uni.getStorageSync('customerId'),
					type: this.type
				}).then(res => {
					if (res.code == 500) {
						// this.$refs.toast.show({
						// 	message: res.msg,
						// 	duration: 2000
						// });
					}
					// this.listCity = res.data
					this.detail = res.data
				})

			},
			// chuangjian() {
			// 	var week = []
			// 	if (this.types1 == 1) {
			// 		week.push(1)
			// 	}
			// 	if (this.types2 == 1) {
			// 		week.push(2)
			// 	}
			// 	if (this.types3 == 1) {
			// 		week.push(3)
			// 	}
			// 	if (this.types4 == 1) {
			// 		week.push(4)
			// 	}
			// 	if (this.types5 == 1) {
			// 		week.push(5)
			// 	}
			// 	if (this.types6 == 1) {
			// 		week.push(6)
			// 	}
			// 	if (this.types7 == 1) {
			// 		week.push(7)
			// 	}
			// 	if (this.state == '0') {
			// 		this.date = '2024-12-12'
			// 	}

			// 	this.$httpapi('project/addTbCustomerRoute', 'POST', {
			// 		customerId: uni.getStorageSync('customerId'),
			// 		type: this.type,
			// 		state: this.list[this.state].value,
			// 		week: week.toString(),
			// 		startLonLat: this.startLonLat,
			// 		endLonLat: this.endLonLat,
			// 		startTime: this.date + ' ' + this.shiList[this.shiIndex] + ':' + this.fenList[this
			// 			.fenIndex],
			// 		endTime: this.date + ' ' + this.shiList[this.shiIndexs] + ':' + this.fenList[this
			// 			.fenIndexs],
			// 		startAddress: this.startAddress,
			// 		endAddress: this.endAddress,
			// 		attention: this.attention,
			// 		comment: this.comment,
			// 		price: this.price
			// 	}).then(res => {
			// 		if (res.code == '200') {
			// 			uni.navigateBack()
			// 		} else {
			// 			alert('情報に不備があります。出発地の目的地と出発時間が入力されていることを確認してください!')
			// 		}

			// 	})
			// },
			chuangjian() {
			    var week = [];
			    if (this.types1 == 1) week.push(1);
			    if (this.types2 == 1) week.push(2);
			    if (this.types3 == 1) week.push(3);
			    if (this.types4 == 1) week.push(4);
			    if (this.types5 == 1) week.push(5);
			    if (this.types6 == 1) week.push(6);
			    if (this.types7 == 1) week.push(7);
			
			    // 构造行程请求参数对象
			    const routeData = {
			        customerId: uni.getStorageSync('customerId'),
			        type: this.type,
			        state: this.list[this.state].value,
			        week: week.toString(),
			        startLonLat: this.startLonLat,
			        endLonLat: this.endLonLat,
			        startAddress: this.startAddress,
			        endAddress: this.endAddress,
			        attention: this.attention,
			        comment: this.comment,
			        price: this.price,
			        shiList: this.shiList,
			        shiIndex: this.shiIndex,
			        shiIndexs: this.shiIndexs,
			        fenList: this.fenList,
			        fenIndex: this.fenIndex,
			        fenIndexs: this.fenIndexs,
			        date: this.date // 用于计算 startTime 和 endTime
			    };
			
			    // 当 state 不等于 '1' 时
				const currentWeekNumber = this.getWeekNumber(new Date());
				uni.setStorageSync('lastExecutedWeek', currentWeekNumber);
				let scheduledTasks = uni.getStorageSync('scheduledTasks') || [];
				scheduledTasks.push(routeData);
				uni.setStorageSync('scheduledTasks', scheduledTasks);
			    if (this.list[this.state].value !== '1') {
			        // 立即发布当周的所有行程请求
			        const currentWeekRoutes = this.generateWeekRoutes(routeData, week);
			        currentWeekRoutes.forEach(route => {
			            // 发送请求
			            this.$httpapi('project/addTbCustomerRoute', 'POST', route).then(res => {
			                if (res.code == '200') {
			                    console.log('行程发布成功');
								
								uni.navigateBack();
			                } else {
			                    alert('情報に不備があります。出発地の目的地と出発時間が入力されていることを確認してください!');
			                }
			            });
			        });
			
			        // 将整个 routeData 对象存储到定时任务数组中
			       
			
			        // 返回上一页
			        
			    } else {
			        // state === '1' 的情况下，直接发送一次请求
			        const startTime = this.date + ' ' + this.shiList[this.shiIndex] + ':' + this.fenList[this.fenIndex];
			        const endTime = this.date + ' ' + this.shiList[this.shiIndexs] + ':' + this.fenList[this.fenIndexs];
			
			        this.$httpapi('project/addTbCustomerRoute', 'POST', {
			            ...routeData,
			            startTime: startTime,
			            endTime: endTime
			        }).then(res => {
			            if (res.code == '200') {
			                uni.navigateBack();
			            } else {
			                alert('情報に不備があります。出発地の目的地と出発時間が入力されていることを確認してください!');
			            }
			        });
			    }
			},
			getWeekNumber(date) {
			    const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
			    const pastDaysOfYear = (date - firstDayOfYear + (firstDayOfYear.getDay() * 86400000)) / 86400000;
			    return Math.ceil((pastDaysOfYear + 1) / 7);
			},
			generateWeekRoutes(routeData, week) {
			    const routes = [];
			    const today = new Date();
			    const currentWeekDay = today.getDay() === 0 ? 7 : today.getDay(); // 将周日从0调整为7
			
			    week.forEach(day => {
			        // 计算当周的日期
			        let daysToAdd = day - currentWeekDay;
			        if (daysToAdd < 0) {
			            daysToAdd += 7; // 如果已经过了，则计算下周的日期
			        }
			
			        const targetDate = new Date(today);
			        targetDate.setDate(today.getDate() + daysToAdd);
			
			        // 格式化日期为 'YYYY-MM-DD'
			        const year = targetDate.getFullYear();
			        const month = ('0' + (targetDate.getMonth() + 1)).slice(-2);
			        const dayOfMonth = ('0' + targetDate.getDate()).slice(-2);
			        const dateString = `${year}-${month}-${dayOfMonth}`;
			
			        // 构造 startTime 和 endTime
			        const startTime = dateString + ' ' + routeData.shiList[routeData.shiIndex] + ':' + routeData.fenList[routeData.fenIndex];
			        const endTime = dateString + ' ' + routeData.shiList[routeData.shiIndexs] + ':' + routeData.fenList[routeData.fenIndexs];
			
			        routes.push({
			            ...routeData,
			            startTime: startTime,
			            endTime: endTime,
			            state: '1' // 设置为 '1'，表示发布行程
			        });
			    });
			
			    return routes;
			},
			qiehuan(type) {
				console.log(type, '------------')
				if (type == 0) {
					if (this.types1 == 1) {
						this.types1 = 0
					} else {
						this.types1 = 1
					}
				} else if (type == 1) {
					if (this.types2 == 1) {
						this.types2 = 0
					} else {
						this.types2 = 1
					}
				} else if (type == 2) {
					if (this.types3 == 1) {
						this.types3 = 0
					} else {
						this.types3 = 1
					}
				} else if (type == 3) {
					if (this.types4 == 1) {
						this.types4 = 0
					} else {
						this.types4 = 1
					}
				} else if (type == 4) {
					if (this.types5 == 1) {
						this.types5 = 0
					} else {
						this.types5 = 1
					}
				} else if (type == 5) {
					if (this.types6 == 1) {
						this.types6 = 0
					} else {
						this.types6 = 1
					}
				} else if (type == 6) {
					if (this.types7 == 1) {
						this.types7 = 0
					} else {
						this.types7 = 1
					}
				}
			},
			personal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation'
				})
			},

			clickGmap(e) {
				this.longlat = e.latLng.lat() + ',' + e.latLng.lng()

				console.log(e, this.longlat, '----------当前标点信息')
				this.$emit('setLongLat', this.longlat)

				this.addDraggableMarkers(1, false, {
					lat: e.latLng.lat(),
					lng: e.latLng.lng()
				})
			},
			addDraggableMarkers(max, draggable, {
				lat = 0,
				lng = 0
			}) {
				if (max != -1) {
					this.marker.forEach((marker) => {
						marker.setMap(null)
					})
					this.marker = []
				}
				this.marker.push(
					new this.googleApi.maps.Marker({
						map: this.googleMap,
						position: {
							lat: lat,
							lng: lng
						},
						draggable: draggable,
					})
				)
				console.log(this.marker, '--------')
			},
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #F6F6F6;
	}

	.map {
		width: 63.24rem;
		height: 47.431rem;
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

		.boxs {
			width: 3.794rem;
			height: 3.083rem;
			border-radius: 7px;
			border: 1px solid #707070;
			align-items: center;
			padding: 0 0.79rem;
		}

		.buttonss {
			width: 1 1.581rem;
			height: 3.162rem;
			background: #F44870;
			border: 1px solid #F44870;
			border-radius: 1.423rem;
			font-size: 1.739rem;
			color: #FFFFFF;
			line-height: 3.162rem;
			text-align: center;
			margin: 0 0 0 1.581rem;
			cursor: pointer;
		}

		.buttonsx {
			width: 1 1.581rem;
			height: 3.162rem;
			border-radius: 1.423rem;
			border: 1px solid #F44870;
			font-weight: bold;
			font-size: 1.739rem;
			color: #F44870;
			line-height: 3.162rem;
			text-align: center;
			cursor: pointer;
		}
	}
</style>