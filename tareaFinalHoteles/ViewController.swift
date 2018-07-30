//
//  ViewController.swift
//  tareaFinalHoteles
//
//  Created by RICARDO VALDES on 22/07/18.
//  Copyright © 2018 RICARDO VALDES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTable: UITableView!
    
    let hotel = Hotel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the viewvarypically from a nib.
        
        let cell = UINib(nibName: "TableCell", bundle: nil)
        myTable.register(cell, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotel.hotelNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        
        cell.hotelLabel.text = hotel.hotelNames[indexPath.row]
        cell.tableImage.image = UIImage(named: hotel.hotelImages[indexPath.row][0])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = myTable.indexPathForSelectedRow?.row
        
        let VC = segue.destination as! DetailController
        VC.hotelDesc = hotel.hotelDecription[index!]
        VC.array = hotel.hotelImages[index!]
        
    }
    

}

