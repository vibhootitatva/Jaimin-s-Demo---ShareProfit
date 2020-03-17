//
//  DataTableViewCell.swift
//  Shares
//
//  Created by PCS170 on 17/03/20.
//  Copyright © 2020 PCS170. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
