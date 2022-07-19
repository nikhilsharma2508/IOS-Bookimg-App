

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var myswitch: UISwitch!
    @IBOutlet weak var txterror: UILabel!
    
    var userdata = DataSource.shared.userlist
    
    let KEY_NAME : String = "Email_id"
    let KEY_PASSWORD : String = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // self.navigationItem.title = "Tourist Activities"
//        navigationItem.titleView?.tintColor = UIColor.red
        self.navigationItem.hidesBackButton = true
        
        self.txtemail.text = UserDefaults.standard.string(forKey: KEY_NAME)
        self.txtpassword.text = UserDefaults.standard.string(forKey:KEY_PASSWORD)
      
    }
    

    @IBAction func btnsignin(_ sender: Any) {
       
        let name = self.txtemail.text ?? ""
        let password = self.txtpassword.text ?? ""
        
        if(self.validatedata())
        {
        if(myswitch.isOn == true)
            {
            print("switch on")
            if (!name.isEmpty && !password.isEmpty)
            {
                print(#function, "Adding name to defaults \(name)")
                UserDefaults.standard.set(name, forKey: KEY_NAME)
                UserDefaults.standard.set(password,forKey: KEY_PASSWORD)
            }
        }
             else if(myswitch.isOn == false){
                print(#function, "removing name to defaults \(name)")
             print("switch off")
                UserDefaults.standard.removeObject(forKey:KEY_NAME)
                UserDefaults.standard.removeObject(forKey: KEY_PASSWORD)
               
    }
        
            self.txterror.text = ""
       guard let screen2 = storyboard?.instantiateViewController(withIdentifier: "ActivityList") as? ActivityListVC else{
            print(#function, "Unable to find detail screen")
            return}
            screen2.emailscreen2 = name
        self.navigationController?.pushViewController(screen2, animated: true)
        }
            else
            {
                self.txterror.text = "enter correct email and password"
            }
   
    }
    
    
    func validatedata() ->Bool
    {
        let validdata = true
        let name = self.txtemail.text ?? ""
        let password = self.txtpassword.text ?? ""            
        if(name.isEmpty)
        {self.txterror.text = "Name cannot be empty"}
        if(password.isEmpty)
        {self.txterror.text = "Password cannot be empty"}
        else{
            for i in 0..<userdata.count
            {
                if(DataSource.shared.userlist[i].Email == name && DataSource.shared.userlist[i].password == password)
                    {
                        return validdata
                    }
                 }
        }
        return false
    }
    
}


