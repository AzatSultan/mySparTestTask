//
//  SnapLayout.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class SnapLayout: UICollectionViewFlowLayout {
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset) }
      let midX: CGFloat = collectionView.bounds.size.width / 2
      guard let closestAttribute = findClosestAttributes(toXPosition: proposedContentOffset.x + midX) else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset) }
      return CGPoint(x: closestAttribute.center.x - midX, y: proposedContentOffset.y)
  }
  
  private func findClosestAttributes(toXPosition xPosition: CGFloat) -> UICollectionViewLayoutAttributes? {
    guard let collectionView = collectionView else { return nil }
    let searchRect = CGRect(
      x: xPosition - collectionView.bounds.width, y: collectionView.bounds.minY,
      width: collectionView.bounds.width * 2, height: collectionView.bounds.height
    )
    return layoutAttributesForElements(in: searchRect)?.min(by: { abs($0.center.x - xPosition) < abs($1.center.x - xPosition) })
  }
}
