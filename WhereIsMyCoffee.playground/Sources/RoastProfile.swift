import SpriteKit

public func roastProfileColor(type: String) -> UIColor {
  if type == "light" {
    return UIColor(red: 0.63137, green: 0.37647, blue: 0.231372, alpha: 1.0)
  } else if type == "medium" {
    return UIColor(red: 0.470588, green: 0.28235, blue: 0.1215686, alpha: 1.0)
  } else if type == "dark" {
    return UIColor(red: 0.207843, green: 0.141176, blue: 0.058823, alpha: 1.0)
  }
  
  return UIColor(red: 0.470588, green: 0.28235, blue: 0.1215686, alpha: 1.0)
}

public var roastProfile = "medium"
