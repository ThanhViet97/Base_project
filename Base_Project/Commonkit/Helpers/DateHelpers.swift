//
//  DateHelpers.swift
//  Base_Project
//
//  Created by VietPT on 12/08/2021.
//

import Foundation

public enum DateFormat: String {
    case dmyStyle1      = "dd/MM/yyyy"
    case dmyStyle2      = "dd-MMMM-yyyy"
    case dmyStyle5      = "dd MMMM yyyy"
    case dmyStyle3      = "EE, dd/MM"
    case dmyStyle4      = "EE, dd/MM/yy"
    case dmyStyleJP1    = "M/dd (EE)"
    case dmyStyleJP2    = "yyyy/MM/dd (EE)"
    case dmyhmsStyle1   = "dd/MMMM/yyyy HH:mm:ss"
    case dmyhmsStyle2   = "dd-MMMM-yyyy HH:mm:ss"
    case ymdhmsStyle1   = "yyyy/MM/dd HH:mm:ss"
    case ymdhmsStyle2   = "yyyy-MM-dd HH:mm:ss"
    case hmdmyStyle1    = "HH:mm dd/MM/yyyy"
    case ymdmyStyle1    = "yyyy-MM-dd"
    case ymdmyStyle2    = "yyyy/MM/dd"
    case mdmyStyle1     = "MM/dd HH:mm"
    case mdmyStyle2     = "H:mm"
    case mdmyStyle3     = "EEEE"
    case mdyStyle1      = "MMMM/dd/yyyy"
    case mdyStyle2      = "MM/dd/yyyy"
    case mdyStyle4      = "MM/dd/yyyy HH:mm:ss"
    case utcStyle       = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case hmStyle        = "HH:mm"
    case hmaStyle       = "h:mma"
    case mdStyle        = "MM/dd"
}
