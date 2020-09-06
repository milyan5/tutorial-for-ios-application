//
//  DrawHelper.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 04/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import Foundation

import CoreGraphics
import CoreImage
import UIKit

class DrawHelper {
    
    class func createImage(with color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: UIScreen.main.bounds.size)
        let image = renderer.image { context in
            color.setFill()
            context.fill(CGRect(origin: .zero, size: UIScreen.main.bounds.size))
        }
        
        return image
    }
    
    class func createCroppingRectangles(to rects: [CGRect]) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: UIScreen.main.bounds.size)
        let image = renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: UIScreen.main.bounds.size))
            
            rects.forEach { rect in
                var cRect = rect
                let hX: CGFloat = 3
                let hY: CGFloat = 3
                cRect.origin.x -= hX
                cRect.origin.y -= hY
                cRect.size.width += hX * 2
                cRect.size.height += hY * 2
                let path = UIBezierPath(roundedRect: cRect, cornerRadius: 6).cgPath
                context.cgContext.addPath(path)
            }
            
            context.cgContext.setFillColor(UIColor.black.cgColor)
            context.cgContext.closePath()
            context.cgContext.fillPath()
        }
        return image
    }

    class func cropBlackRectangles(image: UIImage) -> UIImage? {
        let context = CIContext()
        guard let blackTransparentFilter = CIFilter(name: "CIMaskToAlpha") else { return nil }
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)
        blackTransparentFilter.setDefaults()
        blackTransparentFilter.setValue(ciImage, forKey: kCIInputImageKey)
        guard let outputImage = blackTransparentFilter.outputImage else { return nil }
        guard let cgOutputImage = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
        return UIImage(cgImage: cgOutputImage)
    }

    class func changeColor(_ color: UIColor, newColor: UIColor, image: UIImage) -> UIImage? {
        guard let falseFilter = CIFilter(name: "CIFalseColor") else { return nil }
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)
        falseFilter.setValue(ciImage, forKey: kCIInputImageKey)
        falseFilter.setValue(CIColor(color: color), forKey: "inputColor0")
        falseFilter.setValue(CIColor(color: newColor), forKey: "inputColor1")
        guard let outputImage = falseFilter.outputImage else { return nil }
        return UIImage(ciImage: outputImage)
    }

    class func drawArrow(size: CGSize, color: UIColor, startPoint: CGPoint, endPoint: CGPoint) -> UIImage {
        let renderer1 = UIGraphicsImageRenderer(size: size)
        let img1 = renderer1.image { ctx in
            ctx.cgContext.setFillColor(color.cgColor)
            ctx.cgContext.setLineWidth(2)
            let bezierPath = UIBezierPath.arrow(from: startPoint,
                                                to: endPoint,
                                                tailWidth: 2,
                                                headWidth: 15,
                                                headLength: 15)
            ctx.cgContext.addPath(bezierPath.cgPath)
            ctx.cgContext.fillPath()
        }
        return img1
    }
}
