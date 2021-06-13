//
//  WorkerCell.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import UIKit
import SDWebImage

class WorkerCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    private let avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        
    }
    func setup(model: Worker) {
        nameLabel.text = model.name
        if let imageUrl = model.imageUrl,  let url = URL(string: imageUrl) {
            avatarView.sd_setImage(with: url, placeholderImage: nil, options: .progressiveLoad, context: nil)
        }
    }
}
extension WorkerCell {
    private func setupLayouts() {
        self.contentView.addSubview(avatarView)
        self.contentView.addSubview(nameLabel)
        avatarView.snp.makeConstraints {
            $0.size.equalTo(80)
            $0.leading.top.bottom.equalToSuperview().inset(10)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarView.snp.trailing).offset(10)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
