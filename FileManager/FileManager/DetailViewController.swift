import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  var selectedImage: String?
  var selectedImageIndex = 0
  var numberOfImages = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Picture \(selectedImageIndex) of \(numberOfImages)"
    navigationItem.largeTitleDisplayMode = .never
    
    if let loadImage = selectedImage {
      imageView.image = UIImage(named: loadImage)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }
}
