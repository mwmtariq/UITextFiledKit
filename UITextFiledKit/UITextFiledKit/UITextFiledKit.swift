//
//  UITextFiledKit.swift
//  UITextFiledKit
//
//  Created by Tariq Al-aqrabawi on 04/09/2021.
//





@IBDesignable
class UITextFiledWithIcon: UITextField {
    
    enum ImageDirection{
        case left
        case right
    }
    
    
    @IBInspectable var leftImage: UIImage = UIImage() {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage = UIImage() {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var enPadding: CGFloat = -15 {
          didSet {
              updateView()
          }
      }
    @IBInspectable var arPadding: CGFloat = 8 {
          didSet {
              updateView()
          }
      }
    @IBInspectable var hasRoundCorners: Bool = true {
        didSet {
            updateView()
        }
    }
    
    
    
    @IBInspectable var navigateToViewControll: String?
    
    
    @IBInspectable var isRequired: Bool = false {
        didSet {
            if isRequired {
               // placeholder = placeholder ?? "" + "*"
                //            var range = (placeholder! as NSString).range(of: "*")
                //            var attributedString = NSMutableAttributedString(string: "*")
                //            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
                //
                guard let rangeOfSubString = (placeholder as NSString?)?.range(of: "*") else { return}
                let rangeOfFullString = NSRange(location: 0, length: placeholder?.count ?? 0)
                let attributedString = NSMutableAttributedString(string: placeholder ?? "")
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: tintColor, range: rangeOfFullString)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: rangeOfSubString)
                attributedPlaceholder = attributedString
            }
        }
    }
    
    @IBInspectable var leftIconWidth: CGFloat = 17 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightIconWidth: CGFloat = 17 {
        didSet {
            updateView()
        }
    }
    
    
    func updateView() {
        layer.cornerRadius = hasRoundCorners ? frame.height / 2 : 10
        
        // Placeholder text color
        if let placeholderString = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholderString, attributes:[NSAttributedString.Key.foregroundColor: tintColor])
            placeholder = placeholder
        }
        
        
        textAlignment =  .left
        
        
        textColor = tintColor
        addIconToTextFiled(image: leftImage, imageDirection: .left)
        addIconToTextFiled(image: rightImage, imageDirection: .right)
        
        
    }
    
    func setRightImage(image: UIImage){
        addIconToTextFiled(image: image, imageDirection: .right)
    }
    
    func addIconToTextFiled(image: UIImage?, imageDirection : ImageDirection ){
        if let image = image {
            let _ : CGFloat = 20
            let  iconWidth = imageDirection == .left ? leftIconWidth : rightIconWidth
            let imageView = UIImageView(frame: CGRect(x:  enPadding  , y: 0, width: iconWidth, height: iconWidth))
            
            imageView.image  = image
            imageView.tintColor = tintColor
          //  imageView.contentMode = .scaleAspectFit
            
            var width = padding + iconWidth
            if borderStyle == .none || borderStyle == .line {
                width += 5
            }
            
            let view = UIView(frame: CGRect(x: enPadding , y: 20, width: width , height: iconWidth))
        //    view.addSubview(imageView)
            
            switch imageDirection {
            case .left :
                leftViewMode = .always
                leftView = view
            case .right :
                rightViewMode = .always
                rightView = view
            }
            
        } else {
            
            switch imageDirection {
            case .left :
                leftViewMode = .always
                leftView = UIView(frame: CGRect(x:  -(padding) , y: 0, width: padding, height: frame.height-2))
                
            case .right :
                leftViewMode = .always
                rightView = UIView(frame: CGRect(x:  (padding)  , y: 0, width: padding, height: frame.height-2))
            }
        }
    }
}



//
//@IBDesignable
//class MessageWithTextFiled: UITextField {
//
//
//    enum CommentStatus:Int {
//        case Wrong = 0
//        case Correct = 1
//        case Hidden = 2
//    }
//
//    var commentStatus:CommentStatus = .Hidden{
//        didSet{
//            CommentToTextFiled()
//        }
//    }
//
//    @IBInspectable var MessageStatus:Int {
//
//        get {
//            CommentToTextFiled()
//            return self.commentStatus.rawValue
//
//        }
//        set( shapeIndex) {
//            self.commentStatus = CommentStatus(rawValue: shapeIndex) ?? .Correct
//            CommentToTextFiled()
//        }
//    }
//
//
//    @IBInspectable var comment: String = "" {
//        didSet {
//            CommentToTextFiled()
//        }
//    }
//    @IBInspectable var paddingComment: Int = 0 {
//        didSet {
//            CommentToTextFiled()
//        }
//    }
//    var stackView = UIStackView(frame: CGRect(x: 53 , y: 31, width: 200 , height: 11))
//
//    func CommentToTextFiled(){
//
//        switch commentStatus {
//        case .Correct:
//            setCommentStatus(image: #imageLiteral(resourceName: "correct_icon"), comment: comment, color: #colorLiteral(red: 0, green: 0.6713829041, blue: 0, alpha: 1))
//        case .Wrong:
//            setCommentStatus(image: #imageLiteral(resourceName: "wrong_icon"), comment: comment, color: #colorLiteral(red: 1, green: 0.1723804474, blue: 0.2298367023, alpha: 1))
//
//        case .Hidden:
//            stackView.removeFromSuperview()
//           // stackView.clearSubviews()
//        }
//
//    }
//    func setCommentStatus(image: UIImage,comment:String,color:UIColor){
//        stackView.removeFromSuperview()
//       // stackView.clearSubviews()
//        let  iconWidth = 11
//        let imageView = UIImageView()
//        imageView.heightAnchor.constraint(equalToConstant: CGFloat(iconWidth)).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: CGFloat(iconWidth)).isActive = true
//        imageView.image  = image
//        imageView.contentMode = .scaleAspectFit
//
//
//        let label = UILabel()
//        label.lineBreakMode = .byWordWrapping
//        label.font = label.font.withSize(10)
//        label.textAlignment = .natural
//        label.text = comment
//        label.textColor = color
//
//        let y = self.bounds.maxY - CGFloat(iconWidth) + 18
//        let x = (leftView?.frame.width ?? 0)
//        let width = self.bounds.width - (leftView?.frame.width ?? 0)
//
//        stackView.frame = CGRect(x: x , y: y, width: width   , height: CGFloat(iconWidth))
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(label)
//        self.addSubview(stackView)
//
//    }
//}
