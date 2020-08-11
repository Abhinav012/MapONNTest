//
//  ViewController.swift
//  MapONNTest
//
//  Created by Abhinav Verma on 11/08/20.
//  Copyright © 2020 Abhinav Verma. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var foodItemsCollectionView: UICollectionView!
    var foodItems: [Datum]? = [Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeAPICallForFoodItems(limit: 6, offset: 0)

        
    }

    func makeAPICallForFoodItems(limit: Int, offset: Int){
        APIManager.manager.fetchBestsellersProducts(limit: limit, offset: offset, completion: {(success, error) in
        
                if success{
                    
                    DispatchQueue.main.async {
                        self.foodItems?.append(contentsOf: APIManager.dataResponse?.data ?? [Datum]())
                        self.foodItemsCollectionView.reloadData()
                    }
                    
                    //print(APIManager.dataResponse?.data.count)
                }
            
            })
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as! FoodItemCollectionViewCell
        let food = foodItems![indexPath.row]
        
        cell.itemImageView.sd_setImage(with: URL(string: food.image ?? ""), completed: nil)
        cell.itemName.text = food.name
        cell.price.text = food.price
        cell.weight.text = "\(food.weight!) \(food.unit!)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == (foodItems?.count ?? 0)-1{
            makeAPICallForFoodItems(limit: 6, offset: indexPath.row)
        }
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width 
        return CGSize(width: width, height: 164)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let foodItem = foodItems![indexPath.row]
        
        APIManager.manager.fetchProductDetails(productId: Int(foodItem.productID ?? "-1")! ) { (success, error) in
                    if success{
                        let foodDetails = APIManager.productDetails?.data
                        
                        DispatchQueue.main.async {
                               let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FoodItemDetailViewController") as! FoodItemDetailViewController
                            vc.foodDetails = foodDetails
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                }
        
        
    }
    
}
