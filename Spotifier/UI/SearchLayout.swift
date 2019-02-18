//
//  SearchLayout.swift
//  Spotifier
//
//  Created by Aleksandar Vacić on 11/23/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import UIKit

final class SearchLayout: BaseGridLayout {

	override func commonInit() {
		super.commonInit()

		headerReferenceSize = CGSize(width: 300, height: 54)
		sectionInset.left = 20
		sectionInset.right = 20
		sectionInset.bottom = 44
		minimumLineSpacing = 8
		minimumInteritemSpacing = 0
	}

	override func prepare() {
		defer {
			super.prepare()
		}

		guard var availableWidth = collectionView?.bounds.width else { return }
		availableWidth -= (sectionInset.left + sectionInset.right)
		itemSize = CGSize(width: availableWidth, height: 88)
	}
}
