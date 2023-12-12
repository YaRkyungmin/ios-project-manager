//
//  PlanCollectionViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/26.
//

import UIKit

final class PlanCollectionViewController: UIViewController {
    private lazy var longPressGestureRecognizer: UILongPressGestureRecognizer = {
        let gestureRecognizer = UILongPressGestureRecognizer()
        gestureRecognizer.minimumPressDuration = 1
        gestureRecognizer.addTarget(self, action: #selector(didTapLongPress(_:)))
        
        return gestureRecognizer
    }()
    
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
        setupComponent()
        setupConstraints()
        configureDataSource()
        configureDataSourceHeader()
        applySnapshot()
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

// MARK: - SetupComponent
extension PlanCollectionViewController {
    private func setupComponent() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.addGestureRecognizer(longPressGestureRecognizer)
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
        let cellRegistration = UICollectionView.CellRegistration<PlanCollectionViewListCell, Plan> { cell, _, plan in
            print("cell")
        }
        planDataSource = UICollectionViewDiffableDataSource<Section, Plan>(collectionView: collectionView) { collectionView, indexPath, plan in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: plan)
        }
    }
    
    private func configureDataSourceHeader() {
        let headerRegistration = UICollectionView.SupplementaryRegistration<TitleHeaderView>(elementKind: ElementKind.sectionHeader) { _, _, _ in
            print("header")
        }

        planDataSource?.supplementaryViewProvider = { collectionView, _, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
    }
    
    private func applySnapshot() {
        guard let planDataSource else {
            return
        }
        
        let plan1 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan2 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan3 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan4 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan5 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan6 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan7 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan8 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan9 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan10 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        let plan11 = Plan(identifier: UUID(), title: "제목1", content: "", date: "")
        
        let dummyPlanList = [plan1, plan2, plan3, plan4, plan5, plan6, plan7, plan8, plan9, plan10, plan11]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Plan>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyPlanList)
        planDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - CollectionView Layout
extension PlanCollectionViewController {
    private func listLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { _, layoutEnvironment in
            
            var configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
            configuration.headerMode = .supplementary
            configuration.trailingSwipeActionsConfigurationProvider = self.makeSwipeActions
            configuration.backgroundColor = .systemGray6
            
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            section.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 0)
            section.interGroupSpacing = 7
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(80))
            let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: ElementKind.sectionHeader,
                alignment: .top)
            
            headerSupplementary.pinToVisibleBounds = true
            headerSupplementary.zIndex = 110
            section.boundarySupplementaryItems = [headerSupplementary]
            return section
        }
        
        return layout
    }
    
    private func makeSwipeActions(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
        let deleteActionTitle = NSLocalizedString("Delete", comment: "Delete action title")
        let deleteAction = UIContextualAction(style: .destructive, title: deleteActionTitle) {_,_,_ in
            print("\(indexPath!.item): remove")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
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

// MARK: - CollectionView ElementKind
extension PlanCollectionViewController {
    private enum ElementKind {
        static let sectionHeader = "section-header-element-kind"
    }
}

// MARK: - Gesture Action
extension PlanCollectionViewController {
    @objc private func didTapLongPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else {
            return
        }
        
        let touchPoint = sender.location(in: sender.view)
        
        guard let indexPath = collectionView.indexPathForItem(at: touchPoint) else {
            return
        }
        
        guard let theAttributes = collectionView.layoutAttributesForItem(at: indexPath) else {
            return
        }
        
        let cellFrame = collectionView.convert(theAttributes.frame, to: collectionView.superview)
        let popoverViewController = PopoverViewController()
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = CGSize(width: view.frame.width * 0.7, height: view.frame.height * 0.15)
        popoverViewController.popoverPresentationController?.sourceView = view
        popoverViewController.popoverPresentationController?.sourceRect = CGRect(x: cellFrame.maxX, y: cellFrame.midY, width: 0, height: 0)
        popoverViewController.popoverPresentationController?.permittedArrowDirections = [.up, .down]

        self.view.window?.rootViewController?.present(popoverViewController, animated: false)
    }
}
