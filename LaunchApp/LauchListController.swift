//
//  ViewController.swift
//  LaunchApp
//
//  Created by Mustafa Erden on 9.11.2021.
//

import UIKit
import Alamofire

class LauchListController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var array: [LaunchModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        let url = "https://api.spacexdata.com/v3/launches"
        
        AF.request(url, method: .get, parameters: nil).responseJSON { (res) in
            if (res.response?.statusCode == 200 ) {
                
                let jsLaunch = try? JSONDecoder().decode([LaunchModel].self, from: res.data!)
                self.array = jsLaunch ?? []
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LaunchTableViewCell
        let launch = array[indexPath.row]
        cell.launchNameLabel.text = launch.mission_name
        cell.yearLabel.text = launch.launch_year
        cell.reasonLabel.text = launch.details
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.rocketSelected = (array[indexPath.row].rocket?.rocket_id)!
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
        
        
        
    }
    
}
