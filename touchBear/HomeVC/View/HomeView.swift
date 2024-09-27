//
//  HomeView.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 11/09/24.
//

import UIKit

class HomeView: UIView {
    
    lazy var viewCard: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = UIColor.clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CardCharacterCollectionViewCell.self, forCellWithReuseIdentifier: CardCharacterCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .customColorKeppel
        
        addElements()
        settingsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func settingsProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate.self
        collectionView.dataSource = dataSource.self
        
    }
    
    private func addElements() {
        
        addSubview(viewCard)
        viewCard.addSubview(collectionView)
        
    }
    
    private func settingsConstraints() {
        
        viewCard.pin(to: self)
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: viewCard.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: viewCard.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor)
        
        ])
        
    }
    
}
