//
//  PhotoShowTableViewCell.swift
//  ems-rz
//
//  Created by Gusont on 2019/12/18.
//  Copyright © 2019 xyj. All rights reserved.
//

import UIKit
import SnapKit

class PhotoShowView: UIView {
    var closure: ((_ row: Int) -> Void)?
    
    public var imageArrays: [String]?{
        willSet{
            
        }
        didSet{
            self.collectionView.reloadData()
            let collectViewHeight = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            self.collectionView.snp.remakeConstraints { (maker) in
                maker.edges.equalTo(self)
                maker.height.equalTo(collectViewHeight).priorityHigh()
            }
        }
    }
    
    public  let collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1.5;
        layout.minimumLineSpacing = 1.5;
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1);
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override func draw(_ rect: CGRect) {
        self.collectionView.reloadData()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCollectionView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addCollectionView()
    }
    
    func addCollectionView() {
        self.addSubview(self.collectionView)
        collectionView.frame = self.frame
        collectionView.delegate = self
        collectionView.dataSource = self
        let collectViewHeight = collectionView.collectionViewLayout.collectionViewContentSize.height;
        self.collectionView.snp.makeConstraints({ (maker) in
            maker.edges.equalTo(self)
            maker.height.equalTo(collectViewHeight).priorityLow()
            
        })
        
    }
}

extension PhotoShowView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArrays?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 80, height: 80)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.closure!(indexPath.row)
    }
}

class PhotoShowTableViewCell: UITableViewCell {

    @IBOutlet weak var collectBgView: PhotoShowView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
