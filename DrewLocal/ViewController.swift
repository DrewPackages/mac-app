//
//  ViewController.swift
//  DrewLocal
//
//  Created by Alexander Telegin on 10.08.2024.
//

import Cocoa

class ViewController: NSViewController,
                      NSCollectionViewDataSource,
                      NSCollectionViewDelegate,
                      NSCollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: NSCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(NSNib(nibNamed: "DappItem", bundle: nil),
                                forItemWithIdentifier: NSUserInterfaceItemIdentifier("DappItem"))

        collectionView.allowsMultipleSelection = false
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // Collection view setup
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1  // Number of sections in your collection view
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10  // Number of items in the collection view (replace with your actual data count)
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("DappItem"), for: indexPath)
        guard let dappItem = item as? DappItem else { return item }

        dappItem.nameLabel?.stringValue = "Button \(indexPath.item + 1)"
        if let label = dappItem.nameLabel {
            print("label")
        }
        return item
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let width = (collectionView.bounds.width / 3) - 20
        let minimumHeight = width
        return NSSize(width: width, height: minimumHeight)
    }

    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        guard let indexPath = indexPaths.first else { return }

        handleItemSelection(at: indexPath)
    }

    func handleItemSelection(at indexPath: IndexPath) {
        // Perform your action based on the selected item
        print("Handling selection of item at index \(indexPath.item)")
        performSegue(withIdentifier: "showDapp", sender: indexPath)
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDapp" {
            if let indexPath = sender as? IndexPath {
                let detailVC = segue.destinationController as! DappViewController
            }
        }
    }
}
