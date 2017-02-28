import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let userTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let registerButton = UIButton(type: .system)
    private let logoImageView = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainColor =
            UIColor.init(colorLiteralRed: 0, green: 130.0/256, blue: 203.0/256, alpha: 1.0)
        self.view.backgroundColor = mainColor
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        // Creating the imageView
        logoImageView.frame = (frame: CGRect(x:0, y:0, width:width/2, height:width/2))
        logoImageView.center = CGPoint(x: width/2, y:height*1/3)
        logoImageView.image = #imageLiteral(resourceName: "h4i_square_white")
        self.view.addSubview(logoImageView)
        
        
        // Creating the username label
        userTextField.frame = (frame: CGRect(x:0, y:0, width:240, height:30))
        userTextField.center = CGPoint(x: width/2, y: height*7/12)
        userTextField.backgroundColor = UIColor.white
        userTextField.layer.cornerRadius = 8
        userTextField.delegate = self
        userTextField.keyboardType = UIKeyboardType.default
        userTextField.returnKeyType = UIReturnKeyType.done
        userTextField.placeholder = "  Email"
        self.view.addSubview(userTextField)
        
        // Creating the password label
        passwordTextField.frame = (frame: CGRect(x:0, y:0, width:240, height:30))
        passwordTextField.center = CGPoint(x: width/2, y: height*2/3)
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.delegate = self
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.placeholder = "  Password"
        self.view.addSubview(passwordTextField)
        
        // Creating the login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.frame = (frame: CGRect(x: 0, y: 0, width: 240, height: 30))
        loginButton.center = CGPoint(x: width/2, y: height*3/4)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.backgroundColor = UIColor.white
        loginButton.setTitleColor(mainColor, for: .normal)
        loginButton.layer.cornerRadius = 8
        self.view.addSubview(loginButton)
        
        // Creating the register button
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.frame = (frame: CGRect(x: 0, y: 0, width: 240, height: 30))
        registerButton.center = CGPoint(x: width/2, y: height*11/12)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.backgroundColor = UIColor.white
        registerButton.setTitleColor(mainColor, for: .normal)
        registerButton.layer.cornerRadius = 8
        self.view.addSubview(registerButton)
        
        // Creating a keyboard dismiss
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        self.view.isUserInteractionEnabled = true
    }

    func registerButtonTapped() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

    func loginButtonTapped() {
        // validate user input against database
        
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }

    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}
