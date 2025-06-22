var express = require('express');
var router = express.Router();

/* fincode決済登録呼び出しAPI
 * http://localhost:3000/payment にPOSTを投げると、
 * 決済登録APIのレスポンスをJSON形式で返す。
 */
router.post('/', function(req, res, next) {
	"use strict";

	const console = require("console");
	const request = require("request");
	const API_KEY = "Bearer m_prod_NWY4YmYwYzgtZjRiNi00MTIyLTljNDItNjFmYzBkYWZlYTk0MWMwOGNlM2QtZTBmYi00NjFjLThlNzktZTkyNGQwMDU0ZTk1c18yNDA4MDY2OTExNQ";
	const BASE_URL = "https://api.fincode.jp";
	const endpoint = "/v1/payments";

	const DATA = {
		pay_type: "Card",
		job_code: "CAPTURE",
		amount: req.body.amount,
	};

	const options = {
		url: BASE_URL + endpoint,
		proxy: PROXY_URL,
		headers: {
			"Content-Type": "application/json; charset=utf-8",
			Authorization: API_KEY,
		},
		json: DATA,
	}

	main();

	function main() {

		request.post(options, (error, response, body) => {

			if (200 != response.statusCode) {
				console.log("ERROR");
				console.log(body);

			} else {
				console.log("SUCCESS");
				console.log(body);

				res.header('Content-Type', 'application/json; charset=utf-8')
				res.send(body);
			}
		});
	}
});

module.exports = router;