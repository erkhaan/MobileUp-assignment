import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class GalleryCollectionViewController: UICollectionViewController {

	var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		self.collectionView.backgroundColor = .systemBackground
        // Register cell classes
		let nib = UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
		self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
		collectionView.setCollectionViewLayout(GalleryCollectionViewController.generateLayout(), animated: false)
    }

	static func generateLayout() -> UICollectionViewLayout{
		let spacing: CGFloat = 1
		let itemSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1),
			heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = NSDirectionalEdgeInsets(
			top: 0,
			leading: spacing,
			bottom: 0,
			trailing: spacing
		)

		let groupSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1),
			heightDimension: .fractionalWidth(0.5)
		)

		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

		group.contentInsets = NSDirectionalEdgeInsets(
			top: spacing,
			leading: spacing,
			bottom: 0,
			trailing: spacing
		)

		let section = NSCollectionLayoutSection(group: group)

		section.interGroupSpacing = spacing

		let layout = UICollectionViewCompositionalLayout(section: section)

		return layout
	}


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryCollectionViewCell
    
        // Configure the cell
		let itemSizeIndex = 4
		let url = URL(string: items[indexPath.item].sizes[itemSizeIndex].url)
		
		cell.backgroundColor = .systemTeal
		cell.clipsToBounds = true
		cell.imageView.kf.setImage(with: url)
		cell.imageView.contentMode = .scaleAspectFill
    
        return cell
    }

	// Sets custom back button for didSelectItemAt

	func setBackButtonSettings(){
		let backButton = UIBarButtonItem()
		backButton.title = ""
		backButton.image = UIImage(named: "Back_button")
		backButton.tintColor = .black
		navigationItem.backBarButtonItem = backButton
	}

    // MARK: UICollectionViewDelegate

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let viewController = ImageViewController()
		setBackButtonSettings()

		let itemSizeIndex = 6
		viewController.imageLink = items[indexPath.item].sizes[itemSizeIndex].url
		let date = Date(timeIntervalSince1970: TimeInterval(items[indexPath.item].date))
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "d MMMM YYYY"
		viewController.navigationItem.title = dateFormatter.string(from: date)
		navigationController?.pushViewController(viewController, animated: true)
	}
}
