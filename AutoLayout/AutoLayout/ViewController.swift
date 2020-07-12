import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var firstFlag: UIButton!
  @IBOutlet weak var secondFlag: UIButton!
  @IBOutlet weak var thirdFlag: UIButton!
  
  var score = 0
  var countries = [String]()
  var correctAnwser = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    firstFlag.layer.borderWidth = 1
    firstFlag.layer.borderColor = UIColor.lightGray.cgColor
    
    secondFlag.layer.borderWidth = 1
    secondFlag.layer.borderColor = UIColor.lightGray.cgColor
    
    thirdFlag.layer.borderWidth = 1
    thirdFlag.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion(action: nil)
  }
  
  func askQuestion(action: UIAlertAction!) {
    countries.shuffle()
    correctAnwser = Int.random(in: 0...2)
    
    firstFlag.setImage(UIImage(named: countries[0]), for: .normal)
    secondFlag.setImage(UIImage(named: countries[1]), for: .normal)
    thirdFlag.setImage(UIImage(named: countries[2]), for: .normal)
    
    title = countries[correctAnwser].uppercased()
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    
    if sender.tag == correctAnwser {
      title = "Correct"
      score += 1
    } else {
      title = "Wrong"
      score -= 1
    }
    
    let ac = UIAlertController(title: title, message: "Your score is: \(score).", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
    present(ac, animated: true)
  }
}

