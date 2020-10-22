//
//  GrowingCell.swift
//  GrowingCellTextView
//
//  Created by SwiftDevCenter on 12/03/19.
//  Copyright © 2019 SwiftDevCenter. All rights reserved.
//

import UIKit

public protocol GrowingCellProtocol: class {
    func updateHeightOfRow(_ cell: GrowingCell, _ textView: UITextView)
}

open class GrowingCell: UITableViewCell {
    
    public weak var growingCellDelegate: GrowingCellProtocol?
    @IBOutlet public weak var textView: UITextView!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension GrowingCell: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        if let deletate = growingCellDelegate {
            deletate.updateHeightOfRow(self, textView)
        }
    }
}
