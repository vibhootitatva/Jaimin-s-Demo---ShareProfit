//
//  ViewController.swift
//  Shares
//
//  Created by PCS170 on 17/03/20.
//  Copyright © 2020 PCS170. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets -
    @IBOutlet private weak var amountValueTextField : UITextField!
    @IBOutlet private weak var calculateButton      : UIButton!
    @IBOutlet private weak var totalAmountTextField : UITextField!
    @IBOutlet private weak var totalProfitTextField : UITextField!
    @IBOutlet private weak var tableView            : UITableView!
    
    // MARK: - Variables -
    private var shareStockArray : [ShareStockModel] = []
    
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
    var arrayOfSharedToDisplay : [[String :Any ]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let s1 = ShareData(shareName: "", sellPrice: 112.0, buyPrice: 100.0)
        // Do any additional setup after loading the view.
    }
    func alert(message:String) {
        let alert = UIAlertController(title: "Entered amount Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func didTapOnCalculate(_ sender: Any) {
        self.arrayOfShared = [] // starting ma initialised maate??
        amountValueTextField.resignFirstResponder()
        let amount = Double(amountValueTextField.text!)!
        totalAmountTextField.text = amountValueTextField.text
        for (index,element) in buy.enumerated(){
            if (amount > 3000) {
                self.alert(message: "Please Enter  value Less than 3000 ")
                break
            }
            
            if amount - element >= 0{
                
                var dic : [String : Any] = [:]
                dic["sell"] = sell[index]
                dic["buy"] =   buy[index]
                dic["company"] = shares[index]
                arrayOfShared.append(dic)
                
                
            }
            print(arrayOfShared)
        }
        //    print(newbuy)
        //    print(newsell)
        self.profit = []
        for (index,element) in arrayOfShared.enumerated(){
            //            var dic = arrayOfShared[index]
            //            let sell = dic["sell"] as! Double
            let sell = arrayOfShared[index]["sell"] as! Double
            //            let buy = dic["buy"] as! Double
            let buy = arrayOfShared[index]["buy"] as! Double
            if sell - buy > 0{
                arrayOfShared[index]["profit"] = sell - buy
                arrayOfShared[index]["profitpr"] = ((sell-buy)/buy)*100
                profitpr.append(((sell-buy)/buy)*100)
                profit.append(sell - buy)
            }
            //            if newsell[index] - newbuy[index] > 0 {
            //                profit.append(newsell[index] - newbuy[index])
            //            }
            
            
        }
        print(profit)
        print(profitpr)
//        let sortProfit = profit.sorted(by: {$0 > $1});
//        print("Sort Profit \(sortProfit)")
//        for(index,element) in profit.enumerated() {
            //            var dic = arrayOfShared[index]
            //            let buyPrice = dic["buy"] as! Double
//            let buyPrice = arrayOfShared[index]["buy"] as! Double
//            var profitpercentage = ((element/buyPrice) * 100.0)
//            arrayOfShared[index]["profitpr"] = profitpercentage
//            profitpr.append(profitpercentage)
//            print(arrayOfShared[index]["company"])
//        }
        //        var max = profitpr[0]
        //        for maxPrecentage in profitpr {
        //            if max > maxPrecentage {
        //                max = maxPrecentage
        //            }
        //        }
       var sorted = arrayOfShared.sorted(by: {$0["profitpr"] as? Double ?? 0.0 > $1["profitpr"] as? Double ?? 0.0})
       
        print(sorted)
        
        self.arrayOfSharedToDisplay = []
        var amt = Double(self.amountValueTextField.text!)!
        var newProfit = 0.0
        for(index,element) in sorted.enumerated() {
            var buy = element["buy"] as? Double ?? 0.0
            var profit = element["profit"] as? Double ?? 0.0
            if buy <= amt {
                amt = amt - buy
                newProfit += profit
//                let profitpercentage = (profit/buy)*100.0
//                profitpr.append(profitpercentage)
                arrayOfSharedToDisplay.append(element)
            }
            print(profitpr)
        }
        
        self.totalProfitTextField.text = "\(newProfit.rounded())"
        tableView.reloadData()
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSharedToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        let profit = arrayOfSharedToDisplay[indexPath.row]["profit"] as? Double ?? 0.0
        cell.profitLabel.text = "\(profit.rounded())"
//        let profitpercent = profitpr[indexPath.row]
//        cell.profitpercentLabel.text = "\(profitpercent.rounded())"
        let profitpercent = arrayOfSharedToDisplay[indexPath.row]["profitpr"] as? Double ?? 0.0
        cell.profitpercentLabel.text = "\(profitpercent.rounded())"
        cell.sharesLabel.text = "\(arrayOfSharedToDisplay[indexPath.row]["company"] ?? "")"
        cell.buyLabel.text = "\(arrayOfSharedToDisplay[indexPath.row]["buy"] ?? "")"
        cell.sellLabel.text = "\(arrayOfSharedToDisplay[indexPath.row]["sell"] ?? "")"
        return cell
    }
    
    
}

// MARK: - Helper Methods -
extension ViewController {
    
    private func prepareView() {
        shareStockArray.append(ShareStockModel.init(id: 1, name: "L&T", buyRate: 100.00, sellRate:112.0))
        shareStockArray.append(ShareStockModel.init(id: 2, name: "NHPC", buyRate: 25.60, sellRate:28.80))
        shareStockArray.append(ShareStockModel.init(id: 3, name: "SBICard", buyRate: 80.00, sellRate:85.40))
        shareStockArray.append(ShareStockModel.init(id: 4, name: "Appollo", buyRate: 250.00, sellRate: 195.00))
        shareStockArray.append(ShareStockModel.init(id: 5, name: "Edelweiss", buyRate: 290.24, sellRate:62.80))
        shareStockArray.append(ShareStockModel.init(id: 6, name: "ITC", buyRate: 153.95, sellRate: 244.94))
        shareStockArray.append(ShareStockModel.init(id: 7, name: "TCS", buyRate: 456.00, sellRate:561.00))
        shareStockArray.append(ShareStockModel.init(id: 8, name: "CEAT", buyRate: 200.00, sellRate: 205.44))
        shareStockArray.append(ShareStockModel.init(id: 9, name: "HDFCBank", buyRate: 806.00, sellRate: 1008.50))
        shareStockArray.append(ShareStockModel.init(id: 10,name: "PowerGrid", buyRate: 190.00, sellRate:565.45))
        shareStockArray.append(ShareStockModel.init(id: 11,name: "AxisBank", buyRate: 30.50, sellRate: 80.54))
        shareStockArray.append(ShareStockModel.init(id: 12,name: "Bajaj", buyRate: 31.60, sellRate:81.65))
        shareStockArray.append(ShareStockModel.init(id: 13,name: "Cipla", buyRate: 140.00, sellRate:157.45))
        shareStockArray.append(ShareStockModel.init(id: 14,name: "Ekc", buyRate: 80.50, sellRate:88.50))
        shareStockArray.append(ShareStockModel.init(id: 15,name: "EMCO", buyRate: 25.60, sellRate:00.45))
    }
    
}
