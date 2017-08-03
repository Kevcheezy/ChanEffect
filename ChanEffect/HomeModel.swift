//
//  HomeModelProtocol.swift
//  ChanEffect
//
//  Created by Kevin Chan on 7/15/17.
//  Copyright © 2017 Kevin Chan. All rights reserved.
//

import UIKit

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    weak var delegate: HomeModelProtocol!
    
    let serviceURLPath: String = "http://chandatacenter.com/service.php"

    
    func downloadItems() {
        let url: URL = URL(string: serviceURLPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("----Data downloaded----")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let customers = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let customer = CustomerModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let firstName = jsonElement["firstName"] as? String,
                let lastName = jsonElement["lastName"] as? String,
                let age = jsonElement["age"] as? String,
                let sex = jsonElement["sex"] as? String,
                let email = jsonElement["email"] as? String
            {
                
                customer.firstName = firstName
                customer.lastName = lastName
                customer.age = age
                customer.sex = sex
                customer.email = email
                
            }
            
            customers.add(customer)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: customers)
            
        })
    }
    
}
