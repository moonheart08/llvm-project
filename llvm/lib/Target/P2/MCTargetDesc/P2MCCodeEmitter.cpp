//===-- P2MCCodeEmitter.cpp - P2 Code Emitter interface -------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the P2MCCodeEmitter class.
//
//===----------------------------------------------------------------------===//

#include "P2MCCodeEmitter.h"
#include "MCTargetDesc/P2MCTargetDesc.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/MC/MCInstBuilder.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/Support/EndianStream.h"

using namespace llvm;

#define DEBUG_TYPE "P2-mccode-emitter"

STATISTIC(MCNumEmitted, "Number of MC instructions emitted");

unsigned P2MCCodeEmitter::getOImmOpValue(const MCInst &MI, unsigned Idx,
                                           SmallVectorImpl<MCFixup> &Fixups,
                                           const MCSubtargetInfo &STI) const {
  llvm_unreachable("P2MCCodeEmitter::getOImmOpValue unimplemented!");
}

void P2MCCodeEmitter::encodeInstruction(const MCInst &MI, raw_ostream &OS,
                                          SmallVectorImpl<MCFixup> &Fixups,
                                          const MCSubtargetInfo &STI) const {
  llvm_unreachable("P2MCCodeEmitter::encodeInstruction unimplemented!");
}

unsigned
P2MCCodeEmitter::getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                                     SmallVectorImpl<MCFixup> &Fixups,
                                     const MCSubtargetInfo &STI) const {
  llvm_unreachable("P2MCCodeEmitter::getMachineOpValue unimplemented!");
}

MCCodeEmitter *llvm::createP2MCCodeEmitter(const MCInstrInfo &MCII,
                                             const MCRegisterInfo &MRI,
                                             MCContext &Ctx) {
  return new P2MCCodeEmitter(Ctx, MCII);
}

#include "P2GenMCCodeEmitter.inc"
