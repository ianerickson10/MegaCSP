//
//  DrawingCollectionViewController.swift
//  DrawingProject
//
//  Created by Erickson, Ian on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artidentifier"

public class DrawingCollectionViewController: UICollectionViewController
{

    // MARK: Data Members For Creativity Screen
    
    private let sectionInserts = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
    {
        return [
            UIImage(named:"IanEricksonJavaHaiku"),
            UIImage(named:"IanEricksonSwiftHaiku"),
            UIImage(named:"IanEricksonMainframeHaiku"),
            UIImage(named:"Challenger"),
            UIImage(named:"Mountain"),
            UIImage(named:"Sun"),
            UIImage(named:"ScreenArt")
        ]
    }()
    
    private let labels : [String] =
    {
        return [
            "Java Haiku",
            "Swift Haiku",
            "Mainframe Haiku",
            "Challenger",
            "Sunny mountain through grass",
            "Sun through an arch",
            "My lame screen art"
        ]
    }()
    
    

    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    public override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }


    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return creativeCS.count
    }

    // MARK: UICollectionViewDelegate

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let paddingSpace = sectionInserts.left * (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewlayout: UICollectionViewLayout,
                               insertForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInserts
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInserts.left
    }
    
    public override func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DrawingCell
        
        artCell.backgroundColor = .blue
        artCell.artImage.image = creativeCS[indexPath.row]
        artCell.artLabel.text = labels[indexPath.row]
        
        return artCell
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool
    {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool
    {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)
    {
    
    }
    */

}
