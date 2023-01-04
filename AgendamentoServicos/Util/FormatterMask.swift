//
//  FormatterMask.swift
//  AgendamentoServicos
//
//  Created by unicred on 04/01/23.
//

import Foundation

// let mask = "###.###.###-##"

func formattedNumber(number: String, mask: String) -> String {
	let cleanCpf = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
	var result = ""
	var index = cleanCpf.startIndex
	for ch in mask where index < cleanCpf.endIndex {
		if ch == "#" {
			result.append(cleanCpf[index])
			index = cleanCpf.index(after: index)
		} else {
			result.append(ch)
		}
	}
	return result
}
