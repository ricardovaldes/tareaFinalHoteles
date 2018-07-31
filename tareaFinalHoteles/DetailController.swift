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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = myCollection.frame.size.width
        return CGSize(width: with, height: 280)
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
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape,
            let layout = myCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            let with = myCollection.frame.size.width
            layout.itemSize = CGSize(width: with, height: 280)
            layout.invalidateLayout()
        }
        
        else if UIDevice.current.orientation.isLandscape,
            let layout = myCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            let with = myCollection.frame.size.width
            layout.itemSize = CGSize(width: with/2, height: 280)
            
        }
    }
}
