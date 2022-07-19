

import UIKit

class BookingListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var emailscreen5:String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.emailscreen5 == "sushma@123")
        {return BookData.shared.bookListing.count}
        else if(self.emailscreen5 == "amit@123")
        {return BookData.shared.bookListing1.count}
        else if(self.emailscreen5 == "nikhil@123")
        {return BookData.shared.bookListing2.count}
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell3 = table3.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CustomBookingTableViewCell
        
        if(emailscreen5 == "sushma@123"){
        cell3.label2.text = "\(BookData.shared.bookListing[indexPath.row])"
    cell3.lblcount.text = "\(BookData.shared.ticket[cell3.label2.text!] ?? 0)"
       let countDisplay = (cell3.lblcount.text)!
            print("test:",countDisplay)
            return cell3
        }
       else if(emailscreen5 == "amit@123"){
        cell3.label2.text = "\(BookData.shared.bookListing1[indexPath.row])"
    cell3.lblcount.text = "\(BookData.shared.ticket1[cell3.label2.text!] ?? 0)"
       let countDisplay = (cell3.lblcount.text)!
            print("test:",countDisplay)
            return cell3
        }
       else  if(emailscreen5 == "nikhil@123"){
        cell3.label2.text = "\(BookData.shared.bookListing2[indexPath.row])"
    cell3.lblcount.text = "\(BookData.shared.ticket2[cell3.label2.text!] ?? 0)"
       let countDisplay = (cell3.lblcount.text)!
            print("test:",countDisplay)
            return cell3
        }
        

        return cell3

    }
    

    @IBOutlet weak var table3: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let LogoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        self.navigationItem.setRightBarButton(LogoutButton, animated: true)
        // Do any additional setup after loading the view.
        table3.dataSource = self
        table3.delegate = self
    }
    @objc
    private func LogoutClicked(){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let screen1 = storyBoard.instantiateViewController(withIdentifier: "screen1") as! ViewController
        self.navigationController?.pushViewController(screen1, animated: true)

}

}
