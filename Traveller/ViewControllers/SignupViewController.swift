import UIKit

class SignupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SignupViewController: TravellerProtocol {
    @IBAction func detailsButtonPressed(_ sender: UIButton) {
        push(type: .details)
    }
}
