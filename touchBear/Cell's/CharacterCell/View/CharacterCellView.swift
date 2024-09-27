//
//  CharacterCellView.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 18/09/24.
//

import UIKit

class CharacterCellView: UIView {

    lazy var view: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var characterImageView: UIImageView = {
       
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        settingsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        
        addSubview(view)
        view.addSubview(characterImageView)
        
    }
    
    private func settingsConstraints() {
  
        view.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    
        ])
        
    }

}
