//
//  ViewController.swift
//  Shares
//
//  Created by PCS170 on 17/03/20.
//  Copyright © 2020 PCS170. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountValueTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var totalProfitTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
//    var shareDataArray: [ShareData] = [ShareData]
    var shares = ["L&T", "NHPC", "SBICard","Appollo","Edelweiss", "ITC",  "TCS","CEAT", "HDFCBank","PowerGrid",  "AXISBank", "BajajFinsv", "CIPLA",  "EKC","EMCO"]
    var buy = [100.00,25.60,80.00,250.00,290.24,153.95,456.00,200.00,806.00, 190.00, 30.50,31.60, 140.00,80.50, 25.60]
    var sell = [112.00,28.80,85.40,195.00,62.80,244.94,561.00,205.44,1008.50,565.45,80.54,81.65,157.45,88.50,00.45]
//    var newbuy:[Double] = []
//    var newsell:[Double] = []
//    var newCompany:[String] = []
    var profit:[Double] = []
    var profitpr:[Double] = []
    
    var arrayOfShared : [[String :Any ]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountValueTextField.layer.cornerRadius = 5.0
        calculateButton.layer.cornerRadius = 5.0
//        let s1 = ShareData(shareName: "", sellPrice: 112.0, buyPrice: 100.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCalculate(_ sender: Any) {
        let amount = Double(amountValueTextField.text!)!
        view.endEditing(true)
        totalAmountTextField.text = amountValueTextField.text
        for (index,element) in buy.enumerated(){
             if amount - element > 0{
                
                var dic : [String : Any] = [:]
                dic["sell"] = sell[index]
                dic["buy"] = element
                dic["company"] = shares[index]
             
                arrayOfShared.append(dic)
//                newsell.append(sell[index])
//                newbuy.append(element)
//                newCompany.append(shares[index])
                }
     }
//    print(newbuy)
//    print(newsell)
        for (index,element) in arrayOfShared.enumerated(){
            var dic = arrayOfShared[index]
            let sell = dic["sell"] as! Double
            let buy = dic["buy"] as! Double
            if sell - buy > 0{
                arrayOfShared[index]["profit"] = sell - buy
            }
//            if newsell[index] - newbuy[index] > 0 {
//                profit.append(newsell[index] - newbuy[index])
//            }
            
            
        }
        print(profit)
        for(index,element) in profit.enumerated() {
            var dic = arrayOfShared[index]
            let buyPrice = dic["buy"] as! Double
            var profitpercentage = ((element/buyPrice) * 100.0)
            dic["profitpr"] = profitpercentage
//            profitpr.append(profitpercentage)
            print(dic["company"])
        }
//        var max = profitpr[0]
//        for maxPrecentage in profitpr {
//            if max > maxPrecentage {
//                max = maxPrecentage
//            }
//        }
        
         tableView.reloadData()
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfShared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        cell.profitLabel.text = "\(arrayOfShared[indexPath.row]["profit"] ?? "")"
        
        return cell
    }
    
    
}

