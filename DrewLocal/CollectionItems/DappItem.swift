//
//  ButtonItem.swift
//  DrewLocal
//
//  Created by Alexander Telegin on 10.08.2024.
//

import Cocoa

class DappItem: NSCollectionViewItem {

    @IBOutlet weak var image: NSImageView!
    @IBOutlet weak var nameLabel: NSTextField!

    override func awakeFromNib() {
        view.wantsLayer = true
    }

}
