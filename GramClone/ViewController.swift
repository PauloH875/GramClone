//
//  ViewController.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postData: [myPost]?
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        self.loadPostsData()
    }

    func loadPostsData() {
        if let postsPath = Bundle.main.path(forResource: "Posts", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: postsPath), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                postData = try decoder.decode([myPost].self, from: data)
                print("Read Post Data")
                self.mainTableView.reloadData()
            } catch {
                // Better error handling would go here!
                print("Parsing Post Data Failed \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (postData?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 0) ? 80 : 360
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableCell") as! StoriesTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableCell") as! PostTableViewCell
            
            let rowData = postData![indexPath.row - 1]
            cell.usernameLabel.text = rowData.username ?? ""
            cell.postImage.load(url: rowData.imageUrl ?? URL(string: "https://dummyimage.com/500")!)
            cell.titleLabel.text = rowData.title
            cell.likesLabel.text =  String(format: "%d likes", rowData.likes ?? 0)
            
            return cell
        }
    }
}

