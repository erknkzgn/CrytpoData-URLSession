//
//  CryptoViewModel.swift
//  CrytpoData-URLSession
//
//  Created by Erkan Kızgın on 24.01.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRows() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAddIndex(indeks : Int) -> CryptoViewModel{
        let crypto = self.cryptoCurrencyList[indeks]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}
