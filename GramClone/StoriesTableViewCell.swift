//
//  StoriesTableViewCell.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var storyData: [myStory]?
    
    @IBOutlet var storiesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self
        
        self.loadStoryData()
    }
    
    func loadStoryData() {
        if let storyPath = Bundle.main.path(forResource: "Stories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: storyPath), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                storyData = try decoder.decode([myStory].self, from: data)
                print("Read Story Data")
                storiesCollectionView.reloadData()
            } catch {
                // Better error handling would go here!
                print("Parsing Story Data Failed \(error.localizedDescription)")
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCollectionViewCell
        cell.storyImage.load(url: (storyData?[indexPath.row].imageUrl)!)
        // Configure the cell
        return cell
    }

}
