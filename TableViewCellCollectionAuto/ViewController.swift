//
//  ViewController.swift
//  TableViewCellCollectionAuto
//
//  Created by Gusont on 2019/12/18.
//  Copyright © 2019 Gusont. All rights reserved.
//

import UIKit

// MARK: - UITableViewCell,UICollectionViewCell reuseIdentifier nib
extension UITableViewCell{
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
extension UICollectionViewCell{
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var imageArrays:[String]? = ["sfae","asfe","ddk","sfae","asfe","ddk","sfae","asfe","ddk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(PhotoShowTableViewCell.nib, forCellReuseIdentifier: PhotoShowTableViewCell.reuseIdentifier)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoShowTableViewCell.reuseIdentifier, for: indexPath) as! PhotoShowTableViewCell
        cell.collectBgView.imageArrays = self.imageArrays
        cell.collectBgView.closure = {[weak self] row in
            self?.imageArrays?.remove(at: row)
            self?.tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.imageArrays?.insert("hello", at: 0)
        self.tableView.reloadData()
    }
}


