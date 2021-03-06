//
//  SearchResultsController.swift
//  Spotifier
//
//  Created by Aleksandar Vacić on 4/19/19.
//  Copyright © 2019 Radiant Tap. All rights reserved.
//

import UIKit

final class SearchResultsController: UICollectionViewController {
	init() {
		let l = SearchResultsLayout()
		super.init(collectionViewLayout: l)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//	MARK: Model

	var results: [SearchResult] = [] {
		didSet {
			if !isViewLoaded { return }
			collectionView.reloadData()
		}
	}


	//	MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.register(SearchCell.self)
	}

	//	MARK: UICollectionViewDataSource

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return results.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let item = results[indexPath.item]

		let cell: SearchCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
		cell.populate(with: item)
		return cell
	}

	//	MARK: UICollectionViewDelegate

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = results[indexPath.item]


		switch item {
		case let artist as Artist:
			contentDisplayArtist(artist, sender: self)

		case let album as Album:
			contentDisplayAlbum(album, sender: self)

		case let track as Track:
			let cell = collectionView.cellForItem(at: indexPath)
			playEnqueueTrack(track, cell: cell, onQueue: .main, sender: self)

		default:
			break
		}
	}
}
