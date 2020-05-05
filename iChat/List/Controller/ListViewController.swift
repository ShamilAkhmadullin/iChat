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
    
    private let activeChats: [MChat] = [
        MChat(userName: "Alexey", userImage: UIImage(named: ImagesNames.human1.rawValue)!, lastMessage: "How are you?"),
        MChat(userName: "Bob", userImage: UIImage(named: ImagesNames.human2.rawValue)!, lastMessage: "How are you?"),
        MChat(userName: "Misha", userImage: UIImage(named: ImagesNames.human3.rawValue)!, lastMessage: "How are you?"),
        MChat(userName: "Mila", userImage: UIImage(named: ImagesNames.human4.rawValue)!, lastMessage: "How are you?")
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        setCollectionView()
        setDataSource()
        reloadData()
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.activeChats])
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - Setup

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
    
    private func setCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setCompositionalLayout())
        
        view.addSubview(collectionView)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellsIdentifiers.listCell.rawValue)
    }
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0)
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
            
            return section
        }
        return layout
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView) { collectionView, indexPath, chat -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError()
            }
            
            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIdentifiers.listCell.rawValue, for: indexPath   )
                return cell
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
