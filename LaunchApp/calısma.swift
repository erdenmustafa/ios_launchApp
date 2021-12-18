//
//  calısma.swift
//  LaunchApp
//
//  Created by Mustafa Erden on 9.11.2021.
//

import Foundation
var array: [Bilgiler] = []

@IBOutlet weak var tableView: UITableView!

override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let url = "https://www.jsonbulut.com/json/product.php"
    let params = [ "ref":"c7c2de28d81d3da4a386fc8444d574f2","start":"0" ]
    
    
    AF.request(url, method: .get, parameters: params).responseJSON { (res) in
        if (res.response?.statusCode == 200 ) {
            let js = try? JSONDecoder().decode(JSONData.self, from: res.data!)
            self.array = js?.products[0].bilgiler as! [Bilgiler]
            self.tableView.reloadData()
