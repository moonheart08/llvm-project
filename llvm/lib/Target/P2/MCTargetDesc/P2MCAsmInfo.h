//===-- P2MCAsmInfo.h - P2 Asm Info ----------------------------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the P2MCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCASMINFO_H
#define LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
class Triple;

class P2MCAsmInfo : public MCAsmInfoELF {
  void anchor() override;

public:
  explicit P2MCAsmInfo(const Triple &TargetTriple);
};
} // namespace llvm

#endif // LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCASMINFO_H
