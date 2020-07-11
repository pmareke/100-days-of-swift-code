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
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
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
  
  @objc func shareTapped() {
    guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { return }
    
    let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}
