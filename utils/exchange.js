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
const _ = require('underscore');

module.exports = function (config) {
	this.tickers = {};
	const api = require('./exchange-api')(config);

	this.loadRates = () => {
		if (!config.exchangeRates.enabled) {
			return false;
		}

		return api.getPriceTicker((err, result) => {
			if (result) {
				_.each(result.BTC, (ticker, key) => {
					if (!result.F39[key]) {
						result.F39[key] = result.F39.BTC * ticker;
					}
				});
				this.tickers = result;
			}
		});
	};

	if (config.exchangeRates.enabled) {
		setInterval(this.loadRates, config.exchangeRates.updateInterval);
	}
};
