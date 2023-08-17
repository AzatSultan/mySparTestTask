//
//  PersonalSnapLayout.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class PersonalSnapLayout: UICollectionViewFlowLayout {
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    var offsetAdjustment = CGFloat.greatestFiniteMagnitude
    let horizontalOffset = proposedContentOffset.x + 16
    let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: self.collectionView!.bounds.size)

    for layoutAttributes in super.layoutAttributesForElements(in: targetRect)! {
      let itemOffset = layoutAttributes.frame.origin.x
      if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
        offsetAdjustment = itemOffset - horizontalOffset
      }
    }

    return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
  }
}
