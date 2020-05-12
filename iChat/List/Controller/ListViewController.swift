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
        
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    private let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    private let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
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
        
        view.addSubview(collectionView)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellsIdentifiers.waitingChatsCell.rawValue)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellsIdentifiers.activeChatsCell.rawValue)
    }
}

// MARK: - Setup data source

extension ListViewController {
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView) { collectionView, indexPath, chat -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError()
            }
            
            switch section {
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIdentifiers.waitingChatsCell.rawValue, for: indexPath)
                cell.backgroundColor = .yellow
                return cell
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIdentifiers.activeChatsCell.rawValue, for: indexPath)
                cell.backgroundColor = .blue
                return cell
            }
        }
    }
}

// MARK: - Setup layout

extension ListViewController {
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError()
            }
            
            switch section {
            case .waitingChats:
                return self?.setWaitingChats()
            case .activeChats:
                return self?.setActiveChats()
            }
        }
        return layout
    }
    
    private func setWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func setActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
}

// MARK: - Reload data

extension ListViewController {
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
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
