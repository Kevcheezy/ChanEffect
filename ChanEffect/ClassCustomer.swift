//
//  ClassCustomer.swift
//  ChanEffect
//
//  Created by Kevin Chan on 7/15/17.
//  Copyright © 2017 Kevin Chan. All rights reserved.
//

import Foundation

class CustomerModel : NSObject{
    
    //properties
    var firstName: String?
    var lastName:  String?
    var age: String?
    var sex: String?
    var email: String?
    
    //empty constructor
    override init(){
        
    }
    
    //constructor
    init(firstName: String, lastName: String, age: String, sex: String, email: String){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.sex = sex
        self.email = email
        
    }
    
    //prints object's current state
    override var description: String{
        return "First Name: \(String(describing: firstName)), Last Name: \(String(describing: lastName)), Age: \(String(describing: age)), Sex: \(String(describing: sex))"
        
    }
    
}
