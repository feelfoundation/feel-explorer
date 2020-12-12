/*
 * feelfoundation/feel-explorer
 * Copyright © 2018 Feel Foundation
 *
 * See the LICENSE file at the top-level directory of this distribution
 * for licensing information.
 *
 * Unless otherwise agreed in a custom licensing agreement with the Feel Foundation,
 * no part of this software, including this file, may be copied, modified,
 * propagated, or distributed except according to the terms contained in the
 * LICENSE file.
 *
 * Removal or modification of this copyright notice is prohibited.
 *
 */
const config = {};
config.feel = {};
config.freegeoip = {};
config.redis = {};
config.log = {};
config.exchangeRates = {
	exchanges: {
		F39: {},
		BTC: {},
	},
};
config.marketWatcher = { exchanges: {}, candles: { poloniex: {} }, orders: {} };
config.cacheDelegateAddress = {};
config.uiMessage = {};

module.exports = config;