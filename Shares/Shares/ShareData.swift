//
//  File.swift
//  Shares
//
//  Created by PCS170 on 17/03/20.
//  Copyright © 2020 PCS170. All rights reserved.
//

import Foundation

class ShareData {
    
    var shareName: String = ""
    var sellPrice: Double = 0.0
    var buyPrice: Double = 0.0
    
    init(shareName: String,sellPrice: Double,buyPrice: Double) {
        self.shareName = shareName
        self.sellPrice = sellPrice
        self.buyPrice = buyPrice
    }
    
}
