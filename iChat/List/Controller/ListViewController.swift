//
//  ListViewController.swift
//  iChat
//
//  Created by Shamil on 5/3/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    
    // MARK: - Properties
        
    private var collectionView: UICollectionView?
    private var dataSource: UICollectionViewDiffableDataSource<ListSections, MChat>?
    
    private let waitingChats = Bundle.main.decode([MChat].self, from: JsonsNames.waitingChats.rawValue)
    private let activeChats = Bundle.main.decode([MChat].self, from: JsonsNames.activeChats.rawValue)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        setCollectionView()
        setDataSource()
        reloadData()
    }
}

// MARK: - Setup search bar

extension ListViewController {
    
    private func setSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - Setup collection view

extension ListViewController {
    
    private func setCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setCompositionalLayout())
        
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .mainWhite()
        
        collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellsIdentifiers.sectionHeader.rawValue)
        
        collectionView?.register(WaitingChatCell.self, forCellWithReuseIdentifier: CellsIdentifiers.waitingChatsCell.rawValue)
        collectionView?.register(ActiveChatCell.self, forCellWithReuseIdentifier: CellsIdentifiers.activeChatsCell.rawValue)
    }
}

// MARK: - Setup data source

extension ListViewController {
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ListSections, MChat>(collectionView: collectionView ?? UICollectionView()) { [weak self] collectionView, indexPath, chat -> UICollectionViewCell? in
            guard let section = ListSections(rawValue: indexPath.section) else {
                fatalError("Unable to setup section")
            }
            switch section {
            case .waitingChats:
                return self?.configure(collectionView, cellType: WaitingChatCell.self, with: chat, for: indexPath)
            case .activeChats:
                return self?.configure(collectionView, cellType: ActiveChatCell.self, with: chat, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellsIdentifiers.sectionHeader.rawValue, for: indexPath) as? SectionHeader else {
                fatalError("Can not create new section header")
            }
            guard let section = ListSections(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            sectionHeader.configure(section.description(), font: .laoSangamMN(20), textColor: .sectionHeaderGray())
            return sectionHeader
        }
    }
}

// MARK: - Setup layout

extension ListViewController {
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = ListSections(rawValue: sectionIndex) else {
                fatalError("Unable to setup section")
            }
            switch section {
            case .waitingChats:
                return self?.setWaitingChats()
            case .activeChats:
                return self?.setActiveChats()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func setSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }
    
    private func setWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let sectionHeader = setSectionHeader()
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func setActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let sectionHeader = setSectionHeader()
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}

// MARK: - Reload data

extension ListViewController {
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<ListSections, MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
