import UIKit

    class ActivityListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        var datalist = DataSource.shared.data
        
        var emailscreen2:String = ""
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return datalist.count
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let Database = DataSource.shared.data[indexPath.row]
            
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            
            cell.label.text = "\(Database.title)"
            cell.Price.text = "\(Database.price)"
            cell.iconImageView.image = UIImage(named: Database.imageName)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let screen3 = storyboard?.instantiateViewController(withIdentifier: "ActivityDetail") as? ActivityDetailVC else{
                
                print(#function, "Unable to find detail screen")
                return
            }
            
            let datasent = DataSource.shared.data[indexPath.row]
            
            print(datasent)

            screen3.activitiesdisplay = datasent
            screen3.emailscreen3 = self.emailscreen2
            
            self.navigationController?.pushViewController(screen3, animated: true)
        }

        @IBOutlet weak var table: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            // Do any additional setup after loading the view.
            table.dataSource = self
            table.delegate = self
            self.navigationItem.hidesBackButton = true
            self.navigationItem.title = "Places to visit"
            
            
            let LogoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
            self.navigationItem.setRightBarButton(LogoutButton, animated: true)
        }
        
        @objc
        private func LogoutClicked(){

            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let screen1 = storyBoard.instantiateViewController(withIdentifier: "screen1") as! ViewController
            self.navigationController?.pushViewController(screen1, animated: true)

    }
        
        @IBAction func bookPass(_ sender: Any) {
            
            if(self.emailscreen2 == "sushma@123"){
            if (BookData.shared.bookListing.isEmpty) {
                // 1. Create an Alert Box.
                let box = UIAlertController(title: "Alert!", message: "No Ticket booked", preferredStyle: .alert)
                // 1b. Add some buttons
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                // 2. Show the popup
                self.present(box, animated: true)
                
            } else {
                let screen5 = (storyboard?.instantiateViewController(withIdentifier: "BookingList") as? BookingListVC)!
                screen5.emailscreen5 = self.emailscreen2
                 self.navigationController?.pushViewController(screen5, animated: true)
            }
            }
            if(self.emailscreen2 == "amit@123"){
            if (BookData.shared.bookListing1.isEmpty) {
                // 1. Create an Alert Box.
                let box = UIAlertController(title: "Alert!", message: "No Ticket booked", preferredStyle: .alert)
                // 1b. Add some buttons
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                // 2. Show the popup
                self.present(box, animated: true)
                
            } else {
                let screen5 = (storyboard?.instantiateViewController(withIdentifier: "BookingList") as? BookingListVC)!
                screen5.emailscreen5 = self.emailscreen2
                 self.navigationController?.pushViewController(screen5, animated: true)
            }
            }
            if(self.emailscreen2 == "nikhil@123"){
            if (BookData.shared.bookListing2.isEmpty) {
                // 1. Create an Alert Box.
                let box = UIAlertController(title: "Alert!", message: "No Ticket booked", preferredStyle: .alert)
                // 1b. Add some buttons
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                // 2. Show the popup
                self.present(box, animated: true)
                
            } else {
                let screen5 = (storyboard?.instantiateViewController(withIdentifier: "BookingList") as? BookingListVC)!
                screen5.emailscreen5 = self.emailscreen2
                 self.navigationController?.pushViewController(screen5, animated: true)
            }
            }
        }
        
        @IBAction func FavPass(_ sender: Any) {
            
            if(self.emailscreen2 == "sushma@123"){
            if FavData.shared.favListing.isEmpty {
                let box = UIAlertController(title: "Alert!", message: "No Favourite Marked", preferredStyle: .alert)
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(box, animated: true)
                } else {
                let screen4 = (storyboard?.instantiateViewController(withIdentifier: "FavList") as? FavListVC)!
                screen4.emailscreen4 = self.emailscreen2
                 self.navigationController?.pushViewController(screen4, animated: true)
            }
        }
            if(self.emailscreen2 == "amit@123"){
            if FavData.shared.favListing1.isEmpty {
                
                let box = UIAlertController(title: "Alert!", message: "No Favourite Marked", preferredStyle: .alert)
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(box, animated: true)
                
            } else {
                let screen4 = (storyboard?.instantiateViewController(withIdentifier: "FavList") as? FavListVC)!
                screen4.emailscreen4 = self.emailscreen2
                 self.navigationController?.pushViewController(screen4, animated: true)
            }
        }
            if(self.emailscreen2 == "nikhil@123"){
            if FavData.shared.favListing2.isEmpty {
              
                let box = UIAlertController(title: "Alert!", message: "No Favourite Marked", preferredStyle: .alert)
                box.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(box, animated: true)
                
            } else {
                let screen4 = (storyboard?.instantiateViewController(withIdentifier: "FavList") as? FavListVC)!
                screen4.emailscreen4 = self.emailscreen2
                 self.navigationController?.pushViewController(screen4, animated: true)
            }
        }
            
        }
        
    }

