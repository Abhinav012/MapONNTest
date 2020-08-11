//
//  ChooseListOrGridViewController.swift
//  MapONNTest
//
//  Created by Abhinav Verma on 11/08/20.
//  Copyright © 2020 Abhinav Verma. All rights reserved.
//

import UIKit

class ChooseListOrGridViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChooseListOrGridViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LayoutCell", for: indexPath)
        
        if indexPath.row == 0{
        cell.textLabel?.text = "List Layout"
        }else {
            cell.textLabel?.text = "Grid Layout"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBD = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 0{
            let vc = storyBD.instantiateViewController(identifier: "ViewController") as! ViewController
            self.present(vc, animated: true, completion: nil)
        }else{
            let vc = storyBD.instantiateViewController(identifier: "FoodGridViewController") as! FoodGridViewController
            self.present(vc, animated: true, completion: nil)

        }
    }
}
