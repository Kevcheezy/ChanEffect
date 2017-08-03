
import UIKit
import Foundation
import Alamofire

class NewClientViewController: UIViewController {
    
    let URL_USER_REGISTER = "http://chandatacenter.com/addClient.php"
    
    @IBOutlet weak var emailContent: UITextField!
    @IBOutlet weak var firstNameContent: UITextField!
    @IBOutlet weak var lastNameContent: UITextField!
    @IBOutlet weak var ageContent: UITextField!
    @IBOutlet weak var sexContent: UITextField!
    @IBOutlet weak var passwordContent: UITextField!
    
    @IBAction func doneRegister(_ sender: Any) {
        //creating parameters for the post request
        let parameters: Parameters=[
            "firstName":firstNameContent.text!,
            "lastName":lastNameContent.text!,
            "email":emailContent.text!,
            "password":passwordContent.text!,
            "age":ageContent.text!,
            "sex":sexContent.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON
            {
                response in
                print(response)
                
        }
        

    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


