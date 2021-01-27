import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LaunchViewController: TravellerProtocol {
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        push(type: .login)
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        present(type: .signup)
    }
    
    @IBAction func storySwitchButtonPressed(_ sender: UIButton) {
        storySwitch(story: .main, destination: .main)
    }
}
