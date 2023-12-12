//
//  HistoryViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/12/12.
//

import UIKit

final class HistoryViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: listLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private var historyDataSource: UICollectionViewDiffableDataSource<Section, History>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupConstraints()
        configureDataSource()
        applySnapshot()
    }
}

// MARK: - ConfigureUI
extension HistoryViewController {
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        view.addSubview(collectionView)
    }
}

// MARK: - SetupConstraint
extension HistoryViewController {
    private func setupConstraints() {
        setupCollectionViewConstraint()
    }
    
    private func setupCollectionViewConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 10)
        ])
    }
}

// MARK: - CollectionView DataSource
extension HistoryViewController {
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<HistoryCollectionViewListCell, History> { cell, _, history in
            print("history cell")
        }
        historyDataSource = UICollectionViewDiffableDataSource<Section, History>(collectionView: collectionView) { collectionView, indexPath, history in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: history)
        }
    }
    
    private func applySnapshot() {
        guard let historyDataSource else {
            return
        }
        
        let history1 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history2 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history3 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history4 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history5 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history6 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history7 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        let history8 = History(identifier: UUID(), movement: History.Movement.add, title: "", recode: "", date: "")
        
        let dummyPlanList = [history1, history2, history3, history4, history5, history6, history7, history8]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, History>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyPlanList)
        historyDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - CollectionView Layout
extension HistoryViewController {
    private func listLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = .systemGray6
        
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

// MARK: - CollectionView Section
extension HistoryViewController {
    private enum Section {
        case main
    }
}

