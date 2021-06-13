//
//  UserDetailVC.swift
//  nure-proj
//
//  Created by Alex Lebedev on 13.06.2021.
//

import UIKit

class UserDetailVC: UIViewController {

    // MARK: - Property
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    private let avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let biographyView: UITextView = {
        let textview = UITextView()
        textview.showsVerticalScrollIndicator = false
        textview.backgroundColor = .black
        textview.textColor = .white
        textview.font = UIFont.systemFont(ofSize: 22)
        return textview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.layer.cornerRadius = 40
    }
    override func loadView() {
        super.loadView()
        setupLayouts()
    }
    func configure(model: Worker) {
        nameLabel.text = model.name
        if let imageUrl = model.imageUrl,  let url = URL(string: imageUrl) {
            avatarView.sd_setImage(with: url, placeholderImage: nil, options: .progressiveLoad, context: nil)
        }
        biographyView.text = model.biography
    }

}
extension UserDetailVC {
    private func setupLayouts() {
        self.view.addSubview(avatarView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(biographyView)
        avatarView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.centerY)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(avatarView.snp.bottom).offset(10)
        }
        biographyView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
}
