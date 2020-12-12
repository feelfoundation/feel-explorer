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
import AppHeader from './header.module';

const HeaderConstructor = function ($rootScope) {
	this.updateBlockStatus = (res) => {
		if (res.success) {
			$rootScope.blockStatus = {
				height: res.height,
				fee: res.fee,
				milestone: res.milestone,
				reward: res.reward,
				supply: res.supply,
				nethash: res.nethash,
			};
		}
	};

	this.updatePriceTicker = (res) => {
		if (res.success) {
			$rootScope.currency.tickers = res.tickers;
		}

		// When ticker for user-stored currency is not available - switch to F39 temporarily
		if ($rootScope.currency.symbol !== 'F39' &&
			(!$rootScope.currency.tickers ||
			!$rootScope.currency.tickers.F39 ||
			!$rootScope.currency.tickers.F39[$rootScope.currency.symbol])) {
			$rootScope.currency.symbol = 'F39';
		}
	};

	return this;
};

// eslint-disable-next-line no-unused-vars
AppHeader.factory('Header', $rootScope => HeaderConstructor);
