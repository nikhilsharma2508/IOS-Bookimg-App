

import UIKit

class ActivityDetailVC: UIViewController {
  
    @IBOutlet weak var countDisplay2: UILabel!
    @IBOutlet weak var countDisplay: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var tvdescription: UITextView!
    @IBOutlet weak var lblagentname: UILabel!
    @IBOutlet weak var lblrating: UILabel!
    var x:Int = 1
    var y:Int = 0
    var x1:Int = 1
    var y1:Int = 0
    var x2:Int = 1
    var y2:Int = 0
    
    var emailscreen3:String = ""
   
    
    @IBOutlet weak var lblfavbookingresult: UILabel!
    var activitiesdisplay : DataSource.Database? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(emailscreen3)
        self.displayDetails()
        let LogoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        self.navigationItem.setRightBarButton(LogoutButton, animated: true)
        
   
        // Do any additional setup after loading the view.
    }
    private func displayDetails(){
        
        guard let receieveddata = self.activitiesdisplay else{
            print(#function, "details unavailable form previous screen")
            self.lblname.text = "Unavailable"
            self.lblprice.text = "Unavailable"
            self.image1.image = UIImage(named:"")
            self.image2.image = UIImage(named:"")
            self.tvdescription.text = "Unavailable"
            self.lblagentname.text = "Unavailable"
            self.lblrating.text = "Unavailable"
            return
        }
        
        self.lblname.text = receieveddata.title
        self.lblprice.text = receieveddata.price
        self.image1.image = UIImage(named:receieveddata.imageName)
        self.image2.image = UIImage(named: receieveddata.image2Name)
        self.tvdescription.text = receieveddata.titleDes
        self.lblagentname.text = "Host:" + receieveddata.host
        self.lblrating.text = "\(receieveddata.rating)/5"
        
    }


    @IBAction func btnnumber(_ sender: Any) {
    
    let number = "919951928921"
        let numberURL = URL(string: "tel://\(number)")!
        if UIApplication.shared.canOpenURL(numberURL){
            UIApplication.shared.open(numberURL)
            
        }
      }

    
    @IBAction func btnshare(_ sender: Any) {
        let share = UIActivityViewController(activityItems: [self.lblname.text,self.lblprice.text], applicationActivities:nil)
        self.present(share, animated: true, completion: nil)
        let LogoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        self.navigationItem.setRightBarButton(LogoutButton, animated: true)
    }
    
    @objc
    private func LogoutClicked(){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let screen1 = storyBoard.instantiateViewController(withIdentifier: "screen1") as! ViewController
        self.navigationController?.pushViewController(screen1, animated: true)

}
    
    @IBAction func favPressed(_ sender: Any) {
        self.countDisplay.text = ""
        self.lblfavbookingresult.text = "Added to favourites"
        guard let passData = activitiesdisplay?.title else {
            print("No datapassing")
            return  }
        guard let passData2 = activitiesdisplay?.price else {
            print("No datapassing")
            return  }
        
    
        if(self.emailscreen3 == "sushma@123"){
        if FavData.shared.favListing.contains(passData) == true ||  FavData.shared.favPrice.contains(passData2) == true {
                    print("Activity place is already in the list")
                    self.lblfavbookingresult.text = ""
                    //***
                    // 1. Create an Alert Box.
                    let box = UIAlertController(title: "Alert!", message: "Activity place is already in the list", preferredStyle: .alert)
                    
                    // 1b. Add some buttons
                    
                    box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    
                    
                    // 2. Show the popup
                    self.present(box, animated: true)
                    
                    //****
                }
            else {
                
                    FavData.shared.favListing.append(passData)
                FavData.shared.favPrice.append(passData2)

                }
        }
        
        if(self.emailscreen3 == "amit@123"){
        if FavData.shared.favListing1.contains(passData) == true ||  FavData.shared.favPrice1.contains(passData2) == true {
                    print("Activity place is already in the list")
                    self.lblfavbookingresult.text = ""
                    //***
                    // 1. Create an Alert Box.
                    let box = UIAlertController(title: "Alert!", message: "Activity place is already in the list", preferredStyle: .alert)
                    
                    // 1b. Add some buttons
                    
                    box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    
                    
                    // 2. Show the popup
                    self.present(box, animated: true)
                    
                    //****
                }
            else {
                
                    FavData.shared.favListing1.append(passData)
                FavData.shared.favPrice1.append(passData2)
                
                  print(FavData.shared.favListing1)
                }
        }
        if(self.emailscreen3 == "nikhil@123"){
        if FavData.shared.favListing2.contains(passData) == true ||  FavData.shared.favPrice2.contains(passData2) == true {
                    print("Activity place is already in the list")
                    self.lblfavbookingresult.text = ""
                    //***
                    // 1. Create an Alert Box.
                    let box = UIAlertController(title: "Alert!", message: "Activity place is already in the list", preferredStyle: .alert)
                    
                    // 1b. Add some buttons
                    
                    box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    
                    
                    // 2. Show the popup
                    self.present(box, animated: true)
                    
                    //****
                }
            else {
                
                    FavData.shared.favListing2.append(passData)
                FavData.shared.favPrice2.append(passData2)
                
                  print(FavData.shared.favListing2)
                }
        }
        

    }
    
    
    @IBAction func bookingPressed(_ sender: Any) {
        self.lblfavbookingresult.text = "Number of Tickets booked"
         countDisplay.text = "\(1)"
        guard let passData = activitiesdisplay?.title else {
            print("No datapassing")
           return  }
        
        if(self.emailscreen3 == "sushma@123"){
         if BookData.shared.bookListing.contains(passData) == true {
                  BookData.shared.ticket[passData]! += 1
             print("testing--x",BookData.shared.ticket)
                       x = x + 1
                    countDisplay.text = "\(BookData.shared.ticket[passData]! )"
                   }
            else {
                BookData.shared.bookListing.append(passData)
                y = y + 1
                countDisplay.text = "\(x)"
                BookData.shared.ticket[passData] = y
                print("testing--y",BookData.shared.ticket)
             }
            
        }
        else if(self.emailscreen3 == "amit@123")
        {
            if BookData.shared.bookListing1.contains(passData) == true {
                     BookData.shared.ticket1[passData]! += 1
                       print("testing--x",BookData.shared.ticket1)
                          x1 = x1 + 1
                       countDisplay.text = "\(  BookData.shared.ticket1[passData]!)"
            }
     else {
         BookData.shared.bookListing1.append(passData)
         y1 = y1 + 1
         BookData.shared.ticket1[passData] = y1
         print("testing--cket1[passData]!y",BookData.shared.ticket1)
                }
        }
        else if(self.emailscreen3 == "nikhil@123")
        {
            if BookData.shared.bookListing2.contains(passData) == true {
                     BookData.shared.ticket2[passData]! += 1
                       print("testing--x",BookData.shared.ticket2)
                          x2 = x2 + 1
                       countDisplay.text = "\(BookData.shared.ticket2[passData]! )"
                      }
               else {
                   BookData.shared.bookListing2.append(passData)
                   y2 = y2 + 1
                   BookData.shared.ticket2[passData] = y2
                   print("testing--y",BookData.shared.ticket2)
                }
        }
    }
    
   

}
