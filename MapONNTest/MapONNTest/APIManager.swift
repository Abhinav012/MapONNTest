//
//  APIManager.swift
//  MapONNTest
//
//  Created by Abhinav Verma on 11/08/20.
//  Copyright © 2020 Abhinav Verma. All rights reserved.
//

import Foundation

struct APIManager{
    static var manager = APIManager()
    static var baseUrl = "http://www.dfarmfresh.com/src"
    static var dataResponse: DataResponse?
    static var productDetails: ProductDetails?
    
    private init(){
        
    }
    
    static func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    func fetchBestsellersProducts(limit: Int, offset: Int, completion: @escaping (Bool,Error?) -> Void ){
        
        
        
        let parameters = ["route": "api/v2_0_5/products/bestsellers",
                          "limit": "\(limit)", "offset" : "\(offset)"]
        
        let string = APIManager.getPostString(params: parameters)
        let endPoint = APIManager.baseUrl+"?"+string
        let url = URL(string: endPoint)!
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("dlMDJT8UNnV8OFi8hk5OqCEUgYiAU6wsddud6M3iCn2RB1MmeaeDQt1F2axybRicFTXfrK5NO8ARBXCINPaEHuaPvn8P5ZiyBgAtsxxHJNpr28URCrTanE564lxUyeCT5r0hg1ITr0GOKDuvIAbwWGc8c5b7K0vcKUcirWi02qUYSkEfVhOv05EwCST8DOZ8r5ZMcxOsvcZtnXrZ42YYBy78xGwzlltGLLodTkqViEz2Sz3RAJaPOAC4iRjNCMk7", forHTTPHeaderField: "X-OC-MERCHANT-ID")
        urlRequest.addValue("100x100", forHTTPHeaderField: "X-OC-IMAGE-DIMENSION")
        
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error{
                completion(false,error)
                return
            }
            
            if let data = data{
                do{
                
                    let decoder = JSONDecoder()
                    APIManager.dataResponse = try decoder.decode(DataResponse.self, from: data)
                    completion(true,nil)
                }catch(let error){
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
    
    func fetchProductDetails(productId: Int, completion: @escaping (Bool,Error?) -> Void ){
        
        
        
        let parameters = ["route": "api/v2_0_5/products/product",
                          "id": "\(productId)"]
        
        let string = APIManager.getPostString(params: parameters)
        let endPoint = APIManager.baseUrl+"?"+string
        let url = URL(string: endPoint)!
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("dlMDJT8UNnV8OFi8hk5OqCEUgYiAU6wsddud6M3iCn2RB1MmeaeDQt1F2axybRicFTXfrK5NO8ARBXCINPaEHuaPvn8P5ZiyBgAtsxxHJNpr28URCrTanE564lxUyeCT5r0hg1ITr0GOKDuvIAbwWGc8c5b7K0vcKUcirWi02qUYSkEfVhOv05EwCST8DOZ8r5ZMcxOsvcZtnXrZ42YYBy78xGwzlltGLLodTkqViEz2Sz3RAJaPOAC4iRjNCMk7", forHTTPHeaderField: "X-OC-MERCHANT-ID")
        urlRequest.addValue("300x300", forHTTPHeaderField: "X-OC-IMAGE-DIMENSION")
        urlRequest.addValue("500x500", forHTTPHeaderField: "X-OC-IMAGE-DIMENSION-P")
        
        
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error{
                completion(false,error)
                return
            }
            
            if let data = data{
                do{
                
                    let decoder = JSONDecoder()
                    APIManager.productDetails = try decoder.decode(ProductDetails.self, from: data)
                    completion(true,nil)
                }catch(let error){
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
}
