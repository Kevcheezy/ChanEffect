//
//  ViewController.swift
//  ChanEffect
//
//  Created by Kevin Chan on 7/8/17.
//  Copyright © 2017 Kevin Chan. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    @IBOutlet weak var ageContent: UILabel!
    @IBOutlet weak var clientNameContent: UILabel!
    @IBOutlet weak var sexContent: UILabel!
    @IBOutlet weak var emailContent: UILabel!
    
    var selectedCustomer: CustomerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        clientNameContent.text = selectedCustomer!.firstName! + " " + selectedCustomer!.lastName!
        ageContent.text = selectedCustomer!.age!
        sexContent.text = selectedCustomer!.sex!
        emailContent.text = selectedCustomer!.email!
    }
    

    
}

