//
//  FoodItemDetailViewController.swift
//  MapONNTest
//
//  Created by Abhinav Verma on 11/08/20.
//  Copyright © 2020 Abhinav Verma. All rights reserved.
//

import UIKit
import Cosmos

class FoodItemDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var itemDetailView: UIView!
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    var foodDetails: DataClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupitemDetailView()
        
        let imageURL = URL(string: foodDetails?.image ?? "")
            name.text = foodDetails?.name
            price.text = foodDetails?.price
            weight.text = "\(foodDetails?.weight!) \(foodDetails?.unit ?? "")"
            foodImageView.sd_setImage(with:imageURL, completed: nil)
        ratingView.rating = Double(foodDetails?.rating ?? 0)
    }

    func setupitemDetailView(){
        itemDetailView.layer.cornerRadius = 5
        itemDetailView.layer.shadowColor = UIColor.lightGray.cgColor
        itemDetailView.layer.shadowOffset = CGSize(width: 1, height: 1)
        itemDetailView.layer.shadowRadius = 5
        itemDetailView.layer.shadowOpacity = 0.6
    }

}
