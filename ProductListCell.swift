//
//  ProductListCell.swift
//  ShoppingDemo
//
//  Created by 罗诗朋 on 2022/1/21.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    private  var coverView: UIImageView!
    private var nameLabel: UILabel!
    private var ratingView: RatingView!
    private var priceLabel: UILabel!
    private var collectButton:UIButton!
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
         
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.spacing = 8
        hStack.alignment = .leading
        hStack.layer.cornerRadius = 6
        hStack.layer.masksToBounds = true
        hStack.layer.borderColor = UIColor.systemGray5.cgColor
        hStack.layer.borderWidth = 1
    
        contentView.addSubview(hStack)
        
        coverView = UIImageView()
        coverView.contentMode = .scaleAspectFit
        hStack.addArrangedSubview(coverView)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant:-15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor,constant:5),
            coverView.widthAnchor.constraint(equalToConstant: 100),
            coverView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 6
        hStack.addArrangedSubview(vStack)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        vStack.addArrangedSubview(nameLabel)
        
        ratingView = RatingView()
       // ratingView.backgroundColor = .systemOrange
        vStack.addArrangedSubview(ratingView)
        
    
        // 价格
        let priceHStack = UIStackView()
        vStack.addArrangedSubview(priceHStack)
        
        priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 24)
        priceLabel.textColor = .systemOrange
        priceHStack.addArrangedSubview(priceLabel)
        // 红心
        collectButton = UIButton()
        collectButton.tintColor = .systemRed
        collectButton.setImage(UIImage(systemName: "heart"), for: .normal)
        collectButton.setImage((UIImage(systemName: "heart.fill")), for: .selected)
        priceHStack.addArrangedSubview(collectButton)
        collectButton.leftAnchor.constraint(equalTo: vStack.rightAnchor,constant: -32).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    func setCover(_ cover:String){
        coverView.image = UIImage(systemName: "heart.fill")
    }
    func setName(_ name:String){
        nameLabel.text = name
        
    }
    func setPrice(_ price: Double){
        priceLabel.text = String(format: "$%.2f", price)
    }
    
    func setCollect(_ collect: Bool){
        collectButton.isSelected = collect
    }
    
    
    func setRating(_ rating: Int){
        ratingView.rating = rating
    }
}


