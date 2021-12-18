//
//  DetailViewController.swift
//  LaunchApp
//
//  Created by Mustafa Erden on 18.11.2021.
//

import UIKit
import Alamofire
import SDWebImage

class DetailViewController: UIViewController {
    
    var detail: RocketDetailModel?

    var rocketSelected = ""
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "https://api.spacexdata.com/v3/rockets/\(rocketSelected)"
        
        AF.request(url, method: .get, parameters: nil).responseJSON { (res) in
            if (res.response?.statusCode == 200 ) {
                let jsRocket = try? JSONDecoder().decode(RocketDetailModel.self, from: res.data!)
                self.detail = jsRocket
                if let url = self.detail?.flickr_images?[0] {
                    self.rocketImageView.sd_setImage(with: URL(string: url), completed: nil)
                }
                
                let date = self.getDate(from: self.detail?.first_flight ?? "")
                let myDateString = self.getFormattedDate(date: date ?? Date(), format: "dd-MMM-yyyy")
                self.firstFlightLabel.text = myDateString
                self.rocketNameLabel.text = self.detail?.rocket_name
                self.descriptionLabel.text = self.detail?.description
                self.companyLabel.text = self.detail?.company
                
                
            }
            
        }
        
    }
    
    func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    
    func getDate(from: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: from) // replace Date String
    }
   
}
