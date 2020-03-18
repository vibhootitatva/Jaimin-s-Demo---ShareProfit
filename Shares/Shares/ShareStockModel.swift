//
//  ShareStockModel.swift
//  Shares
//
//  Created by PCS170 on 18/03/20.
//  Copyright © 2020 PCS170. All rights reserved.
//

import UIKit

class ShareStockModel: NSObject {

    var id                      : Int!      = 0
    var shareName               : String!   = ""
    var shareBuyingPrice        : Double!   = 0
    var shareSellingPrice       : Double!   = 0
    var shareProfitPrice        : Double!   = 0
    var shareProfitPercentage   : Double!   = 0
    
    init(id : Int, name: String, buyRate : Double, sellRate : Double) {
        self.id                 = id
        shareName               = name
        shareBuyingPrice        = buyRate
        shareSellingPrice       = sellRate
        shareProfitPrice        = sellRate - buyRate
        shareProfitPercentage   = Double((100 * shareProfitPrice) / buyRate)
    }
    
}
