//
//  CharacterCollectionViewCell.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 18/09/24.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CharacterCollectionViewCell"
    
    private var view: CharacterCellView = CharacterCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.pin(to: contentView)
        
    }

    public func setupCell(data: Characters) {
        
        view.characterImageView.image = UIImage(named: data.image)
        
    }
    
}
