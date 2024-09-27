//
//  ViewController.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 11/09/24.
//

import UIKit

class HomeVC: UIViewController {

    private var homeView: HomeView?
    
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        
        homeView = HomeView()
        
        view = homeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeView?.settingsProtocolsCollectionView(delegate: self, dataSource: self)
        
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCharacterCollectionViewCell.identifier, for: indexPath) as? CardCharacterCollectionViewCell
        
        cell?.setupCell(data: viewModel.getCharacters)
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
}

