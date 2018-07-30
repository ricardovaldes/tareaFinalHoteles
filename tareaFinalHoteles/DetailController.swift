//
//  DetailController.swift
//  tareaFinalHoteles
//
//  Created by RICARDO VALDES on 22/07/18.
//  Copyright © 2018 RICARDO VALDES. All rights reserved.
//

import UIKit

class DetailController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    @IBOutlet weak var reservationLabel: UILabel!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var pages: UIPageControl!
    
    
    var array: [String] = []
    
    var hotelDesc = ""
    
    var withConst = NSLayoutConstraint(item: CollectionViewCell(), attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 300)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText.text = hotelDesc
        pages.numberOfPages = array.count
        pages.pageIndicatorTintColor = .red
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: array[indexPath.item])
        
        if UIDevice.current.orientation.isLandscape{
            cell.cellImage.contentMode = .scaleAspectFill
        }
        else if UIDevice.current.orientation.isPortrait{
            cell.cellImage.contentMode = .scaleToFill
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: myCollection.frame.size.width, height: 280)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    @IBAction func tapReserve(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Click para reservar: ", message: "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Sencilla", style: .default) { (action) in
            self.reservationLabel.text = "Habitacion Sencilla Reservada"
            self.reservationLabel.backgroundColor = .green
            
        }
        let action2 = UIAlertAction(title: "Doble", style: .default) { (action) in
            self.reservationLabel.text = "Habitacion Doble Reservada"
            self.reservationLabel.backgroundColor = .green
            
        }
        let action3 = UIAlertAction(title: "Suite", style: .default) { (action) in
            self.reservationLabel.text = "Habitacion Suite Reservada"
            self.reservationLabel.backgroundColor = .green
            
        }
        let action4 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
    
        self.present(alert, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cell = myCollection.visibleCells.first
        pages.currentPage = (myCollection.indexPath(for: cell!)?.row)!
    }

}
