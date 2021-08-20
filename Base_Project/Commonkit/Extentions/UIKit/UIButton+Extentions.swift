//
//  UIButton+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 13/08/2021.
//

import UIKit

extension UIButton {
    
  @IBInspectable
  var imageForDisabled: UIImage? {
    get {
      return image(for: .disabled)
    }
    set {
      setImage(newValue, for: .disabled)
    }
  }

  @IBInspectable
  var imageForHighlighted: UIImage? {
    get {
      return image(for: .highlighted)
    }
    set {
      setImage(newValue, for: .highlighted)
    }
  }

  @IBInspectable
  var imageForNormal: UIImage? {
    get {
      return image(for: .normal)
    }
    set {
      setImage(newValue, for: .normal)
    }
  }

  @IBInspectable
  var imageForSelected: UIImage? {
    get {
      return image(for: .selected)
    }
    set {
      setImage(newValue, for: .selected)
    }
  }

  @IBInspectable
  var titleColorForDisabled: UIColor? {
    get {
      return titleColor(for: .disabled)
    }
    set {
      setTitleColor(newValue, for: .disabled)
    }
  }

  @IBInspectable
  var titleColorForHighlighted: UIColor? {
    get {
      return titleColor(for: .highlighted)
    }
    set {
      setTitleColor(newValue, for: .highlighted)
    }
  }

  @IBInspectable
  var titleColorForNormal: UIColor? {
    get {
      return titleColor(for: .normal)
    }
    set {
      setTitleColor(newValue, for: .normal)
    }
  }

  @IBInspectable
  var titleColorForSelected: UIColor? {
    get {
      return titleColor(for: .selected)
    }
    set {
      setTitleColor(newValue, for: .selected)
    }
  }

  @IBInspectable
  var titleForDisabled: String? {
    get {
      return title(for: .disabled)
    }
    set {
      setTitle(newValue, for: .disabled)
    }
  }

  @IBInspectable
  var titleForHighlighted: String? {
    get {
      return title(for: .highlighted)
    }
    set {
      setTitle(newValue, for: .highlighted)
    }
  }

  @IBInspectable
  var titleForNormal: String? {
    get {
      return title(for: .normal)
    }
    set {
      setTitle(newValue, for: .normal)
    }
  }

  @IBInspectable
  var titleForSelected: String? {
    get {
      return title(for: .selected)
    }
    set {
      setTitle(newValue, for: .selected)
    }
  }
}
