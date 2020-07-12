import UIKit

class ViewController: UIViewController {
  let label1 = UILabel()
  let label2 = UILabel()
  let label3 = UILabel()
  let label4 = UILabel()
  let label5 = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelsSetup()
    
    addSubViews()
    
    var previous: UILabel?
    
    for label in [label1, label2, label3, label4, label5] {
      label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
      label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
      label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20, constant: -10).isActive = true
      
      if let previous = previous {
        label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
      } else {
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
      }
      
      previous = label
    }
  }
  
  private func labelsSetup() {
    label1.translatesAutoresizingMaskIntoConstraints = false
    label1.backgroundColor = UIColor.red
    label1.text = "  THESE"
    label1.sizeToFit()
    
    label2.translatesAutoresizingMaskIntoConstraints = false
    label2.backgroundColor = UIColor.cyan
    label2.text = "  ARE"
    label2.sizeToFit()
    
    label3.translatesAutoresizingMaskIntoConstraints = false
    label3.backgroundColor = UIColor.yellow
    label3.text = "  SOME"
    label3.sizeToFit()
    
    label4.translatesAutoresizingMaskIntoConstraints = false
    label4.backgroundColor = UIColor.green
    label4.text = "  AWESOME"
    label4.sizeToFit()
    
    label5.translatesAutoresizingMaskIntoConstraints = false
    label5.backgroundColor = UIColor.orange
    label5.text = "  LABELS"
    label5.sizeToFit()
  }
  
  private func addSubViews() {
    view.addSubview(label1)
    view.addSubview(label2)
    view.addSubview(label3)
    view.addSubview(label4)
    view.addSubview(label5)
  }

}

