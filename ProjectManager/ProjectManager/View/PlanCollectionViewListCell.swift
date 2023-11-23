//
//  PlanCollectionViewListCell.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/26.
//

import UIKit

final class PlanCollectionViewListCell: UICollectionViewListCell {
    private let totalPlanStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let planTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .black
        label.text = "제목"
        
        return label
    }()
    
    private let planContentLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .systemGray
        label.text = "내용"
        
        return label
    }()
    
    private let planDateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .black
        label.text = "2022.2.2"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setupConstraints()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ConfigureUI
extension PlanCollectionViewListCell {
    private func configureUI() {
        configureContentView()
        configureTotalPlanStackView()
    }
    
    private func configureContentView() {
        contentView.addSubview(totalPlanStackView)
    }
    
    private func configureTotalPlanStackView() {
        totalPlanStackView.addArrangedSubview(planTitleLabel)
        totalPlanStackView.addArrangedSubview(planContentLabel)
        totalPlanStackView.addArrangedSubview(planDateLabel)
    }
}

// MARK: - SetupConstraints
extension PlanCollectionViewListCell {
    private func setupConstraints() {
        setupTotalPlanStackViewConstraint()
    }
    
    private func setupTotalPlanStackViewConstraint() {
        NSLayoutConstraint.activate([
            totalPlanStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            totalPlanStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalPlanStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            totalPlanStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
