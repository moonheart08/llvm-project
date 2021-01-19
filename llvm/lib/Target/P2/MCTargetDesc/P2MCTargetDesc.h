//===-- P2MCTargetDesc.h - P2 Target Descriptions ---------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides P2 specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCTARGETDESC_H
#define LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCTARGETDESC_H

#include "llvm/MC/MCTargetOptions.h"
#include <memory>

namespace llvm {
class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCInstrInfo;
class MCRegisterInfo;
class MCObjectTargetWriter;
class MCRegisterInfo;
class MCSubtargetInfo;
class Target;
class Triple;

std::unique_ptr<MCObjectTargetWriter> createP2ELFObjectWriter();

MCAsmBackend *createP2AsmBackend(const Target &T, const MCSubtargetInfo &STI,
                                   const MCRegisterInfo &MRI,
                                   const MCTargetOptions &Options);

MCCodeEmitter *createP2MCCodeEmitter(const MCInstrInfo &MCII,
                                       const MCRegisterInfo &MRI,
                                       MCContext &Ctx);
} // namespace llvm

#define GET_REGINFO_ENUM
#include "P2GenRegisterInfo.inc"

#define GET_INSTRINFO_ENUM
#include "P2GenInstrInfo.inc"

#endif // LLVM_LIB_TARGET_P2_MCTARGETDESC_P2MCTARGETDESC_H
