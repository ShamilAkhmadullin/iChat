//
//  PeopleViewController.swift
//  iChat
//
//  Created by Shamil on 5/3/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class PeopleViewController: UIViewController {
    
    // MARK: - Properties
    
    private var collectionView: UICollectionView?
    private var dataSource: UICollectionViewDiffableDataSource<PeopleSection, MUser>?
    
    private let users = Bundle.main.decode([MUser].self, from: JsonsNames.users.rawValue)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setSearchBar()
        setCollectionView()
        setDataSource()
        reloadData()
    }
}

// MARK: - Setup

extension PeopleViewController {
    
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

// MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - Setup collection view

extension PeopleViewController {
    
    private func setCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setCompositionalLayout())
        
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .mainWhite()
        
        collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellsIdentifiers.sectionHeader.rawValue)

        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: CellsIdentifiers.userCell.rawValue)
    }
}

// MARK: - Setup data source

extension PeopleViewController {
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<PeopleSection, MUser>(collectionView: collectionView ?? UICollectionView()) { [weak self] collectionView, indexPath, user -> UICollectionViewCell? in
            guard let section = PeopleSection(rawValue: indexPath.section) else {
                fatalError("Unable to setup section")
            }
            switch section {
            case .users:
                return self?.configure(collectionView, cellType: UserCell.self, with: user, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellsIdentifiers.sectionHeader.rawValue, for: indexPath) as? SectionHeader else {
                fatalError("Can not create new section header")
            }
            guard let section = PeopleSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            let items = self?.dataSource?.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.configure(section.description(usersCount: items?.count ?? 0), font: .systemFont(ofSize: 36, weight: .light), textColor: .label)
            return sectionHeader
        }
    }
}

// MARK: - Setup layout

extension PeopleViewController {
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = PeopleSection(rawValue: sectionIndex) else {
                fatalError("Unable to setup section")
            }
            switch section {
            case .users:
                return self?.setUsersSection()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func setUsersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(15)
        let sectionHeader = setSectionHeader()
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 15, bottom: 0, trailing: 15)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func setSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }
}

// MARK: - Reload data

extension PeopleViewController {
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<PeopleSection, MUser>()
        snapshot.appendSections([.users])
        snapshot.appendItems(users, toSection: .users)

        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
