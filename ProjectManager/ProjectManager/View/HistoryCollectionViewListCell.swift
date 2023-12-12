//
//  HistoryCollectionViewListCell.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/12/12.
//

import UIKit

final class HistoryCollectionViewListCell: UICollectionViewListCell {
    private let totalHistoryStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        
        return stackView
    }()
    
    private let historyTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .black
        label.text = "Moved '프로젝트 회고 작성' form TODO to DOING"
        
        return label
    }()
    
    private let historyDateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        label.text = "Mar 11, 2023 3:32:07 PM"
        
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
extension HistoryCollectionViewListCell {
    private func setupComponents() {
        setupContentView()
    }
    
    private func setupContentView() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
    }
}

// MARK: - ConfigureUI
extension HistoryCollectionViewListCell {
    private func configureUI() {
        configureContentView()
        configureTotalPlanStackView()
    }
    
    private func configureContentView() {
        contentView.addSubview(totalHistoryStackView)
    }
    
    private func configureTotalPlanStackView() {
        totalHistoryStackView.addArrangedSubview(historyTitleLabel)
        totalHistoryStackView.addArrangedSubview(historyDateLabel)
    }
}

// MARK: - SetupConstraints
extension HistoryCollectionViewListCell {
    private func setupConstraints() {
        setupTotalPlanStackViewConstraint()
    }
    
    private func setupTotalPlanStackViewConstraint() {
        NSLayoutConstraint.activate([
            totalHistoryStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            totalHistoryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            totalHistoryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            totalHistoryStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
