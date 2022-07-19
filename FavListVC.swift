

import UIKit

class FavListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var emailscreen4:String = ""
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.emailscreen4 == "sushma@123")
        
        {return FavData.shared.favListing.count}
        
        else if(self.emailscreen4 == "amit@123"){
            
            return FavData.shared.favListing1.count}
        
        else if(self.emailscreen4 == "nikhil@123"){
            
            return FavData.shared.favListing2.count}
        
        return 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell1 = table1.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomFavTableViewCell
        if(self.emailscreen4 == "sushma@123"){
        cell1.label1.text = "\(FavData.shared.favListing[indexPath.row])"
        cell1.Price1.text = "\(FavData.shared.favPrice[indexPath.row])"
        return cell1
        }
        else if(self.emailscreen4 == "amit@123") {
            cell1.label1.text = "\(FavData.shared.favListing1[indexPath.row])"
            cell1.Price1.text = "\(FavData.shared.favPrice1[indexPath.row])"
            return cell1
        }
        else if(self.emailscreen4 == "nikhil@123") {
            cell1.label1.text = "\(FavData.shared.favListing2[indexPath.row])"
            cell1.Price1.text = "\(FavData.shared.favPrice2[indexPath.row])"
            return cell1
        }

        return cell1
    }
    
        
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
        }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if(self.emailscreen4 == "sushma@123")
            { FavData.shared.favListing.remove(at: indexPath.row)}
            else if (self.emailscreen4 == "amit@123")
            {FavData.shared.favListing1.remove(at: indexPath.row)}
            else if (self.emailscreen4 == "nikhil@123")
            {FavData.shared.favListing2.remove(at: indexPath.row)}

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    @IBOutlet weak var table1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(emailscreen4)
        let LogoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        self.navigationItem.setRightBarButton(LogoutButton, animated: true)
        // Do any additional setup after loading the view.
  
        table1.dataSource = self
        table1.delegate = self
//        print("the favdisplay" , FavData.shared.favListing)
    }
    @objc
    private func LogoutClicked(){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let screen1 = storyBoard.instantiateViewController(withIdentifier: "screen1") as! ViewController
        self.navigationController?.pushViewController(screen1, animated: true)

}
    
    
    @IBAction func removeFav(_ sender: Any) {
        if(emailscreen4 == "sushma@123")
        {FavData.shared.favListing.removeAll()
            FavData.shared.favPrice.removeAll()}
        else if(emailscreen4 == "amit@123")
        {
            FavData.shared.favListing1.removeAll()
            FavData.shared.favPrice1.removeAll()
        }
        else if(emailscreen4 == "nikhil@123")
        {
            FavData.shared.favListing2.removeAll()
            FavData.shared.favPrice2.removeAll()
        }
        table1.reloadData()

    }
    
    
    
}
