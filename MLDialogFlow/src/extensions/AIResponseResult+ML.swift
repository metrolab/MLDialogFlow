//
//  AIResponseResult+Abit.swift
//  MLDialogFlow
//
//  Created by Eli Kohen Gomez on 17/01/2018.
//  Copyright © 2018 Metropolis Lab. All rights reserved.
//

import Foundation
import ApiAI

extension AIResponseResult {
    func actionComplete(incompleteNames: [String]) -> Bool {
        guard let incomplete = actionIncomplete?.intValue, let action = action else { return false }
        if incompleteNames.contains(action) { return false }
        return incomplete == 0
    }

    var speech: String? {
        return fulfillment.messages?.flatMap { $0["speech"] as? String }.first
    }
}
