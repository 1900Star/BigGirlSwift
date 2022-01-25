//
//  NetworkAPI.swift
//  ShoppingDemo
//
//  Created by 罗诗朋 on 2022/1/24.
//

import UIKit
import Alamofire
//  iPhone_1.json
private let BaseUrl = "https://raw.githubusercontent.com/xiaoyouxinqing/Learn-iOS-from-Zero/main/API/Shopping/"

class NetworkAPI {
    

    
    static func homeProductList(completion: @escaping (Result<[Product],Error>) -> Void){
        
        AF.request(BaseUrl + "iPhone_1.json").responseData{ response in
            switch response.result {
            case let .success(data):
                if let list = try? JSONDecoder().decode([Product].self, from: data){
                    completion(.success(list))
                    
                } else {
                    let error = NSError(domain: "NetworkAPIDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decode error"])
                    completion(.failure(error))
                    
                }
            case let .failure(error):
                completion(.failure(error))
                
            }
            
            }
      
        
    }
    
}
