//
//  cardCharacterCellView.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 13/09/24.
//

import UIKit

class CardCharacterCellView: UIView {

    lazy var cardView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        
        addSubview(cardView)
        cardView.addSubview(collectionView)
        
    }
    
    private func settingsConstraints() {
        
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10)
        
        ])
        
    }
    
}
