//
//  PlanCollectionViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/26.
//

import UIKit

final class PlanCollectionViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: listLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private var planDataSource: UICollectionViewDiffableDataSource<Section, Plan>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupConstraints()
        configureDataSource()
        applySnapshot()
        collectionView.backgroundColor = .black
    }
}

// MARK: - ConfigureUI
extension PlanCollectionViewController {
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        view.addSubview(collectionView)
    }
}

// MARK: - SetupConstraint
extension PlanCollectionViewController {
    private func setupConstraints() {
        setupCollectionViewConstraint()
    }
    
    private func setupCollectionViewConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView DataSource
extension PlanCollectionViewController {
    private func configureDataSource() {
        let registration = UICollectionView.CellRegistration<PlanCollectionViewListCell, Plan> { cell, _, plan in
            print("")
        }
        planDataSource = UICollectionViewDiffableDataSource<Section, Plan>(collectionView: collectionView) { collectionView, indexPath, plan in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: plan)
        }
    }
    
    private func applySnapshot() {
        guard let planDataSource else {
            return
        }
        
        let plan1 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan2 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan3 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let dummyPlanList = [plan1, plan2, plan3]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Plan>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyPlanList)
        planDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - CollectionView Layout
extension PlanCollectionViewController {
    private func listLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = .systemGray6
        configuration.headerMode = .none
        
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    private func setUpSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.headerMode = .none
        return NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
    }
    
    private func setUpHeaderSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.headerMode = .supplementary
        return NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
    }
}

// MARK: - CollectionView Delegate
extension PlanCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("click")
    }
}

// MARK: - CollectionView Section
extension PlanCollectionViewController {
    private enum Section {
        case main
    }
}
