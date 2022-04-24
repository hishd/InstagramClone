//
//  FeedController.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-04-24.
//

import Foundation
import UIKit

class FeedController: UICollectionViewController {
    private let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension FeedController {
    func configureUI() {
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: UICollectionViewDatasource setup
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: Setting the size of the Collection View Cells
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.height, height: 200)
    }
}
