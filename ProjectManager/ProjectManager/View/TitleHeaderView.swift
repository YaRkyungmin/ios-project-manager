//
//  TitleHeaderView.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/11/23.
//

import UIKit

final class TitleHeaderView: UICollectionReusableView {
    static var identifier: String {
        return String(describing: TitleHeaderView.self)
    }
    
    private let totalTitleStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .black
        label.text = "제목"
        
        return label
    }()
    
    private let remainJobLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.backgroundColor = .black
        label.textColor = .systemBackground
        label.text = "3"
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupComponents
extension TitleHeaderView {
    private func setupComponents() {
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray5.cgColor
    }
}

// MARK: - ConfigureUI
extension TitleHeaderView {
    private func configureUI() {
        configureView()
        configureTotalTitleStackView()
    }
    
    private func configureView() {
        self.addSubview(totalTitleStackView)
    }
    
    private func configureTotalTitleStackView() {
        totalTitleStackView.addArrangedSubview(titleLabel)
        totalTitleStackView.addArrangedSubview(remainJobLabel)
    }
}

// MARK: - SetupConstraints
extension TitleHeaderView {
    private func setupConstraints() {
        setupTotalTitleStackView()
        setupRemainJobLabel()
    }
    
    private func setupTotalTitleStackView() {
        NSLayoutConstraint.activate([
            totalTitleStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            totalTitleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            totalTitleStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupRemainJobLabel() {
        let widthConstraint = remainJobLabel.widthAnchor.constraint(equalToConstant: 35)
        let heightConstraint = remainJobLabel.heightAnchor.constraint(equalToConstant: 35)
        widthConstraint.priority = UILayoutPriority(300)
        heightConstraint.priority = UILayoutPriority(300)
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        
        remainJobLabel.setContentCompressionResistancePriority(.init(1000), for: .horizontal)
    }
}
