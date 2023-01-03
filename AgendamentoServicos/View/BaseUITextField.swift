//
// Created by Kayky Casagrande on 27/12/22.
//

import UIKit

class BaseUITextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        borderStyle = .roundedRect
        autocorrectionType = .no
    }
}
