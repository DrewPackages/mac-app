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

    var dappsList: [(String, NSImage)] = [
        ("Uniswap", #imageLiteral(resourceName: "Uniswap")),
        ("Gnosis Safe", #imageLiteral(resourceName: "Gnosis")),
        ("Sushi Swap", #imageLiteral(resourceName: "Sushi")),
        ("Pancake Swap", #imageLiteral(resourceName: "Pancake")),
        ("Cow Swap", #imageLiteral(resourceName: "Cow")),
    ]

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
        return 1
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dappsList.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("DappItem"), for: indexPath)
        guard let dappItem = item as? DappItem else { return item }
        let index = indexPath.item
        let dAppDescription = dappsList[index]

        DispatchQueue.main.async {
            dappItem.nameLabel?.stringValue = dAppDescription.0
            dappItem.image?.image = dAppDescription.1
        }

        return item
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let width = (collectionView.bounds.width / 6) - 20
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
            if sender is IndexPath {
                let detailVC = segue.destinationController as! DappViewController
            }
        }
    }
}
