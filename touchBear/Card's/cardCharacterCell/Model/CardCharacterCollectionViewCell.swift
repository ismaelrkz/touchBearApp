//
//  cardCharacterCVCell.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 13/09/24.
//

import UIKit

class CardCharacterCollectionViewCell: UICollectionViewCell {
    
    private var view: CardCharacterCellView = CardCharacterCellView()
    
    private var viewModel: CardCharacterCellViewModel?
    
    static let identifier: String = "CardCharacterCVCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        view.settingsProtocolsCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func settingsView() {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.pin(to: contentView)
        
    }
    
    public func setupCell(data: [Characters]) {
        
        viewModel = CardCharacterCellViewModel(dataCharacters: data)
        
    }
    
    
}

extension CardCharacterCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return viewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell
        
        cell?.setupCell(data: viewModel.loadCurrentData(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return viewModel?.sizeForItem(collectionViewWidth: collectionView.frame.width, columns: 2) ?? CGSize(width: 100, height: 100)
        
    }
    
    
}
